class GetCommentApiResponse {
  final int id;
  final int schoolId;
  final int feedId;
  final int userId;
  final int replyCount;
  final int likeCount;
  final String commentText;
  final int? parentId;
  final String createdAt;
  final String updatedAt;
  final String? file;
  final int? privateUserId;
  final int isAuthorAndAnonymous;
  final String? gift;
  final int? sellerId;
  final int? giftedCoins;
  final List<dynamic> replies;
  final dynamic privateUser;
  final User user;
  final dynamic commentLike;
  final List<dynamic> reactionTypes;
  final List<dynamic> totalLikes;

  GetCommentApiResponse({
    required this.id,
    required this.schoolId,
    required this.feedId,
    required this.userId,
    required this.replyCount,
    required this.likeCount,
    required this.commentText,
    this.parentId,
    required this.createdAt,
    required this.updatedAt,
    this.file,
    this.privateUserId,
    required this.isAuthorAndAnonymous,
    this.gift,
    this.sellerId,
    this.giftedCoins,
    required this.replies,
    this.privateUser,
    required this.user,
    this.commentLike,
    required this.reactionTypes,
    required this.totalLikes,
  });

  factory GetCommentApiResponse.fromJson(Map<String, dynamic> json) {
    return GetCommentApiResponse(
      id: json['id'],
      schoolId: json['school_id'],
      feedId: json['feed_id'],
      userId: json['user_id'],
      replyCount: json['reply_count'],
      likeCount: json['like_count'],
      commentText: json['comment_txt'],
      parentId: json['parrent_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      file: json['file'],
      privateUserId: json['private_user_id'],
      isAuthorAndAnonymous: json['is_author_and_anonymous'],
      gift: json['gift'],
      sellerId: json['seller_id'],
      giftedCoins: json['gifted_coins'],
      replies: json['replies'] ?? [],
      privateUser: json['private_user'],
      user: User.fromJson(json['user']),
      commentLike: json['commentlike'],
      reactionTypes: json['reaction_types'] ?? [],
      totalLikes: json['totalLikes'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school_id': schoolId,
      'feed_id': feedId,
      'user_id': userId,
      'reply_count': replyCount,
      'like_count': likeCount,
      'comment_txt': commentText,
      'parrent_id': parentId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'file': file,
      'private_user_id': privateUserId,
      'is_author_and_anonymous': isAuthorAndAnonymous,
      'gift': gift,
      'seller_id': sellerId,
      'gifted_coins': giftedCoins,
      'replies': replies,
      'private_user': privateUser,
      'user': user.toJson(),
      'commentlike': commentLike,
      'reaction_types': reactionTypes,
      'totalLikes': totalLikes,
    };
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
      meta: json['meta'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'profile_pic': profilePic,
      'user_type': userType,
      'meta': meta,
    };
  }
}
