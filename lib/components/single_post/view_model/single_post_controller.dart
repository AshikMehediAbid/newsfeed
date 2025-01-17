import 'package:ezycourse_my_project/components/react/model/reaction_model.dart';
import 'package:ezycourse_my_project/components/single_post/view_model/single_post_generic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final singlePostProvider = StateNotifierProvider<SinglePostController, SinglePostGeneric>(
  (ref) => SinglePostController(),
);

class SinglePostController extends StateNotifier<SinglePostGeneric> {
  SinglePostController() : super(SinglePostGeneric());

  void addReact(int? i) {
    state = state.update(isReact: true);
    state = state.update(
      REACTION: reactList[i!].REACT,
      react: Row(
        children: [
          Image.asset(
            reactList[i].iconURL,
            height: 20,
            width: 20,
          ),
          Text("  ${reactList[i].react}", style: TextStyle(color: reactList[i].rectColor)),
        ],
      ),
    );
  }

  void toggleReact() {
    state = state.update(isReact: !state.isReact);

    state = state.update(
      react: (state.isReact == false)
          ? Row(
              children: [
                Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 20,
                ),
                Text("  Like", style: TextStyle(color: Colors.grey)),
              ],
            )
          : Row(
              children: [
                Image.asset(
                  'assets/images/reaction/like.png',
                  height: 20,
                  width: 20,
                ),
                Text("  Like", style: TextStyle(color: Colors.blue)),
              ],
            ),
      REACTION: (state.isReact == false) ? "" : "LIKE",
    );

    print("2. isReact: ${state.isReact}  REACTION: ${state.REACTION}");
  }
}
