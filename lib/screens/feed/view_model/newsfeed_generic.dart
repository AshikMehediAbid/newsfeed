import 'package:ezycourse_my_project/screens/feed/model/get_feed_api_model.dart';

class NewsfeedGeneric {
  bool isLoading;
  List<FeedApiResponse> feedModelList;

  NewsfeedGeneric({this.isLoading = false, this.feedModelList = const []});

  NewsfeedGeneric update({bool? loading, List<FeedApiResponse>? feedModelList}) {
    return NewsfeedGeneric(
      isLoading: loading ?? this.isLoading,
      feedModelList: feedModelList ?? this.feedModelList,
    );
  }
}
