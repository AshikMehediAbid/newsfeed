import 'dart:convert';

import 'package:ezycourse_my_project/core/network/api.dart';
import 'package:ezycourse_my_project/screens/feed/model/get_feed_api_model.dart';
import 'package:ezycourse_my_project/screens/feed/view_model/newsfeed_generic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final newsfeedProvider = StateNotifierProvider<NewsfeedController, NewsfeedGeneric>(
  (ref) => NewsfeedController(),
);

class NewsfeedController extends StateNotifier<NewsfeedGeneric> {
  NewsfeedController() : super(NewsfeedGeneric());

  void get_Feed() async {
    state = state.update(feedModelList: await getFeed());
  }

  Future<String> createPost({required feed_txt, required int is_background}) async {
    final prefs = await SharedPreferences.getInstance();
    final _tokan = (prefs.getString('passwordToken') ?? 0);

    Map<String, dynamic> payload = {
      "feed_txt": feed_txt,
      "community_id": 2914,
      "space_id": 5883,
      "is_background": 0,
      "activity_type": "group",
      "uploadType": "text"
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_tokan'
    };

    Response response = await post(
      Uri.parse(Api.BASE_URL + Api.CREATE_POST),
      headers: headers,
      body: jsonEncode(payload),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      getFeed();
      return "";
    } else {
      throw "error";
    }
  }

  Future<List<FeedApiResponse>> getFeed() async {
    final prefs = await SharedPreferences.getInstance();
    final _tokan = (prefs.getString('passwordToken') ?? 0);

    state = state.update(loading: true);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_tokan'
    };

    Map<String, dynamic> payload = {
      "community_id": 2914,
      "space_id": 5883,
    };

    try {
      Response response = await post(
        Uri.parse(Api.BASE_URL + Api.FETCH_COMMUNITY),
        body: jsonEncode(payload),
        headers: headers,
      );

      List<dynamic> json = jsonDecode(response.body);
      List<FeedApiResponse> feedList = json.map((item) => FeedApiResponse.fromJson(item)).toList();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        state = state.update(loading: false);

        return feedList;
      } else {
        state = state.update(loading: false);
        throw Exception("Failed to fetch feed");
      }
    } catch (e) {
      state = state.update(loading: false);
      print("#############################################################$e");
      return []; // Return an empty list instead of null
    }
  }
}
