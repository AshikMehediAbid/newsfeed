import 'package:ezycourse_my_project/core/api_response/reply_api_response/get_reply_api_response.dart';

class ReplyGeneric {
  bool isLoading;
  List<GetReplyApiResponse> getReplyList;
  ReplyGeneric({this.isLoading = false, this.getReplyList = const []});

  ReplyGeneric update({bool? loading, List<GetReplyApiResponse>? replyList}) {
    return ReplyGeneric(
      isLoading: loading ?? this.isLoading,
      getReplyList: replyList ?? this.getReplyList,
    );
  }
}
