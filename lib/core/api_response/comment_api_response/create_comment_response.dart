class CommentApiResponse {
  String? commentTxt;
  int? feedId;
  int? userId;
  int? schoolId;
  bool? isAuthorAndAnonymous;
  String? createdAt;
  String? updatedAt;
  int? id;
  List<dynamic>? replies;
  User? user;
  dynamic commentLike;
  List<dynamic>? reactionTypes;

  CommentApiResponse({
    this.commentTxt,
    this.feedId,
    this.userId,
    this.schoolId,
    this.isAuthorAndAnonymous,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.replies,
    this.user,
    this.commentLike,
    this.reactionTypes,
  });

  factory CommentApiResponse.fromJson(Map<String, dynamic> json) {
    return CommentApiResponse(
      commentTxt: json['comment_txt'],
      feedId: json['feed_id'],
      userId: json['user_id'],
      schoolId: json['school_id'],
      isAuthorAndAnonymous: json['is_author_and_anonymous'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      id: json['id'],
      replies: json['replies'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      commentLike: json['commentlike'],
      reactionTypes: json['reaction_types'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment_txt': commentTxt,
      'feed_id': feedId,
      'user_id': userId,
      'school_id': schoolId,
      'is_author_and_anonymous': isAuthorAndAnonymous,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'id': id,
      'replies': replies,
      'user': user?.toJson(),
      'commentlike': commentLike,
      'reaction_types': reactionTypes,
    };
  }
}

class User {
  int? id;
  int? schoolId;
  String? fullName;
  String? profilePic;
  String? status;
  String? aboutMe;
  // Meta? meta;

  User({
    this.id,
    this.schoolId,
    this.fullName,
    this.profilePic,
    this.status,
    this.aboutMe,
    // this.meta,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      schoolId: json['school_id'],
      fullName: json['full_name'],
      profilePic: json['profile_pic'],
      status: json['status'],
      aboutMe: json['about_me'],
      //  meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school_id': schoolId,
      'full_name': fullName,
      'profile_pic': profilePic,
      'status': status,
      'about_me': aboutMe,
      // 'meta': meta?.toJson(),
    };
  }
}

/*
class Meta {
  bool? isEnrolled;

  Meta({this.isEnrolled});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      isEnrolled: json['is_enrolled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_enrolled': isEnrolled,
    };
  }
}
*/
