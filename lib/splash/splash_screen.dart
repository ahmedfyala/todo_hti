import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../home_layout.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeLayout.routeName);
    });
    return Scaffold(
      backgroundColor: tdGreen,
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );

  }
}
