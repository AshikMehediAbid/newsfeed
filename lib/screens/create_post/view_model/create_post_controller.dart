import 'package:ezycourse_my_project/models/color_model.dart';
import 'package:ezycourse_my_project/screens/create_post/view_model/create_post_generic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPostProvider = StateNotifierProvider<CreatePostController, CreatePostGeneric>(
  (ref) => CreatePostController(),
);

class CreatePostController extends StateNotifier<CreatePostGeneric> {
  CreatePostController() : super(CreatePostGeneric());

  void toggleShowBgColor() {
    state = state.update(showBgColor: !state.showBgColor);
  }

  void changeBgColor(int i) {
    state = state.update(
      backgroundColorr: colorList[i].boxColor,
      isBackground: (state.backgroundColor != Colors.white) ? 1 : 0,
    );
  }
}
