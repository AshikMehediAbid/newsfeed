import 'dart:convert';

import 'package:ezycourse_my_project/components/react/view_model/react_generic.dart';
import 'package:ezycourse_my_project/core/network/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final reactProvider = StateNotifierProvider<ReactController, ReactGeneric>(
  (ref) => ReactController(),
);

class ReactController extends StateNotifier<ReactGeneric> {
  ReactController() : super(ReactGeneric());

  Future<void> addReact({required int feed_id, required String reactionType}) async {
    final pref = await SharedPreferences.getInstance();
    final _token = pref.getString('passwordToken') ?? 0;

    print("HEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
    Map<String, dynamic> payload = {
      'feed_id': feed_id,
      'reaction_type': reactionType,
      'action': "deleteOrCreate",
      "reactionSource": "COMMUNITY",
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token'
    };

    try {
      Response response = await post(
        Uri.parse(Api.BASE_URL + Api.CREATE_OR_UPDATE_REACTION),
        headers: headers,
        body: jsonEncode(payload),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(" =========  $reactionType  ========");
      } else {
        throw Exception("Error");
      }
    } catch (e) {}
  }
}
