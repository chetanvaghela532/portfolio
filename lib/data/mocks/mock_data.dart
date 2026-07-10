import 'package:meu_curriculo_flutter/data/models/certificate_model.dart';
import 'package:meu_curriculo_flutter/data/models/experience_model.dart';
import 'package:meu_curriculo_flutter/data/models/project_model.dart';
import 'package:meu_curriculo_flutter/data/models/skill_model.dart';

class MockData {
  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      role: 'Freelance Flutter Consultant',
      company: 'Self-Employed',
      period: 'Jan 2026 - Present',
      description:
          'Working independently with product teams on Flutter architecture, feature delivery, app-store releases, performance tuning, subscriptions, and production support across mobile and cross-platform products.',
      isCurrent: true,
    ),
    ExperienceModel(
      role: 'Senior Flutter Developer',
      company: '360 Degree Technosoft',
      period: 'Jun 2023 - Dec 2025',
      description:
          'Architected and shipped 10+ Flutter apps across iOS, Android, Android TV, and Fire TV using Clean Architecture and BLoC/Riverpod. Built GraphQL backends with Node.js + PostgreSQL, integrated RevenueCat + Stripe, reduced crashes by 85%, and mentored junior developers.',
    ),
    ExperienceModel(
      role: 'Senior Android & Flutter Developer (Freelance)',
      company: 'Open Source Infotech',
      period: 'Jun 2020 - May 2023',
      description:
          'Delivered 10+ subscription and ad-supported apps across multiple client domains. Helped products reach 10M+ total downloads through analytics-driven optimization, monetization work, release discipline, and architecture support.',
    ),
    ExperienceModel(
      role: 'Android Engineer',
      company: 'Bigscal Technologies',
      period: 'Jun 2019 - May 2020',
      description:
          'Developed Kotlin modules for the Healthray telemedicine platform, covering consultation, billing, reports, and payments. Worked with MVVM, Retrofit, Firebase, testing, coroutines, and app-size optimization.',
    ),
  ];

  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'RightAlly - Brokerage Revenue Share Platform',
      description:
          'Built a Flutter mobile experience for an AI-first brokerage operations platform focused on revenue-share automation, referral tracking, agent income visibility, payout workflows, and post-deal operational clarity for growing real-estate teams.',
      techStack: ['Flutter', 'Clean Architecture', 'REST APIs'],
      repoUrl: 'https://www.rightally.io/',
    ),
    ProjectModel(
      title: 'TikTraq - Realtor Field App',
      description:
          'Built a Flutter app for realtor workflows with full map experiences, live location updates, field coordination, and mobile-first property operations for agents on the move.',
      techStack: ['Flutter', 'Google Maps', 'Live Location', 'REST APIs'],
      repoUrl: 'https://tiktraq.com/',
    ),
    ProjectModel(
      title: 'Karebo',
      description:
          'Shipped a production Flutter app for Karebo with polished mobile UX, scalable architecture, backend integrations, and release-ready Android delivery published on Google Play.',
      techStack: ['Flutter', 'BLoC', 'REST APIs', 'Android'],
      repoUrl:
          'https://play.google.com/store/apps/details?id=com.karebo.android',
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.karebo.android',
    ),
    ProjectModel(
      title: 'ABP Live TV',
      description:
          'Contributed to the ABP Live streaming app with live TV, news video delivery, playback reliability, and engagement-focused mobile experiences for a large-scale news audience.',
      techStack: ['Android', 'Android TV', 'Live TV', 'Leanback', 'VAST Ads'],
      repoUrl: 'https://play.google.com/store/apps/details?id=com.abpnewslive',
      liveUrl: 'https://play.google.com/store/apps/details?id=com.abpnewslive',
    ),
    ProjectModel(
      title: 'ABP Live - Android Auto News App',
      description:
          'Built Android Auto support for ABP Live with hands-free news listening, live TV audio, podcast playback controls, and VAST audio ads to extend news consumption into the car experience.',
      techStack: ['Android Auto', 'Android', 'Audio', 'VAST Ads'],
      repoUrl:
          'https://play.google.com/store/apps/details?id=com.abplive.auto.android',
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.abplive.auto.android',
    ),
    ProjectModel(
      title: 'Aquaint - Food Safety & Compliance',
      description:
          'Worked on a large-scale enterprise compliance app for restaurants and food chains, covering operational checklists, temperature logs, incident tracking, reporting, and photo evidence workflows.',
      techStack: ['Kotlin', 'XML', 'Room DB', 'WorkManager'],
      repoUrl: 'https://play.google.com/store/apps/details?id=com.aquaint',
      liveUrl: 'https://play.google.com/store/apps/details?id=com.aquaint',
    ),
    ProjectModel(
      title: 'Calry AI - AI Calorie Counter',
      description:
          'Solo-built nutrition app with AI food recognition, camera scanning, planner flows, and subscription monetization. Strong proof of product ownership and execution speed.',
      techStack: ['Flutter', 'BLoC', 'Supabase', 'RevenueCat'],
      repoUrl:
          'https://play.google.com/store/apps/details?id=com.calories.tracker.calryai',
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.calories.tracker.calryai',
    ),
    ProjectModel(
      title: 'Expirely - Smart Expiry Date Tracker',
      description:
          'Privacy-first inventory product with OCR date scanning, receipt scanning, reminders, and barcode flows. Built and shipped as a solo product.',
      techStack: ['Flutter', 'BLoC', 'ML Kit OCR', 'RevenueCat'],
      repoUrl: 'https://github.com/chetanvaghela457',
    ),
    ProjectModel(
      title: 'Urban India - Groceries Online',
      description:
          'Customer and delivery ecosystem for the Canada market with real-time tracking, payments, and loyalty flows. Achieved 5K+ downloads and 4.8 rating.',
      techStack: ['Flutter', 'BLOC', 'Stripe', 'Firebase'],
      repoUrl: 'https://play.google.com/store/apps/details?id=com.urbanindia',
      liveUrl: 'https://play.google.com/store/apps/details?id=com.urbanindia',
    ),
    ProjectModel(
      title: 'BuildIndia ERP - Field Sales & Operations',
      description:
          'Enterprise field-sales app with dashboards, background location, selfie verification, task hierarchy, maps, and team sync for 500+ daily users.',
      techStack: ['Flutter', 'Riverpod', 'Google Maps', 'Firebase'],
      repoUrl: 'https://apps.apple.com/in/app/buildindia/id6738859658',
      liveUrl: 'https://apps.apple.com/in/app/buildindia/id6738859658',
    ),
    ProjectModel(
      title: 'Jazzbooks Streaming',
      description:
          'iOS-only streaming app for 2,000+ musicians with tempo/key changer and dual-track playback. Strong example of deep iOS-native integration.',
      techStack: ['Flutter', 'AVFoundation', 'Audio'],
      repoUrl: 'https://apps.apple.com/in/app/jazzbooks-streaming/id1667200133',
      liveUrl: 'https://apps.apple.com/in/app/jazzbooks-streaming/id1667200133',
    ),
    ProjectModel(
      title: 'Daily Case - Advocate Diary',
      description:
          'Full-stack legal productivity app with GraphQL backend, reminders, document workflows, and subscription monetization.',
      techStack: ['Flutter', 'BLoC', 'Node.js'],
      repoUrl:
          'https://play.google.com/store/apps/details?id=com.dailycase.advocate_diary',
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.dailycase.advocate_diary',
    ),
    ProjectModel(
      title: 'Strimm - Smart TV Streaming Platform',
      description:
          'Led a Smart TV streaming product across Android TV and Fire TV with IPTV integration, Leanback navigation, ExoPlayer playback, and a TV-first viewing experience for active streaming users.',
      techStack: ['Kotlin', 'ExoPlayer', 'Leanback', 'IPTV'],
      repoUrl: 'https://amazon.com/dp/B0CWH7D917',
      liveUrl: 'https://amazon.com/dp/B0CWH7D917',
    ),
  ];

  static const List<SkillModel> skills = [
    SkillModel(name: 'Flutter', type: SkillType.mobile, isHighlight: true),
    SkillModel(name: 'Dart', type: SkillType.mobile, isHighlight: true),
    SkillModel(name: 'Android TV', type: SkillType.mobile),
    SkillModel(name: 'Fire TV', type: SkillType.mobile),
    SkillModel(name: 'Android Auto', type: SkillType.mobile),
    SkillModel(name: 'iOS Deployment', type: SkillType.mobile),
    SkillModel(name: 'Node.js', type: SkillType.web, isHighlight: true),
    SkillModel(name: 'GraphQL', type: SkillType.web, isHighlight: true),
    SkillModel(name: 'PostgreSQL', type: SkillType.web),
    SkillModel(name: 'Firebase', type: SkillType.web, isHighlight: true),
    SkillModel(name: 'REST APIs', type: SkillType.web),
    SkillModel(name: 'WebSocket', type: SkillType.web),
    SkillModel(
      name: 'GitHub Actions',
      type: SkillType.tools,
      isHighlight: true,
    ),
    SkillModel(name: 'Fastlane', type: SkillType.tools),
    SkillModel(name: 'RevenueCat', type: SkillType.tools, isHighlight: true),
    SkillModel(name: 'Stripe', type: SkillType.tools),
    SkillModel(name: 'Crashlytics', type: SkillType.tools),
    SkillModel(name: 'Docker', type: SkillType.tools),
  ];

  static const List<CertificateModel> certificates = [
    CertificateModel(
      title: 'Flutter & Dart - The Complete Guide',
      issuer: 'Udemy',
      date: '2024',
      description: 'Complete guide to Flutter and Dart development.',
      language: 'Dart',
      framework: 'Flutter',
      credentialUrl: '',
    ),
    CertificateModel(
      title: 'Clean Architecture in Flutter',
      issuer: 'Udemy',
      date: '2024',
      description:
          'Clean Architecture principles applied to production Flutter apps.',
      language: 'Dart',
      framework: 'Flutter',
      credentialUrl: '',
    ),
  ];

  static const List<CertificateModel> highlights = [
    CertificateModel(
      title: 'Business Impact',
      issuer: 'Career Highlights',
      date: '2019 - Present',
      description:
          'Improved recurring revenue by 40%, reduced crashes by 85%, and supported products that reached more than 10 million total downloads.',
      language: '40% Revenue',
      framework: '85% Stability',
      credentialUrl: '',
    ),
    CertificateModel(
      title: 'Shipping Track Record',
      issuer: 'Delivery',
      date: '50+ Releases',
      description:
          'Published more than 50 apps across Google Play, the App Store, and Amazon Appstore for mobile, TV, streaming, and AI products.',
      language: '50+ Apps',
      framework: 'Cross-Platform',
      credentialUrl: '',
    ),
    CertificateModel(
      title: 'Remote Readiness',
      issuer: 'Work Style',
      date: 'Available Now',
      description:
          'Immediate joiner with EST/PST overlap, async-first collaboration, and ownership from architecture through release.',
      language: 'Remote',
      framework: 'Immediate Joiner',
      credentialUrl: '',
    ),
  ];

  static const List<CertificateModel> education = [
    CertificateModel(
      title: 'B.Tech in Computer Science & Engineering',
      issuer: 'Parul University',
      date: '2015 - 2019',
      description:
          'Completed in Vadodara, Gujarat, with a focus on software engineering fundamentals and core computer science.',
      language: 'B.Tech',
      framework: 'Computer Science',
      credentialUrl: '',
    ),
  ];
}
