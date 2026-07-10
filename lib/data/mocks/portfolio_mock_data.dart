import 'package:flutter/material.dart';

import '../models/capability.dart';
import '../models/contact_item.dart';
import '../models/experience_item.dart';
import '../models/portfolio_stat.dart';
import '../models/project_item.dart';
import '../models/skill_group.dart';

const portfolioStats = [
  PortfolioStat('6+', 'Years experience'),
  PortfolioStat('40%', 'Revenue uplift'),
  PortfolioStat('85%', 'Crash reduction'),
  PortfolioStat('10M+', 'Total downloads'),
];

const capabilities = [
  Capability(
    icon: Icons.phone_iphone_rounded,
    title: 'Cross-platform mobile apps',
    description:
        'Production Flutter delivery for iOS and Android with clean architecture, stable releases, and strong product execution.',
  ),
  Capability(
    icon: Icons.tv_rounded,
    title: 'Android TV / Fire TV',
    description:
        'Media and streaming experiences for big-screen platforms with ExoPlayer, Leanback, and performance-focused playback flows.',
  ),
  Capability(
    icon: Icons.directions_car_filled_rounded,
    title: 'Android Auto experiences',
    description:
        'In-car audio and news products designed for safe interactions, playback control, and platform-specific UX constraints.',
  ),
  Capability(
    icon: Icons.design_services_rounded,
    title: 'Product-minded UI implementation',
    description:
        'High-quality interfaces translated into polished, responsive app experiences that feel fast, clear, and trustworthy.',
  ),
];

const experienceItems = [
  ExperienceItem(
    company: '360 Degree Technosoft',
    role: 'Senior Flutter Developer',
    period: 'June 2023 - Present',
    location: 'Ahmedabad, India',
    bullets: [
      'Architected and shipped 10+ Flutter apps across iOS, Android, Android TV, and Fire TV using Clean Architecture and BLoC/Riverpod.',
      'Built full-stack GraphQL backends with Node.js + PostgreSQL and real-time WebSocket updates serving 1K+ active users.',
      'Integrated RevenueCat + Stripe across multiple apps, driving a 40% increase in recurring revenue.',
      'Led Strimm Smart TV platform with ExoPlayer, Leanback, and IPTV; reduced app size by 30% and crashes by 85%.',
      'Established CI/CD with GitHub Actions + Fastlane and mentored 5 junior developers.',
    ],
  ),
  ExperienceItem(
    company: 'Open Source Infotech',
    role: 'Senior Android & Flutter Developer (Freelance)',
    period: 'June 2020 - May 2023',
    location: 'Surat, India',
    bullets: [
      'Delivered 10+ subscription and ad-supported apps across multiple client domains.',
      'Helped products reach 10M+ total downloads through analytics-driven optimization and release discipline.',
      'Worked across architecture, code reviews, monetization, and junior mentoring while managing multiple client projects.',
    ],
  ),
  ExperienceItem(
    company: 'Bigscal Technologies',
    role: 'Android Engineer',
    period: 'June 2019 - May 2020',
    location: 'Surat, India',
    bullets: [
      'Developed core Kotlin modules for the Healthray telemedicine platform covering consultation, billing, reports, and payments.',
      'Worked with MVVM, Retrofit, Firebase, testing, and coroutines in a production healthcare app.',
      'Reduced app size by 30% through asset and build optimization.',
    ],
  ),
];

const skillGroups = [
  SkillGroup(
    title: 'Languages & Frameworks',
    items: [
      'Dart',
      'Kotlin',
      'Flutter',
      'Flutter Web',
      'BLoC',
      'Riverpod',
      'GetX',
      'Clean Architecture',
    ],
  ),
  SkillGroup(
    title: 'State, Backend & Cloud',
    items: [
      'Provider',
      'GraphQL',
      'WebSocket',
      'Node.js',
      'PostgreSQL',
      'Firebase Auth',
      'Firestore',
      'REST APIs',
    ],
  ),
  SkillGroup(
    title: 'Monetization & Delivery',
    items: [
      'RevenueCat',
      'Stripe',
      'Razorpay',
      'Apple IAP',
      'Google Play Billing',
      'GitHub Actions',
      'Fastlane',
      'Crashlytics',
    ],
  ),
];

const featuredProjects = [
  ProjectItem(
    kicker: 'Featured solo product',
    title: 'Calry AI - AI Calorie Counter',
    description:
        'Solo-built nutrition app with AI food recognition, camera scanning, planner flows, and subscription monetization. BLoC keeps the camera to AI to nutrition to planner to subscription state clean and reliable.',
    outcome:
        'Live on Google Play. Strong proof of product ownership and execution speed.',
    imagePath: 'assets/images/calry-home.png',
    stack: ['Flutter', 'BLoC', 'Firebase', 'RevenueCat'],
    url:
        'https://play.google.com/store/apps/details?id=com.calories.tracker.calryai',
  ),
  ProjectItem(
    kicker: 'Featured enterprise product',
    title: 'BuildIndia ERP - Field Sales & Operations',
    description:
        'Enterprise field-sales app with background location, dashboards, selfie verification, task hierarchy, and team sync. Riverpod supported real-time, multi-screen coordination without making the workflow brittle.',
    outcome:
        '500+ daily users and a strong example of business-critical app delivery.',
    imagePath: 'assets/images/BuildIndia.png',
    stack: ['Flutter', 'Riverpod', 'Google Maps', 'Firebase'],
    url: 'https://apps.apple.com/in/app/buildindia/id6738859658',
  ),
  ProjectItem(
    kicker: 'Featured client product',
    title: 'Urban India - Groceries Online',
    description:
        'Customer and delivery ecosystem for the Canada market with real-time tracking, payments, and loyalty flows. Riverpod scaled well across shared state for customer and delivery experiences.',
    outcome: '5K+ downloads, 4.8 rating, and 28% repeat orders.',
    imagePath: 'assets/images/Urban_India.png',
    stack: ['Flutter', 'Riverpod', 'Stripe', 'Firebase'],
    url: 'https://play.google.com/store/apps/details?id=com.urbanindia',
  ),
];

const secondaryProjects = [
  ProjectItem(
    kicker: 'More production work',
    title: 'Expirely - Smart Expiry Date Tracker',
    description:
        'Privacy-first inventory product with OCR date scanning, receipt scanning, reminders, and barcode flows.',
    outcome: 'Recently shipped with public store rollout in progress.',
    imagePath: 'assets/images/expirely_1.png',
    stack: ['Flutter', 'BLoC', 'ML Kit OCR', 'RevenueCat'],
  ),
  ProjectItem(
    kicker: 'More production work',
    title: 'Jazzbooks Streaming',
    description:
        'iOS-only streaming app for 2,000+ musicians with tempo/key changer and dual-track playback.',
    outcome: 'Strong example of Flutter + native iOS audio integration.',
    imagePath: 'assets/images/Jazzbook.png',
    stack: ['Flutter', 'AVFoundation', 'Audio'],
    url: 'https://apps.apple.com/in/app/jazzbooks-streaming/id1667200133',
  ),
  ProjectItem(
    kicker: 'More production work',
    title: 'Daily Case - Advocate Diary',
    description:
        'Full-stack legal productivity app with GraphQL backend, reminders, document workflows, and subscriptions.',
    outcome: 'Demonstrates backend + app ownership in one product.',
    imagePath: 'assets/images/DailyCase.png',
    stack: ['Flutter', 'BLoC', 'Node.js'],
    url:
        'https://play.google.com/store/apps/details?id=com.dailycase.advocate_diary',
  ),
  ProjectItem(
    kicker: 'More production work',
    title: 'Strimm - Smart TV Streaming Platform',
    description:
        'Android TV / Fire TV streaming platform with IPTV, ExoPlayer, Leanback, and performance-focused playback.',
    outcome: '1K+ active users and deep TV-platform expertise.',
    imagePath: 'assets/images/BigBear_tv.png',
    stack: ['Kotlin', 'ExoPlayer', 'Leanback'],
    url: 'https://www.amazon.com/dp/B0CWH7D917',
  ),
  ProjectItem(
    kicker: 'More production work',
    title: 'ABP LIVE - Android Auto News App',
    description:
        'India first Android Auto news and podcast experience with in-car playback controls and VAST audio ads.',
    outcome: 'Strong proof of platform-specific UX and audio product work.',
    imagePath: 'assets/images/abp_live.png',
    stack: ['Android Auto', 'Audio', 'Ads'],
    url:
        'https://play.google.com/store/apps/details?id=com.abplive.auto.android',
  ),
  ProjectItem(
    kicker: 'More production work',
    title: 'Aquaint - Food Safety & Compliance',
    description:
        'Enterprise Kotlin app for restaurant compliance, task workflows, reporting, and photo evidence capture.',
    outcome: 'Operational workflow depth beyond standard consumer apps.',
    imagePath: 'assets/images/Aquaint.png',
    stack: ['Kotlin', 'WorkManager', 'Firebase'],
    url: 'https://play.google.com/store/apps/details?id=com.aquaint',
  ),
];

const availabilityItems = [
  'Immediate joiner',
  'EST / PST overlap available',
  'Full-time remote or contract',
  'Strong with startup and product teams',
];

const contactItems = [
  ContactItem(
    icon: Icons.email_outlined,
    label: 'Email',
    value: 'chetanvaghela457@gmail.com',
    url: 'mailto:chetanvaghela457@gmail.com',
  ),
  ContactItem(
    icon: Icons.phone_android_rounded,
    label: 'Phone',
    value: '+91 8154073974',
    url: 'tel:+918154073974',
  ),
  ContactItem(
    icon: Icons.code_rounded,
    label: 'GitHub',
    value: 'github.com/chetanvaghela457',
    url: 'https://github.com/chetanvaghela457',
  ),
  ContactItem(
    icon: Icons.work_outline_rounded,
    label: 'LinkedIn',
    value: 'linkedin.com/in/chetanvaghela457',
    url: 'https://www.linkedin.com/in/chetanvaghela457/',
  ),
  ContactItem(
    icon: Icons.location_on_outlined,
    label: 'Location',
    value: 'Surat, Gujarat, India - Open to remote',
    url: 'https://www.google.com/maps?q=Surat,+Gujarat,+India',
  ),
];
