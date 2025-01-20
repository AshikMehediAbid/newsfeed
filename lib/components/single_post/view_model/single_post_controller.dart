import 'package:ezycourse_my_project/components/single_post/view_model/single_post_generic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final singlePostProvider = StateNotifierProvider<SinglePostController, SinglePostGeneric>(
  (ref) => SinglePostController(),
);

class SinglePostController extends StateNotifier<SinglePostGeneric> {
  SinglePostController() : super(SinglePostGeneric());

  void addReact(String reaction) {
    state = state.update(
      isReact: true,
      REACTION: reaction,
    );
  }

  void deleteReact() {
    state = state.update(
      isReact: false,
    );
  }
}
