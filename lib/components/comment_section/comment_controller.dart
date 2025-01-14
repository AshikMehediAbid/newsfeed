import 'dart:convert';

import 'package:ezycourse_my_project/components/comment_section/comment_generic.dart';
import 'package:ezycourse_my_project/core/api_response/comment_api_response/create_comment_response.dart';
import 'package:ezycourse_my_project/core/api_response/comment_api_response/get_comment_api_response.dart';
import 'package:ezycourse_my_project/core/network/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final commentProvider = StateNotifierProvider<CommentController, CommentGeneric>(
  (ref) => CommentController(),
);

class CommentController extends StateNotifier<CommentGeneric> {
  CommentController() : super(CommentGeneric());

  Future<CommentApiResponse> createComment({
    required int feed_id,
    required String comment_txt,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final _tokan = (prefs.getString('passwordToken') ?? 0);

    Map<String, dynamic> payload = {
      "feed_id": feed_id,
      "comment_txt": comment_txt,
      "commentSource": "COMMUNITY",
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_tokan'
    };

    Response response = await post(
      Uri.parse(Api.BASE_URL + Api.CREATE_COMMENT),
      headers: headers,
      body: jsonEncode(payload),
    );

    CommentApiResponse commentApiResponse = CommentApiResponse.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      print(response.body);
      return commentApiResponse;
    } else {
      throw "error";
    }
  }

  Future<List<GetCommentApiResponse>> getComments(int feedl_id) async {
    final prefs = await SharedPreferences.getInstance();
    final _tokan = (prefs.getString('passwordToken') ?? 0);

    state = state.update(loading: true);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_tokan'
    };

    Response response = await get(
      Uri.parse(Api.BASE_URL + Api.FETCH_COMMENTS + feedl_id.toString() + "?more=null"),
      headers: headers,
    );

    print(response.body);

    List<dynamic> json = jsonDecode(response.body);
    List<GetCommentApiResponse> commentList = json.map((item) => GetCommentApiResponse.fromJson(item)).toList();

    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        state = state.update(loading: false);

        return commentList;
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
