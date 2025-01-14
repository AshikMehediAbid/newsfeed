class CreatePostApiResponse {
  final int? id;
  final int? schoolId;
  final int? userId;
  final int? courseId;
  final int? communityId;
  final int? groupId;
  final String? feedTxt;
  final String? status;
  final String? slug;
  final String? title;
  final String? activityType;
  final int? isPinned;
  final String? fileType;
  final List<dynamic>? files;
  final int? likeCount;
  final int? commentCount;
  final int? shareCount;
  final int? shareId;
  final Map<String, dynamic>? metaData;
  final String? createdAt;
  final String? updatedAt;
  final String? feedPrivacy;
  final int? isBackground;
  final String? bgColor;
  final int? pollId;
  final int? lessonId;
  final int? spaceId;
  final int? videoId;
  final int? streamId;
  final int? blogId;
  final String? scheduleDate;
  final String? timezone;
  final dynamic isAnonymous;
  final int? meetingId;
  final int? sellerId;
  final String? publishDate;
  final int? totalComments;
  final dynamic follow;
  final dynamic followUser;
  final dynamic streamDetails;
  final User? user;
  final Community? community;

  CreatePostApiResponse({
    required this.id,
    this.schoolId,
    this.userId,
    this.courseId,
    this.communityId,
    this.groupId,
    required this.feedTxt,
    this.status,
    this.slug,
    this.title,
    this.activityType,
    this.isPinned,
    this.fileType,
    this.files,
    this.likeCount,
    this.commentCount,
    this.shareCount,
    this.shareId,
    this.metaData,
    this.createdAt,
    this.updatedAt,
    this.feedPrivacy,
    this.isBackground,
    this.bgColor,
    this.pollId,
    this.lessonId,
    this.spaceId,
    this.videoId,
    this.streamId,
    this.blogId,
    this.scheduleDate,
    this.timezone,
    this.isAnonymous,
    this.meetingId,
    this.sellerId,
    required this.publishDate,
    required this.totalComments,
    this.follow,
    this.followUser,
    this.streamDetails,
    required this.user,
    required this.community,
  });

  factory CreatePostApiResponse.fromJson(Map<String, dynamic> json) {
    return CreatePostApiResponse(
      id: json['id'],
      schoolId: json['school_id'],
      userId: json['user_id'],
      courseId: json['course_id'],
      communityId: json['community_id'],
      groupId: json['group_id'],
      feedTxt: json['feed_txt'],
      status: json['status'],
      slug: json['slug'],
      title: json['title'],
      activityType: json['activity_type'],
      isPinned: json['is_pinned'],
      fileType: json['file_type'],
      files: json['files'],
      likeCount: json['like_count'],
      commentCount: json['comment_count'],
      shareCount: json['share_count'],
      shareId: json['share_id'],
      metaData: json['meta_data'],
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
      totalComments: json['total_comments'],
      follow: json['follow'],
      followUser: json['followUser'],
      streamDetails: json['stream_details'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      community: json['community'] != null ? Community.fromJson(json['community']) : null,
    );
  }
}

class User {
  final int? id;
  final String? fullName;
  final String? profilePic;
  final int? isPrivateChat;
  final String? status;

  User({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.isPrivateChat,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      profilePic: json['profile_pic'],
      isPrivateChat: json['is_private_chat'],
      status: json['status'],
    );
  }
}

class Community {
  final int id;
  final String groupName;
  final int schoolId;
  final String profilePic;
  final String cover;
  final String status;
  final String shortDescription;

  Community({
    required this.id,
    required this.groupName,
    required this.schoolId,
    required this.profilePic,
    required this.cover,
    required this.status,
    required this.shortDescription,
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json['id'],
      groupName: json['group_name'],
      schoolId: json['school_id'],
      profilePic: json['profile_pic'],
      cover: json['cover'],
      status: json['status'],
      shortDescription: json['short_description'],
    );
  }
}
