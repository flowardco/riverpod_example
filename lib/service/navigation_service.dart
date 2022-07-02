import 'package:flutter/material.dart';
import 'package:salt/ui/page/home_page.dart';
import 'package:salt/ui/page/splash_page.dart';

class NavigationService {
  static GlobalKey<NavigatorState> systemNavigatorKey =
      GlobalKey<NavigatorState>();

  NavigationService._privateConstructor();

  static final NavigationService _instance =
      NavigationService._privateConstructor();

  factory NavigationService() {
    return _instance;
  }

  String get initialRoute => SplashPage.id;

  var routes = {
    SplashPage.id: (context) => const SplashPage(),
    HomePage.id: (context) => const HomePage(),
  };

  Future<T?> push<T>(Widget screen) async =>
      systemNavigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );

  Future<T?> pushReplacement<T>(Widget screen) async =>
      systemNavigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );

  Future<bool?> pop({
    bool result = false,
  }) async =>
      systemNavigatorKey.currentState?.maybePop(result);
}
