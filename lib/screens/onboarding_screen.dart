import 'package:ezycourse_my_project/components/onboard_component.dart';
import 'package:ezycourse_my_project/models/onboard_model.dart';
import 'package:ezycourse_my_project/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onboardingList.length,
                controller: _pageController,
                onPageChanged: (int id) {
                  setState(() {
                    currentIndex = id;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardComponent(
                    screenNo: index,
                    imageUrl: onboardingList[index].imageUrl,
                    heading: onboardingList[index].heading,
                    description: onboardingList[index].description,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          onboardingList.length,
                          (index) {
                            return Container(
                              height: 10,
                              width: (index == currentIndex) ? 25 : 10,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: (index == currentIndex) ? Colors.teal.shade900 : Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            );
                          },
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.teal.shade900,
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (currentIndex == onboardingList.length - 1) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            }
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 7),
                            child: Text(
                              (currentIndex != onboardingList.length - 1) ? "Next" : "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      )
                      //Image.asset(name),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            )
          ],
        ),
      ),
    );
  }
}
