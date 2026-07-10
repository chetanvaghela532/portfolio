// Flutter imports:
import 'package:flutter/widgets.dart';

/// Drives the in-app "Ctrl+F" search.
///
/// Holds the query, the ordered list of matching target ids and the current
/// selection, and scrolls the active match into view. Searchable widgets read
/// this via Provider: [SearchTarget] registers a scroll key per id, and
/// `HighlightText` paints the yellow highlight on matching text.
class PortfolioSearchController extends ChangeNotifier {
  bool _isOpen = false;
  bool get isOpen => _isOpen;

  String _query = '';
  String get query => _query;
  String get _q => _query.trim().toLowerCase();

  final List<String> _matches = [];
  int _current = -1;

  // Stable scroll keys per searchable target, created lazily.
  final Map<String, GlobalKey> _keys = {};
  GlobalKey keyFor(final String id) => _keys.putIfAbsent(id, () => GlobalKey());

  int get matchCount => _matches.length;

  /// 1-based position of the active match (0 when there are none).
  int get currentPosition => _matches.isEmpty ? 0 : _current + 1;

  String? get _currentId =>
      (_current >= 0 && _current < _matches.length) ? _matches[_current] : null;

  bool isCurrent(final String id) => _currentId == id;

  void open() {
    if (_isOpen) return;
    _isOpen = true;
    notifyListeners();
  }

  void close() {
    if (!_isOpen && _query.isEmpty) return;
    _isOpen = false;
    _query = '';
    _matches.clear();
    _current = -1;
    notifyListeners();
  }

  /// Recomputes matches from [haystack] (ordered `id -> searchable text`),
  /// keeping the on-screen order so next/previous feel natural.
  void search(
    final String query,
    final List<MapEntry<String, String>> haystack,
  ) {
    _query = query;
    _matches.clear();
    if (_q.isNotEmpty) {
      for (final entry in haystack) {
        if (entry.value.toLowerCase().contains(_q) &&
            !_matches.contains(entry.key)) {
          _matches.add(entry.key);
        }
      }
    }
    _current = _matches.isEmpty ? -1 : 0;
    notifyListeners();
    _scrollToCurrent();
  }

  void next() {
    if (_matches.isEmpty) return;
    _current = (_current + 1) % _matches.length;
    notifyListeners();
    _scrollToCurrent();
  }

  void previous() {
    if (_matches.isEmpty) return;
    _current = (_current - 1 + _matches.length) % _matches.length;
    notifyListeners();
    _scrollToCurrent();
  }

  void _scrollToCurrent() {
    final id = _currentId;
    if (id == null) return;
    // Wait a frame so the highlight rebuild has laid out before scrolling.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _keys[id]?.currentContext;
      if (ctx != null) {
        Scrollable.ensureVisible(
          ctx,
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeInOutCubic,
          alignment: 0.15,
        );
      }
    });
  }
}
