import 'dart:convert';

import 'package:ezycourse_my_project/core/model/signin_api_model.dart';
import 'package:ezycourse_my_project/core/network/api.dart';
import 'package:ezycourse_my_project/screens/signin/sign_in_generic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final signinProvider = StateNotifierProvider<SigninController, SignInGeneric>(
  (ref) => SigninController(),
);

class SigninController extends StateNotifier<SignInGeneric> {
  SigninController() : super(SignInGeneric());

  Future<String> signin({required String email, required password}) async {
    state = state.update(loading: true);

    Map<String, dynamic> payload = {
      "email": email,
      "password": password,
      "app_token": "",
    };

    Response response = await post(
      Uri.parse(Api.BASE_URL + Api.LOGIN),
      body: payload,
    );
    Map<String, dynamic> json = jsonDecode(response.body);
    print("************************************************************************  $json");
    SigninApiModel signinApiModel = SigninApiModel.fromJson(json);

    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        String token = signinApiModel.token.toString();
        final pref = await SharedPreferences.getInstance();
        await pref.setString('passwordToken', token);
        state = state.update(loading: false);
        return "Successfully Login";
      } else {
        state = state.update(loading: false);
        return signinApiModel.msg.toString();
      }
    } catch (e) {
      state = state.update(loading: false);
      print("#############################################################$e");
      throw e;
    }
  }
}
