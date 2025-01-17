import 'package:flutter/material.dart';

class SinglePostGeneric {
  Row reaction;
  bool isReact;
  String? REACTION;

  SinglePostGeneric({
    this.reaction = const Row(
      children: [Text("data")],
    ),
    this.isReact = false,
    this.REACTION = null,
  });

  SinglePostGeneric update({
    Row? react,
    bool? isReact,
    String? REACTION,
  }) {
    return SinglePostGeneric(
      reaction: react ?? this.reaction,
      isReact: isReact ?? this.isReact,
      REACTION: REACTION ?? this.REACTION,
    );
  }
}
