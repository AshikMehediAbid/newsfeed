import 'package:ezycourse_my_project/screens/onboarding_screen2.dart';
import 'package:ezycourse_my_project/screens/onboarding_screen3.dart';
import 'package:ezycourse_my_project/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class OnboardComponent extends StatefulWidget {
  final int screenNo;
  final String imageUrl, heading, description;

  const OnboardComponent({
    required this.screenNo,
    super.key,
    required this.imageUrl,
    required this.heading,
    required this.description,
  });

  @override
  State<OnboardComponent> createState() => _OnboardComponentState();
}

class _OnboardComponentState extends State<OnboardComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Helloooooooooo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            (widget.screenNo == 1)
                ? Row(
                    children: [
                      Spacer(),
                      Image.asset(
                        widget.imageUrl,
                      ),
                    ],
                  )
                : ((widget.screenNo == 2)
                    ? Container(
                        color: Colors.blue,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          fit: BoxFit.fill,
                          widget.imageUrl,
                        ),
                      )
                    : Row(
                        children: [
                          Image.asset(widget.imageUrl),
                          Spacer(),
                        ],
                      )),
            SizedBox(height: 30),
            Text(
              widget.heading,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade800,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => (widget.screenNo == 1)
                                ? OnboardingScreen2()
                                : (widget.screenNo == 2)
                                    ? OnboardingScreen3()
                                    : SignInScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                  //Image.asset(name),
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
