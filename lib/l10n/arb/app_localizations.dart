// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

// Project imports:
import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Franklyn Roberto - Portfolio'**
  String get appTitle;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to load data. Check your connection.'**
  String get errorMessage;

  /// No description provided for @adminModeDetected.
  ///
  /// In en, this message translates to:
  /// **'🕵️ Admin Mode Detected!'**
  String get adminModeDetected;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @heroGreeting.
  ///
  /// In en, this message translates to:
  /// **'// hi, my name is'**
  String get heroGreeting;

  /// No description provided for @heroAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available for new opportunities'**
  String get heroAvailable;

  /// No description provided for @heroContact.
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get heroContact;

  /// No description provided for @downloadCv.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get downloadCv;

  /// No description provided for @adminPanel.
  ///
  /// In en, this message translates to:
  /// **'Admin panel'**
  String get adminPanel;

  /// No description provided for @sectionSkills.
  ///
  /// In en, this message translates to:
  /// **'Stack & Tools'**
  String get sectionSkills;

  /// No description provided for @sectionExperience.
  ///
  /// In en, this message translates to:
  /// **'Professional Experience'**
  String get sectionExperience;

  /// No description provided for @sectionProjects.
  ///
  /// In en, this message translates to:
  /// **'Featured Projects'**
  String get sectionProjects;

  /// No description provided for @sectionCertificates.
  ///
  /// In en, this message translates to:
  /// **'Certificates'**
  String get sectionCertificates;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @viewDemo.
  ///
  /// In en, this message translates to:
  /// **'View Demo'**
  String get viewDemo;

  /// No description provided for @footerMadeWith.
  ///
  /// In en, this message translates to:
  /// **'// built with Flutter & Supabase'**
  String get footerMadeWith;

  /// No description provided for @backToTop.
  ///
  /// In en, this message translates to:
  /// **'back to top'**
  String get backToTop;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search on page…'**
  String get searchHint;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'no results'**
  String get searchNoResults;

  /// No description provided for @searchPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous (Shift+Enter)'**
  String get searchPrevious;

  /// No description provided for @searchNext.
  ///
  /// In en, this message translates to:
  /// **'Next (Enter)'**
  String get searchNext;

  /// No description provided for @searchClose.
  ///
  /// In en, this message translates to:
  /// **'Close (Esc)'**
  String get searchClose;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
