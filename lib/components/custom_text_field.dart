import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String title, hintText;
  bool isObscure;
  IconButton? iconbtn;
  TextEditingController text = TextEditingController();
  CustomTextField({
    required this.title,
    required this.hintText,
    this.isObscure = false,
    required this.text,
    this.iconbtn,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white.withOpacity(.7),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(.2),
            ),
            child: TextFormField(
              controller: widget.text,
              obscureText: widget.isObscure ?? false,
              style: TextStyle(
                color: Colors.white,
              ),
              obscuringCharacter: "*",
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.white54),
                suffixIcon: widget.iconbtn,
                suffixIconColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
