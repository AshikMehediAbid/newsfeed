import 'package:flutter/material.dart';

class ColorModel {
  Color boxColor;

  ColorModel({required this.boxColor});
}

final List<ColorModel> colorList = [
  ColorModel(boxColor: Colors.white),
  ColorModel(boxColor: Colors.pink.shade400),
  ColorModel(boxColor: Colors.lightGreenAccent.shade400),
  ColorModel(boxColor: Colors.yellowAccent.shade400),
  ColorModel(boxColor: Colors.redAccent.shade400),
  ColorModel(boxColor: Colors.cyan.shade400),
];
