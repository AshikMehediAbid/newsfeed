import 'package:flutter/material.dart';

class CreatePostGeneric {
  //bool isLoading;
  bool showBgColor;
  Color backgroundColor;
  int isBackground;

  CreatePostGeneric({
    //this.isLoading = false,
    this.showBgColor = false,
    this.backgroundColor = Colors.white,
    this.isBackground = 0,
  });

  CreatePostGeneric update({bool? loading, Color? backgroundColorr, bool? showBgColor, int? isBackground}) {
    return CreatePostGeneric(
      //isLoading: loading ?? this.isLoading,
      backgroundColor: backgroundColorr ?? this.backgroundColor,
      showBgColor: showBgColor ?? this.showBgColor,
      isBackground: isBackground ?? this.isBackground,
    );
  }
}
