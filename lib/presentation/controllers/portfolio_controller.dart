import 'package:flutter/material.dart';

import 'package:meu_curriculo_flutter/data/models/certificate_model.dart';
import 'package:meu_curriculo_flutter/data/models/experience_model.dart';
import 'package:meu_curriculo_flutter/data/models/project_model.dart';
import 'package:meu_curriculo_flutter/data/models/skill_model.dart';
import 'package:meu_curriculo_flutter/data/repositories/portfolio_repository.dart';

class PortfolioController extends ChangeNotifier {
  PortfolioController(this.repository);

  final IPortfolioRepository repository;

  List<ProjectModel> projects = [];
  List<ExperienceModel> experiences = [];
  List<SkillModel> skills = [];
  List<CertificateModel> certificates = [];
  List<CertificateModel> highlights = [];
  List<CertificateModel> education = [];
  bool isLoading = true;
  String? errorMessage;

  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }

  final ScrollController scrollController = ScrollController();
  final heroKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final certificatesKey = GlobalKey();
  final highlightsKey = GlobalKey();
  final educationKey = GlobalKey();

  Future<void> scrollToSection(final GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Future<void> loadAllData() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final results = await Future.wait([
        repository.getProjects(),
        repository.getExperiences(),
        repository.getSkills(),
        repository.getCertificates(),
        repository.getHighlights(),
        repository.getEducation(),
      ]);

      projects = results[0] as List<ProjectModel>;
      experiences = results[1] as List<ExperienceModel>;
      skills = results[2] as List<SkillModel>;
      certificates = results[3] as List<CertificateModel>;
      highlights = results[4] as List<CertificateModel>;
      education = results[5] as List<CertificateModel>;
    } catch (_) {
      errorMessage = 'Failed to load portfolio data.';
    }

    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
