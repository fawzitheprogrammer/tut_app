import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/asstes_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(Assets.splashLogo),
      ),
    );
  }
}
