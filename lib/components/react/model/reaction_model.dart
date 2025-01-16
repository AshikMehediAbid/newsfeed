import 'package:flutter/material.dart';

class ReactionModel {
  String react, REACT, iconURL;
  Color rectColor;

  ReactionModel({required this.react, required this.REACT, required this.iconURL, required this.rectColor});
}

final List<ReactionModel> reactList = [
  ReactionModel(react: "Like", REACT: "LIKE", iconURL: "assets/images/reaction/like.png", rectColor: Colors.blue),
  ReactionModel(react: "Love", REACT: "LOVE", iconURL: "assets/images/reaction/love.png", rectColor: Colors.red),
  ReactionModel(
      react: "Care", REACT: "CARE", iconURL: "assets/images/reaction/care.png", rectColor: Colors.yellow.shade800),
  ReactionModel(
      react: "Haha", REACT: "HAHA", iconURL: "assets/images/reaction/haha.png", rectColor: Colors.yellow.shade800),
  ReactionModel(
      react: "Wow", REACT: "WOW", iconURL: "assets/images/reaction/wow.png", rectColor: Colors.yellow.shade800),
  ReactionModel(
      react: "Sad", REACT: "SAD", iconURL: "assets/images/reaction/sad.png", rectColor: Colors.yellow.shade800),
  ReactionModel(
      react: "Angry", REACT: "ANGRY", iconURL: "assets/images/reaction/angry.png", rectColor: Colors.deepOrange),
];
