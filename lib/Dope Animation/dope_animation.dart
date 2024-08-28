import 'package:calculator_01/Pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_splash/flutter_animated_splash.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplash(
            durationInSeconds: 1,
            type: Transition.fade,
            navigator: const Home(),
            child: Center(
                child: Lottie.asset(
                    'assets/lottie/Animation - 1723238078999.json'))));
  }
}
