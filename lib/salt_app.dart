import 'package:flutter/material.dart';
import 'package:salt/resources/app_theme.dart';
import 'package:salt/salt_app.dart';
import 'package:salt/service/navigation_service.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SaltApp extends StatelessWidget {
  const SaltApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationService = NavigationService();
    return MaterialApp(
      title: 'Salt',
      navigatorKey: NavigationService.systemNavigatorKey,
      theme: appThemeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)?.appName ?? "Salt",
      routes: navigationService.routes,
      initialRoute: navigationService.initialRoute,
    );
  }
}
