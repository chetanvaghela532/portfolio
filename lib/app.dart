import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'data/repositories/portfolio_repository.dart';
import 'l10n/arb/app_localizations.dart';
import 'presentation/controllers/portfolio_controller.dart';
import 'presentation/pages/home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IPortfolioRepository>(create: (_) => PortfolioRepository()),
        ChangeNotifierProvider<PortfolioController>(
          create: (context) =>
              PortfolioController(context.read<IPortfolioRepository>())
                ..loadAllData(),
        ),
      ],
      child: Consumer<PortfolioController>(
        builder: (context, controller, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Chetan Vaghela Portfolio',
            onGenerateTitle: (context) =>
                AppLocalizations.of(context)?.appTitle ??
                'Chetan Vaghela Portfolio',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: controller.themeMode,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
