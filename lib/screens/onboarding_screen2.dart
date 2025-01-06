import 'package:ezycourse_my_project/custom/onboard_component.dart';
import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return OnboardComponent(
      screenNo: 2,
      imageUrl: "assets/images/onboarding/Onboarding image 2.png",
      heading: 'Sharing Happiness',
      description: "Sharing happiness by sharing your memories in Zelio platform.",
    );
  }
}
