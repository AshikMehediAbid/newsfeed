import 'package:ezycourse_my_project/custom/onboard_component.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return OnboardComponent(
      screenNo: 1,
      imageUrl: "assets/images/onboarding/Onboarding image 1.png",
      heading: 'We Connect People',
      description: "Connecting people trough one platform to share the memories together.",
    );
  }
}
