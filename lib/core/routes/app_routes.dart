import 'package:flutter/material.dart';
import 'package:kafiil/core/routes/routes.dart';
import 'package:kafiil/view/login/view/login_view.dart';
import 'package:kafiil/view/main/view/main_view.dart';

import '../../view/register/view/register_view.dart';
import '../../view/splash/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case NamedRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case NamedRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case NamedRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case NamedRoutes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return MaterialPageRoute(builder: (_) => const MainScreen());
    }
  }
}
