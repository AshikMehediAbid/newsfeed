import 'package:ezycourse_my_project/components/onboard_component.dart';
import 'package:ezycourse_my_project/models/onboard_model.dart';
import 'package:ezycourse_my_project/screens/home_screen.dart';
import 'package:ezycourse_my_project/screens/signin/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> checkFlag() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('flag') ?? false;
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
                              height: 10.08,
                              width: (index == currentIndex) ? 31.36 : 10.08,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: (index == currentIndex) ? Colors.teal.shade900 : Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(5.6),
                              ),
                            );
                          },
                        ),
                      ),

                      Container(
                        width: (currentIndex == onboardingList.length - 1) ? 203.84 : 165.76,
                        height: 63.84,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade900,
                          borderRadius: BorderRadius.circular(31.92),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (currentIndex == onboardingList.length - 1) {
                              FutureBuilder<bool>(
                                future: checkFlag(),

                                /// Fetch the flag asynchronously.
                                builder: (context, snapshot) {
                                  /// While waiting for the future to resolve, show a loading spinner.
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Scaffold(body: const Center(child: CircularProgressIndicator()));
                                  }

                                  /// If the future resolves and the flag is true, navigate to FirstScreen.
                                  else if (snapshot.hasData && snapshot.data == true) {
                                    return const HomeScreen();
                                  } else {
                                    // Navigate to LogInScreen otherwise.

                                    return const SignInScreen();
                                  }
                                },
                              );
                            }
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 36,
                              vertical: 7,
                            ),
                            child: Text(
                              (currentIndex != onboardingList.length - 1) ? "Next" : "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.16,
                                fontWeight: FontWeight.w700,
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
