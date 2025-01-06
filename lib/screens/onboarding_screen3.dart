import 'package:ezycourse_my_project/custom/onboard_component.dart';
import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return OnboardComponent(
                    screenNo: 3,
                    imageUrl: "assets/images/onboarding/Onboarding image 3.png",
                    heading: 'Last Long Memories',
                    description: "You can store memories of your photos in Zelio app without limit.",
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: Text("Next"),
            )
          ],
        ),
      ),
    );

    /*OnboardComponent(
      screenNo: 3,
      imageUrl: "assets/images/onboarding/Onboarding image 3.png",
      heading: 'Last Long Memories',
      description: "You can store memories of your photos in Zelio app without limit.",
      iconUrl: "assets/images/onboarding/Onboarding icon 3.png",
      buttonText: "Get Started",
    );*/
  }
}
