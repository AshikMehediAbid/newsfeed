class FeedApiResponse {
  final int id;
  final int schoolId;
  final int userId;
  final int? courseId;
  final int communityId;
  final int? groupId;
  final String feedText;
  final String status;
  final String slug;
  final String title;
  final String activityType;
  final int isPinned;
  final String fileType;
  final List<dynamic> files;
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final int shareId;
  final Map<String, dynamic> metaData;
  final String createdAt;
  final String updatedAt;
  final String feedPrivacy;
  final int isBackground;
  final dynamic bgColor;
  final dynamic pollId;
  final dynamic lessonId;
  final int spaceId;
  final dynamic videoId;
  final dynamic streamId;
  final dynamic blogId;
  final dynamic scheduleDate;
  final dynamic timezone;
  final dynamic isAnonymous;
  final dynamic meetingId;
  final dynamic sellerId;
  final String publishDate;
  final bool isFeedEdit;
  final String name;
  final String pic;
  final int uid;
  final int isPrivateChat;
  final User user;
  final Like? like;
  final List<LikeType> likeType;
  final dynamic poll;
  final dynamic group;
  final dynamic follow;
  final dynamic savedPosts;
  final List<dynamic> comments;
  final Meta meta;

  FeedApiResponse({
    required this.id,
    required this.schoolId,
    required this.userId,
    this.courseId,
    required this.communityId,
    this.groupId,
    required this.feedText,
    required this.status,
    required this.slug,
    required this.title,
    required this.activityType,
    required this.isPinned,
    required this.fileType,
    required this.files,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.shareId,
    required this.metaData,
    required this.createdAt,
    required this.updatedAt,
    required this.feedPrivacy,
    required this.isBackground,
    this.bgColor,
    this.pollId,
    this.lessonId,
    required this.spaceId,
    this.videoId,
    this.streamId,
    this.blogId,
    this.scheduleDate,
    this.timezone,
    this.isAnonymous,
    this.meetingId,
    this.sellerId,
    required this.publishDate,
    required this.isFeedEdit,
    required this.name,
    required this.pic,
    required this.uid,
    required this.isPrivateChat,
    required this.user,
    this.like,
    required this.likeType,
    this.poll,
    this.group,
    this.follow,
    this.savedPosts,
    required this.comments,
    required this.meta,
  });

  factory FeedApiResponse.fromJson(Map<String, dynamic> json) {
    return FeedApiResponse(
      id: json['id'],
      schoolId: json['school_id'],
      userId: json['user_id'],
      courseId: json['course_id'],
      communityId: json['community_id'],
      groupId: json['group_id'],
      feedText: json['feed_txt'],
      status: json['status'],
      slug: json['slug'],
      title: json['title'],
      activityType: json['activity_type'],
      isPinned: json['is_pinned'],
      fileType: json['file_type'],
      files: List<dynamic>.from(json['files']),
      likeCount: json['like_count'],
      commentCount: json['comment_count'],
      shareCount: json['share_count'],
      shareId: json['share_id'],
      metaData: Map<String, dynamic>.from(json['meta_data']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      feedPrivacy: json['feed_privacy'],
      isBackground: json['is_background'],
      bgColor: json['bg_color'],
      pollId: json['poll_id'],
      lessonId: json['lesson_id'],
      spaceId: json['space_id'],
      videoId: json['video_id'],
      streamId: json['stream_id'],
      blogId: json['blog_id'],
      scheduleDate: json['schedule_date'],
      timezone: json['timezone'],
      isAnonymous: json['is_anonymous'],
      meetingId: json['meeting_id'],
      sellerId: json['seller_id'],
      publishDate: json['publish_date'],
      isFeedEdit: json['is_feed_edit'],
      name: json['name'],
      pic: json['pic'],
      uid: json['uid'],
      isPrivateChat: json['is_private_chat'],
      user: User.fromJson(json['user']),
      like: json['like'] != null ? Like.fromJson(json['like']) : null,
      likeType: (json['likeType'] as List<dynamic>).map((e) => LikeType.fromJson(e)).toList(),
      poll: json['poll'],
      group: json['group'],
      follow: json['follow'],
      savedPosts: json['savedPosts'],
      comments: List<dynamic>.from(json['comments']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class User {
  final int id;
  final String fullName;
  final String profilePic;
  final int isPrivateChat;
  final dynamic expireDate;
  final dynamic status;
  final dynamic pauseDate;
  final String userType;
  final Map<String, dynamic> meta;

  User({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.isPrivateChat,
    this.expireDate,
    this.status,
    this.pauseDate,
    required this.userType,
    required this.meta,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      profilePic: json['profile_pic'],
      isPrivateChat: json['is_private_chat'],
      expireDate: json['expire_date'],
      status: json['status'],
      pauseDate: json['pause_date'],
      userType: json['user_type'],
      meta: Map<String, dynamic>.from(json['meta']),
    );
  }
}

class LikeType {
  final String reactionType;
  final int feedId;
  final Map<String, dynamic> meta;

  LikeType({
    required this.reactionType,
    required this.feedId,
    required this.meta,
  });

  factory LikeType.fromJson(Map<String, dynamic> json) {
    return LikeType(
      reactionType: json['reaction_type'],
      feedId: json['feed_id'],
      meta: Map<String, dynamic>.from(json['meta']),
    );
  }
}

class Like {
  final int id;
  final int feedId;
  final int userId;
  final String reactionType;
  final String createdAt;
  final String updatedAt;
  final int isAnonymous;
  final Map<String, dynamic> meta;

  Like({
    required this.id,
    required this.feedId,
    required this.userId,
    required this.reactionType,
    required this.createdAt,
    required this.updatedAt,
    required this.isAnonymous,
    required this.meta,
  });

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      id: json['id'],
      feedId: json['feed_id'],
      userId: json['user_id'],
      reactionType: json['reaction_type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isAnonymous: json['is_anonymous'],
      meta: Map<String, dynamic>.from(json['meta']),
    );
  }
}

class Meta {
  final int views;

  Meta({required this.views});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(views: json['views']);
  }
}

/*


class FeedApiResponse {
  final int id;
  final int schoolId;
  final int userId;
  final int? courseId;
  final int communityId;
  final int? groupId;
  final String feedText;
  final String status;
  final String slug;
  final String title;
  final String activityType;
  final int isPinned;
  final String fileType;
  final List<dynamic> files;
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final int shareId;
  final Map<String, dynamic> metaData;
  final String createdAt;
  final String updatedAt;
  final String feedPrivacy;
  final int isBackground;
  final dynamic bgColor;
  final dynamic pollId;
  final dynamic lessonId;
  final int spaceId;
  final dynamic videoId;
  final dynamic streamId;
  final dynamic blogId;
  final dynamic scheduleDate;
  final dynamic timezone;
  final dynamic isAnonymous;
  final dynamic meetingId;
  final dynamic sellerId;
  final String publishDate;
  final bool isFeedEdit;
  final String name;
  final String pic;
  final int uid;
  final int isPrivateChat;
  final User user;
  final Like? like;
  final List<LikeType> likeType;
  final dynamic poll;
  final dynamic group;
  final dynamic follow;
  final dynamic savedPosts;
  final List<dynamic> comments;
  final Meta meta;

  FeedApiResponse({
    required this.id,
    required this.schoolId,
    required this.userId,
    this.courseId,
    required this.communityId,
    this.groupId,
    required this.feedText,
    required this.status,
    required this.slug,
    required this.title,
    required this.activityType,
    required this.isPinned,
    required this.fileType,
    required this.files,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.shareId,
    required this.metaData,
    required this.createdAt,
    required this.updatedAt,
    required this.feedPrivacy,
    required this.isBackground,
    this.bgColor,
    this.pollId,
    this.lessonId,
    required this.spaceId,
    this.videoId,
    this.streamId,
    this.blogId,
    this.scheduleDate,
    this.timezone,
    this.isAnonymous,
    this.meetingId,
    this.sellerId,
    required this.publishDate,
    required this.isFeedEdit,
    required this.name,
    required this.pic,
    required this.uid,
    required this.isPrivateChat,
    required this.user,
    this.like,
    required this.likeType,
    this.poll,
    this.group,
    this.follow,
    this.savedPosts,
    required this.comments,
    required this.meta,
  });

  factory FeedApiResponse.fromJson(Map<String, dynamic> json) {
    return FeedApiResponse(
      id: json['id'],
      schoolId: json['school_id'],
      userId: json['user_id'],
      courseId: json['course_id'],
      communityId: json['community_id'],
      groupId: json['group_id'],
      feedText: json['feed_txt'],
      status: json['status'],
      slug: json['slug'],
      title: json['title'],
      activityType: json['activity_type'],
      isPinned: json['is_pinned'],
      fileType: json['file_type'],
      files: List<dynamic>.from(json['files']),
      likeCount: json['like_count'],
      commentCount: json['comment_count'],
      shareCount: json['share_count'],
      shareId: json['share_id'],
      metaData: Map<String, dynamic>.from(json['meta_data']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      feedPrivacy: json['feed_privacy'],
      isBackground: json['is_background'],
      bgColor: json['bg_color'],
      pollId: json['poll_id'],
      lessonId: json['lesson_id'],
      spaceId: json['space_id'],
      videoId: json['video_id'],
      streamId: json['stream_id'],
      blogId: json['blog_id'],
      scheduleDate: json['schedule_date'],
      timezone: json['timezone'],
      isAnonymous: json['is_anonymous'],
      meetingId: json['meeting_id'],
      sellerId: json['seller_id'],
      publishDate: json['publish_date'],
      isFeedEdit: json['is_feed_edit'],
      name: json['name'],
      pic: json['pic'],
      uid: json['uid'],
      isPrivateChat: json['is_private_chat'],
      user: User.fromJson(json['user']),
      like: json['like'] != null ? Like.fromJson(json['like']) : null,
      likeType: (json['likeType'] as List<dynamic>).map((e) => LikeType.fromJson(e)).toList(),
      poll: json['poll'],
      group: json['group'],
      follow: json['follow'],
      savedPosts: json['savedPosts'],
      comments: List<dynamic>.from(json['comments']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class User {
  final int id;
  final String fullName;
  final String profilePic;
  final int isPrivateChat;
  final dynamic expireDate;
  final String status;
  final dynamic pauseDate;
  final String userType;
  final Map<String, dynamic> meta;

  User({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.isPrivateChat,
    this.expireDate,
    required this.status,
    this.pauseDate,
    required this.userType,
    required this.meta,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      profilePic: json['profile_pic'],
      isPrivateChat: json['is_private_chat'],
      expireDate: json['expire_date'],
      status: json['status'],
      pauseDate: json['pause_date'],
      userType: json['user_type'],
      meta: Map<String, dynamic>.from(json['meta']),
    );
  }
}

class LikeType {
  final String reactionType;
  final int feedId;
  final Map<String, dynamic> meta;

  LikeType({
    required this.reactionType,
    required this.feedId,
    required this.meta,
  });

  factory LikeType.fromJson(Map<String, dynamic> json) {
    return LikeType(
      reactionType: json['reaction_type'],
      feedId: json['feed_id'],
      meta: Map<String, dynamic>.from(json['meta']),
    );
  }
}

class Like {
  final int id;
  final int feedId;
  final int userId;
  final String reactionType;
  final String createdAt;
  final String updatedAt;
  final int isAnonymous;
  final Map<String, dynamic> meta;

  Like({
    required this.id,
    required this.feedId,
    required this.userId,
    required this.reactionType,
    required this.createdAt,
    required this.updatedAt,
    required this.isAnonymous,
    required this.meta,
  });

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      id: json['id'],
      feedId: json['feed_id'],
      userId: json['user_id'],
      reactionType: json['reaction_type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isAnonymous: json['is_anonymous'],
      meta: Map<String, dynamic>.from(json['meta']),
    );
  }
}

class Meta {
  final int views;

  Meta({required this.views});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(views: json['views']);
  }
}
*/
