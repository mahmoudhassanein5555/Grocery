import 'package:flutter/material.dart';
import 'package:grocery1/core/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.register:
      // return MaterialPageRoute(builder: (_) => Register);
      case Routes.login:
      // return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.home:
      // return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.products:
      // return MaterialPageRoute(
      //   // builder: (_) => const ProductsScreen(),
      //   settings: settings,
      // );
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
