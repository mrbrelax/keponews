import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/components/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Future.delayed(const Duration(seconds: 5)).then(
        (value) => Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.homePage, (route) => false),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  scale: 10,
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
