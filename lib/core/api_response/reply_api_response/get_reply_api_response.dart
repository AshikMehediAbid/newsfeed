class GetReplyApiResponse {
  final int id;
  final int schoolId;
  final int feedId;
  final int userId;
  final int replyCount;
  final int likeCount;
  final String commentText;
  final int parentId;
  final String createdAt;
  final String updatedAt;
  final dynamic file;
  final dynamic privateUserId;
  final int isAuthorAndAnonymous;
  final dynamic gift;
  final dynamic sellerId;
  final dynamic giftedCoins;
  final List<dynamic> replies;
  final User user;
  final List<dynamic> reactionTypes;
  final List<dynamic> totalLikes;
  final dynamic commentLike;

  GetReplyApiResponse({
    required this.id,
    required this.schoolId,
    required this.feedId,
    required this.userId,
    required this.replyCount,
    required this.likeCount,
    required this.commentText,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
    this.file,
    this.privateUserId,
    required this.isAuthorAndAnonymous,
    this.gift,
    this.sellerId,
    this.giftedCoins,
    required this.replies,
    required this.user,
    required this.reactionTypes,
    required this.totalLikes,
    this.commentLike,
  });

  factory GetReplyApiResponse.fromJson(Map<String, dynamic> json) {
    return GetReplyApiResponse(
      id: json['id'],
      schoolId: json['school_id'],
      feedId: json['feed_id'],
      userId: json['user_id'],
      replyCount: json['reply_count'],
      likeCount: json['like_count'],
      commentText: json['comment_txt'],
      parentId: json['parrent_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'], //DateTime.parse(json['updated_at']),
      file: json['file'],
      privateUserId: json['private_user_id'],
      isAuthorAndAnonymous: json['is_author_and_anonymous'],
      gift: json['gift'],
      sellerId: json['seller_id'],
      giftedCoins: json['gifted_coins'],
      replies: List<dynamic>.from(json['replies']),
      user: User.fromJson(json['user']),
      reactionTypes: List<dynamic>.from(json['reaction_types']),
      totalLikes: List<dynamic>.from(json['totalLikes']),
      commentLike: json['commentlike'],
    );
  }
}

class User {
  final int id;
  final String fullName;
  final String profilePic;
  final String userType;
  final Map<String, dynamic> meta;

  User({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.userType,
    required this.meta,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      profilePic: json['profile_pic'],
      userType: json['user_type'],
      meta: json['meta'],
    );
  }
}

// Example usage:
// final response = GetReplyApiResponse.fromJson(jsonData);
