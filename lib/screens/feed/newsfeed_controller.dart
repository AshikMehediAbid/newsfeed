import 'dart:convert';

import 'package:ezycourse_my_project/core/model/feed_api_model.dart';
import 'package:ezycourse_my_project/core/network/api.dart';
import 'package:ezycourse_my_project/screens/feed/newsfeed_generic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final newsfeedProvider = StateNotifierProvider<NewsfeedController, NewsfeedGeneric>(
  (ref) => NewsfeedController(),
);

class NewsfeedController extends StateNotifier<NewsfeedGeneric> {
  NewsfeedController() : super(NewsfeedGeneric());

  Future<List<FeedModel>> getFeed() async {
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

    Response response = await post(
      Uri.parse(Api.BASE_URL + Api.FETCH_COMMUNITY),
      body: jsonEncode(payload),
      headers: headers,
    );

    List<dynamic> json = jsonDecode(response.body);
    List<FeedModel> feedList = json.map((item) => FeedModel.fromJson(item)).toList();

    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        state = state.update(loading: false);

        return feedList;
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
