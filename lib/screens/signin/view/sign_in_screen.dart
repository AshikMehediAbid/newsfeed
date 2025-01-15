import 'package:ezycourse_my_project/components/custom_text_field.dart';
import 'package:ezycourse_my_project/screens/home_screen.dart';
import 'package:ezycourse_my_project/screens/signin/view_model/sign_in_controller.dart';
import 'package:ezycourse_my_project/utils/toast/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  bool _isCheckedBoxClicked = false;
  bool _isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late SharedPreferences _prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    _prefs = await SharedPreferences.getInstance();

    if (!_prefs.containsKey('flag')) {
      await _prefs.setBool('flag', false);
    }

    setState(() {
      _isCheckedBoxClicked = _prefs.getBool('flag') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoad = ref.watch(signinProvider);
    return isLoad.isLoading
        ? Scaffold(
            body: Center(
                child: CircularProgressIndicator(
            color: Color(0xFF105B66),
          )))
        : Scaffold(
            backgroundColor: Colors.teal.shade700,
            body: Column(
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
                            style: GoogleFonts.figtree(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 38,
                            ),
                          ),
                          CustomTextField(
                            text: _emailController,
                            title: "Email",
                            hintText: "sample123@gmail.com",
                          ),
                          CustomTextField(
                            text: _passwordController,
                            title: "Password",
                            hintText: "Enter your password",
                            isObscure: _isObscure,
                            iconbtn: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                (_isObscure == true) ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _isCheckedBoxClicked,
                                onChanged: (clicked) async {
                                  if (clicked != null) {
                                    await _prefs.setBool('flag', clicked);
                                    setState(() {
                                      _isCheckedBoxClicked = clicked;
                                    });
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
                              onPressed: () async {
                                String email = _emailController.text.toString().trim();
                                String password = _passwordController.text.toString().trim();

                                if (email.isEmpty || password.isEmpty) {
                                  ToastUtil.showToast(
                                    context: context,
                                    message: "All field required",
                                    isWarning: true,
                                  );
                                  return;
                                }

                                print("######################################${password}");
                                print("######################################${password.length}");

                                if (password.length < 6) {
                                  ToastUtil.showToast(
                                    context: context,
                                    message: "Week password",
                                    isWarning: true,
                                  );
                                  return;
                                }

                                if (email.contains(".io") == false) {
                                  ToastUtil.showToast(
                                    context: context,
                                    message: "invalid gmail",
                                    isWarning: true,
                                  );
                                  return;
                                }

                                String? serverMessage = await ref.read(signinProvider.notifier).signin(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    );

                                if (serverMessage == "Successfully Login") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                } else {
                                  ToastUtil.showToast(
                                    context: context,
                                    message: serverMessage,
                                    isWarning: true,
                                  );
                                }
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
                          SizedBox(height: 70),
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
