import 'dart:convert';

import 'package:ezycourse_my_project/components/reply_section/view_model/reply_generic.dart';
import 'package:ezycourse_my_project/core/api_response/reply_api_response/get_reply_api_response.dart';
import 'package:ezycourse_my_project/core/network/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final replyProvider = StateNotifierProvider<ReplyController, ReplyGeneric>(
  (ref) => ReplyController(),
);

class ReplyController extends StateNotifier<ReplyGeneric> {
  ReplyController() : super(ReplyGeneric());

  Future<void> addReply(
      {required int feed_id, required int feed_user_id, required int parrent_id, required String comment_txt}) async {
    final prefs = await SharedPreferences.getInstance();
    final _tokan = (prefs.getString('passwordToken') ?? 0);

    Map<String, dynamic> payload = {
      "feed_id": feed_id,
      "feed_user_id": feed_user_id,
      "comment_txt": comment_txt,
      "parrent_id": parrent_id,
      "commentSource": "COMMUNITY",
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_tokan'
    };

    Response response = await post(
      Uri.parse(Api.BASE_URL + Api.ADD_REPLY),
      headers: headers,
      body: jsonEncode(payload),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print("Success");
      return;
    } else {
      throw "error";
    }
  }

  Future<List<GetReplyApiResponse>> getReply(int parentCommentId) async {
    final prefs = await SharedPreferences.getInstance();
    final _tokan = (prefs.getString('passwordToken') ?? 0);

    state = state.update(loading: true);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_tokan'
    };

    Response response = await get(
      Uri.parse(Api.BASE_URL + Api.FETCH_REPLY + parentCommentId.toString() + "?more=null"),
      headers: headers,
    );

    print(
        ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $parentCommentId >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(response.body);

    List<dynamic> json = jsonDecode(response.body);
    List<GetReplyApiResponse> replyList = json.map((item) => GetReplyApiResponse.fromJson(item)).toList();

    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        state = state.update(loading: false);
        print("SSSSSS");
        print(replyList);
        return replyList;
      } else {
        state = state.update(loading: false);
        throw ("No data found");
      }
    } catch (e) {
      state = state.update(loading: false);
      print("#############################################################$e");
      throw e;
    }
  }
}
