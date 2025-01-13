import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ezycourse_my_project/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        color: Color(0xFFF3F3F3),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF3F3F3)),
          useMaterial3: true,
        ),
        home: AnimatedSplashScreen(
          splash: Container(
            //width: MediaQuery.of(context).size.width * .5,
            child: Image.asset(
              "assets/images/splash.png",
              width: 265.75,
            ),
          ),
          duration: 3000,
          backgroundColor: Colors.teal.shade700,
          nextScreen: OnboardingScreen(),
        ),
      ),
    );
  }
}
