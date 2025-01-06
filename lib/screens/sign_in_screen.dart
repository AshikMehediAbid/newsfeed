import 'package:ezycourse_my_project/custom/custom_text_field.dart';
import 'package:ezycourse_my_project/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isCheckedBoxClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade700,

      // appBar: AppBar(
      //   backgroundColor: Colors.teal.shade700,
      // ),

      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 70),
          Expanded(
            child: Image.asset("assets/images/ezyCourseSignUp.png"),
          ),
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.shade800,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,
                    offset: Offset(0, -1),
                    blurRadius: 6,
                    blurStyle: BlurStyle.solid,
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    CustomTextField(
                      title: "Email",
                      hintText: "sample123@gmail.com",
                    ),
                    CustomTextField(
                      title: "Password",
                      hintText: "Enter your password",
                      isObscure: true,
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _isCheckedBoxClicked,
                          onChanged: (clicked) {
                            if (clicked != null) {
                              setState(() {
                                _isCheckedBoxClicked = clicked;
                              });
                              print(_isCheckedBoxClicked);
                            }
                          },
                        ),
                        //SizedBox(width: 5),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellowAccent.shade200,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
