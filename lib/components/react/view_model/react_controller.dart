import 'dart:convert';

import 'package:ezycourse_my_project/components/react/model/reaction_model.dart';
import 'package:ezycourse_my_project/components/react/view_model/react_generic.dart';
import 'package:ezycourse_my_project/core/network/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final reactProvider = StateNotifierProvider<ReactController, ReactGeneric>(
  (ref) => ReactController(),
);

class ReactController extends StateNotifier<ReactGeneric> {
  ReactController() : super(ReactGeneric());

  Row getSinglePostReact(String reactType) {
    return Row(
      children: [
        Flexible(
          child: Image.asset(
            fit: BoxFit.fill,
            "assets/images/reaction/${reactType.toLowerCase()}.png",
            height: 20,
            width: 20,
          ),
        ),
        SizedBox(width: 5),
        Text(
          "$reactType",
          style: (reactType == "LIKE")
              ? TextStyle(color: Colors.blue)
              : (reactType == 'ANGRY')
                  ? TextStyle(color: Colors.deepOrange)
                  : TextStyle(color: Colors.yellow.shade800),
        ),
      ],
    );
  }

  Future<void> createReact({required int feed_id, String? reactionType, required String action}) async {
    final pref = await SharedPreferences.getInstance();
    final _token = pref.getString('passwordToken') ?? 0;

    print("#Action: $action");

    Map<String, dynamic> payload = {
      'feed_id': feed_id,
      'reaction_type': (reactionType != "") ? reactionType : null,
      'action': action,
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
      print("Create react: $reactionType *");
      if (response.statusCode >= 200 && response.statusCode < 300) {
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      print("Error in createReact: $e");
    }
  }

  Future<List<GetReactionModel>> getReaction(int postID) async {
    final pref = await SharedPreferences.getInstance();
    final _token = pref.getString('passwordToken') ?? '0';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token'
    };

    try {
      Response response = await get(Uri.parse(Api.BASE_URL + Api.REACTION_LIST + postID.toString()), headers: headers);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<dynamic> json = jsonDecode(response.body);
        List<GetReactionModel> reactionList = json.map((item) => GetReactionModel.fromJson(item)).toList();
        return reactionList;
      } else {
        throw "Something is wrong";
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
