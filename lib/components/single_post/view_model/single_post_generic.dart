import 'package:flutter/material.dart';

class SinglePostGeneric {
  bool isReact;
  String? REACTION;

  SinglePostGeneric({
    this.isReact = false,
    this.REACTION = null,
  });

  SinglePostGeneric update({
    Row? react,
    bool? isReact,
    String? REACTION,
  }) {
    return SinglePostGeneric(
      isReact: isReact ?? this.isReact,
      REACTION: REACTION ?? this.REACTION,
    );
  }
}
