import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String title, hintText;
  bool isObscure;
  Icon? icon;

  CustomTextField({
    required this.title,
    required this.hintText,
    this.isObscure = false,
    this.icon,
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
              obscureText: widget.isObscure ?? false,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: widget.icon,
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
