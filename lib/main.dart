import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ezycourse_my_project/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Container(
          //width: MediaQuery.of(context).size.width * .5,
          child: Image.asset("assets/images/splash.png"),
        ),
        duration: 3000,
        backgroundColor: Colors.teal.shade700,
        nextScreen: OnboardingScreen(),
      ),
    );
  }
}
