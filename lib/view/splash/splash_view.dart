import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kafiil/core/resources/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafiil/core/routes/app_routes_fun.dart';

import '../../core/resources/color_manager.dart';
import '../../core/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashView> {
  Timer? _timer;
  final int splashDelay = 4;

// Timer that triggers _goNext after splashDelay
  _startDelay() {
    _timer = Timer(Duration(seconds: splashDelay), _goNext);
  }

// Navigation to the login route
  _goNext() async {
    await replacement(NamedRoutes.login);
  }

  @override
  void initState() {
    super.initState(); // Starting the delay timer when the state is initialized
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      body: Center(
        child: SvgPicture.asset(SvgAssets.splash, height: 70, width: 90),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancelling the timer if it's active
    super.dispose();
  }
}
