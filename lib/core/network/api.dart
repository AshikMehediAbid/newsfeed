class Api {
  static const String BASE_URL = "https://iap.ezycourse.com/api/app/";

  static const String LOGIN = "student/auth/login";

  static const String FETCH_COMMUNITY = "teacher/community/getFeed?status=feed&";

  static const String CREATE_POST = "teacher/community/createFeedWithUpload?";

  static const String CREATE_OR_UPDATE_REACTION = "teacher/community/createLike?=&=&=&=";

  static const String REACTION_LIST = "teacher/community/getAllReactionType?feed_id=";

  static const String FETCH_COMMENTS = "student/comment/getComment/"; //:feedI_id?more=null";

  static const String CREATE_COMMENT = "student/comment/createComment";

  static const String ADD_REPLY = "student/comment/createComment";

  static const String LOG_OUT = "student/auth/logout";

  static const String FETCH_REPLY = "student/comment/getReply/";
}
