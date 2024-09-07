import 'dart:async';
import 'package:althhimer_app/caregiver/user_type.dart';
import 'package:althhimer_app/layout/layout_view.dart';
import 'package:althhimer_app/features/login/pages/login_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "splash";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(
          context,
          UserTypeSelectionPage.routeName,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
        "assets/images/splash screen.png",
        fit: BoxFit.cover,
        height: mediaQuery.height,
        width: mediaQuery.width,
      ),
    );
  }
}
