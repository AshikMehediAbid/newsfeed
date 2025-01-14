class AddReplyApiResponse {
  String? commentTxt;
  int? feedId;
  int? parentId;
  int? userId;
  int? schoolId;
  bool? isAuthorAndAnonymous;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;
  List<dynamic>? replies;
  User? user;
  dynamic commentLike;
  List<dynamic>? reactionTypes;

  AddReplyApiResponse({
    this.commentTxt,
    this.feedId,
    this.parentId,
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

  factory AddReplyApiResponse.fromJson(Map<String, dynamic> json) {
    return AddReplyApiResponse(
      commentTxt: json['comment_txt'],
      feedId: json['feed_id'],
      parentId: json['parrent_id'],
      userId: json['user_id'],
      schoolId: json['school_id'],
      isAuthorAndAnonymous: json['is_author_and_anonymous'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      id: json['id'],
      replies: json['replies'] ?? [],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      commentLike: json['commentlike'],
      reactionTypes: json['reaction_types'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comment_txt': commentTxt,
      'feed_id': feedId,
      'parrent_id': parentId,
      'user_id': userId,
      'school_id': schoolId,
      'is_author_and_anonymous': isAuthorAndAnonymous,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
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
  int? canWriteDoc;
  String? fullName;
  String? isVerified;
  int? isApproved;
  String? userType;
  DateTime? createdAt;
  int? isPrivateChat;
  DateTime? updatedAt;
  String? profilePic;
  String? isOnline;
  String? bio;
  dynamic userId;
  dynamic socialAuthProvider;
  DateTime? lastLogin;
  String? status;
  int? isSuspended;
  dynamic pauseDate;
  dynamic expireDate;
  String? lastName;
  dynamic orderId;
  String? firstName;
  dynamic customFields;
  dynamic isAllowChat;
  dynamic refId;
  int? refCommissionLevel1;
  int? refIsCookieDestroyAfterCheckout;
  int? refCommissionLevel2;
  dynamic parentRefId;
  String? refComL1ValueType;
  String? refComL2ValueType;
  int? refAllowLinkedMembership;
  int? isManual;
  dynamic referredBy;
  int? isEligibleForSpecialOffer;
  dynamic isFounding;
  dynamic planId;
  int? is2faEnabled;
  dynamic webpushsub;
  int? isForceLogoutEnabled;
  dynamic payoutPaypalEmail;
  int? refPhyCommissionLevel1;
  int? isManualPrivateChat;
  String? refPhyComL1ValueType;
  dynamic siteOwnerUserId;
  dynamic ezyAffiliateUserId;
  int? stripePayoutEnabled;
  String? signupMethod;
  dynamic deletedAt;
  dynamic signupCustomFieldsResponses;
  dynamic deletedBy;
  int? refPhyCommissionLevel2;
  String? refPhyComL2ValueType;
  int? totalNotiCount;
  int? totalChatNotiCount;
  String? aboutMe;
  dynamic totalSell;
  dynamic sellerUniqueName;
  String? globeLink;
  String? youtubeLink;
  String? linkedinLink;
  String? facebookLink;
  dynamic sellerTitle;
  String? coverPic;
  dynamic affiliateCouponCode;
  dynamic affiliateCouponUuid;
  Meta? meta;

  User({
    this.id,
    this.schoolId,
    this.canWriteDoc,
    this.fullName,
    this.isVerified,
    this.isApproved,
    this.userType,
    this.createdAt,
    this.isPrivateChat,
    this.updatedAt,
    this.profilePic,
    this.isOnline,
    this.bio,
    this.userId,
    this.socialAuthProvider,
    this.lastLogin,
    this.status,
    this.isSuspended,
    this.pauseDate,
    this.expireDate,
    this.lastName,
    this.orderId,
    this.firstName,
    this.customFields,
    this.isAllowChat,
    this.refId,
    this.refCommissionLevel1,
    this.refIsCookieDestroyAfterCheckout,
    this.refCommissionLevel2,
    this.parentRefId,
    this.refComL1ValueType,
    this.refComL2ValueType,
    this.refAllowLinkedMembership,
    this.isManual,
    this.referredBy,
    this.isEligibleForSpecialOffer,
    this.isFounding,
    this.planId,
    this.is2faEnabled,
    this.webpushsub,
    this.isForceLogoutEnabled,
    this.payoutPaypalEmail,
    this.refPhyCommissionLevel1,
    this.isManualPrivateChat,
    this.refPhyComL1ValueType,
    this.siteOwnerUserId,
    this.ezyAffiliateUserId,
    this.stripePayoutEnabled,
    this.signupMethod,
    this.deletedAt,
    this.signupCustomFieldsResponses,
    this.deletedBy,
    this.refPhyCommissionLevel2,
    this.refPhyComL2ValueType,
    this.totalNotiCount,
    this.totalChatNotiCount,
    this.aboutMe,
    this.totalSell,
    this.sellerUniqueName,
    this.globeLink,
    this.youtubeLink,
    this.linkedinLink,
    this.facebookLink,
    this.sellerTitle,
    this.coverPic,
    this.affiliateCouponCode,
    this.affiliateCouponUuid,
    this.meta,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      schoolId: json['school_id'],
      canWriteDoc: json['can_write_doc'],
      fullName: json['full_name'],
      isVerified: json['is_verified'],
      isApproved: json['is_approved'],
      userType: json['user_type'],
      createdAt: DateTime.parse(json['created_at']),
      isPrivateChat: json['is_private_chat'],
      updatedAt: DateTime.parse(json['updated_at']),
      profilePic: json['profile_pic'],
      isOnline: json['is_online'],
      bio: json['bio'],
      userId: json['user_id'],
      socialAuthProvider: json['social_auth_provider'],
      lastLogin: DateTime.parse(json['last_login']),
      status: json['status'],
      isSuspended: json['is_suspended'],
      pauseDate: json['pause_date'],
      expireDate: json['expire_date'],
      lastName: json['last_name'],
      orderId: json['order_id'],
      firstName: json['first_name'],
      customFields: json['custom_fields'],
      isAllowChat: json['is_allow_chat'],
      refId: json['ref_id'],
      refCommissionLevel1: json['ref_commission_level_1'],
      refIsCookieDestroyAfterCheckout: json['ref_is_cookie_destroy_after_checkout'],
      refCommissionLevel2: json['ref_commission_level_2'],
      parentRefId: json['parent_ref_id'],
      refComL1ValueType: json['ref_com_l1_value_type'],
      refComL2ValueType: json['ref_com_l2_value_type'],
      refAllowLinkedMembership: json['ref_allow_linked_membership'],
      isManual: json['is_manual'],
      referredBy: json['referred_by'],
      isEligibleForSpecialOffer: json['is_eligible_for_special_offer'],
      isFounding: json['is_founding'],
      planId: json['plan_id'],
      is2faEnabled: json['is_2fa_enabled'],
      webpushsub: json['webpushsub'],
      isForceLogoutEnabled: json['is_force_logout_enabled'],
      payoutPaypalEmail: json['payout_paypal_email'],
      refPhyCommissionLevel1: json['ref_phy_commission_level_1'],
      isManualPrivateChat: json['is_manual_private_chat'],
      refPhyComL1ValueType: json['ref_phy_com_l1_value_type'],
      siteOwnerUserId: json['site_owner_user_id'],
      ezyAffiliateUserId: json['ezy_affiliate_user_id'],
      stripePayoutEnabled: json['stripe_payout_enabled'],
      signupMethod: json['signup_method'],
      deletedAt: json['deleted_at'],
      signupCustomFieldsResponses: json['signup_custom_fields_responses'],
      deletedBy: json['deleted_by'],
      refPhyCommissionLevel2: json['ref_phy_commission_level_2'],
      refPhyComL2ValueType: json['ref_phy_com_l2_value_type'],
      totalNotiCount: json['total_noti_count'],
      totalChatNotiCount: json['total_chat_noti_count'],
      aboutMe: json['about_me'],
      totalSell: json['total_sell'],
      sellerUniqueName: json['seller_unique_name'],
      globeLink: json['globe_link'],
      youtubeLink: json['youtube_link'],
      linkedinLink: json['linkedin_link'],
      facebookLink: json['facebook_link'],
      sellerTitle: json['seller_title'],
      coverPic: json['cover_pic'],
      affiliateCouponCode: json['affiliate_coupon_code'],
      affiliateCouponUuid: json['affiliate_coupon_uuid'],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school_id': schoolId,
      'can_write_doc': canWriteDoc,
      'full_name': fullName,
      'is_verified': isVerified,
      'is_approved': isApproved,
      'user_type': userType,
      'created_at': createdAt?.toIso8601String(),
      'is_private_chat': isPrivateChat,
      'updated_at': updatedAt?.toIso8601String(),
      'profile_pic': profilePic,
      'is_online': isOnline,
      'bio': bio,
      'user_id': userId,
      'social_auth_provider': socialAuthProvider,
      'last_login': lastLogin?.toIso8601String(),
      'status': status,
      'is_suspended': isSuspended,
      'pause_date': pauseDate,
      'expire_date': expireDate,
      'last_name': lastName,
      'order_id': orderId,
      'first_name': firstName,
      'custom_fields': customFields,
      'is_allow_chat': isAllowChat,
      'ref_id': refId,
      'ref_commission_level_1': refCommissionLevel1,
      'ref_is_cookie_destroy_after_checkout': refIsCookieDestroyAfterCheckout,
      'ref_commission_level_2': refCommissionLevel2,
      'parent_ref_id': parentRefId,
      'ref_com_l1_value_type': refComL1ValueType,
      'ref_com_l2_value_type': refComL2ValueType,
      'ref_allow_linked_membership': refAllowLinkedMembership,
      'is_manual': isManual,
      'referred_by': referredBy,
      'is_eligible_for_special_offer': isEligibleForSpecialOffer,
      'is_founding': isFounding,
      'plan_id': planId,
      'is_2fa_enabled': is2faEnabled,
      'webpushsub': webpushsub,
      'is_force_logout_enabled': isForceLogoutEnabled,
      'payout_paypal_email': payoutPaypalEmail,
      'ref_phy_commission_level_1': refPhyCommissionLevel1,
      'is_manual_private_chat': isManualPrivateChat,
      'ref_phy_com_l1_value_type': refPhyComL1ValueType,
      'site_owner_user_id': siteOwnerUserId,
      'ezy_affiliate_user_id': ezyAffiliateUserId,
      'stripe_payout_enabled': stripePayoutEnabled,
      'signup_method': signupMethod,
      'deleted_at': deletedAt,
      'signup_custom_fields_responses': signupCustomFieldsResponses,
      'deleted_by': deletedBy,
      'ref_phy_commission_level_2': refPhyCommissionLevel2,
      'ref_phy_com_l2_value_type': refPhyComL2ValueType,
      'total_noti_count': totalNotiCount,
      'total_chat_noti_count': totalChatNotiCount,
      'about_me': aboutMe,
      'total_sell': totalSell,
      'seller_unique_name': sellerUniqueName,
      'globe_link': globeLink,
      'youtube_link': youtubeLink,
      'linkedin_link': linkedinLink,
      'facebook_link': facebookLink,
      'seller_title': sellerTitle,
      'cover_pic': coverPic,
      'affiliate_coupon_code': affiliateCouponCode,
      'affiliate_coupon_uuid': affiliateCouponUuid,
      'meta': meta?.toJson(),
    };
  }
}

class Meta {
  dynamic accessToken;
  dynamic createdBy;
  int? isEnrolled;
  dynamic organizerId;
  dynamic privateChatOwnerSellerId;
  int? isPrivateChatFromSeller;

  Meta({
    this.accessToken,
    this.createdBy,
    this.isEnrolled,
    this.organizerId,
    this.privateChatOwnerSellerId,
    this.isPrivateChatFromSeller,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      accessToken: json['accessToken'],
      createdBy: json['created_by'],
      isEnrolled: json['is_enrolled'],
      organizerId: json['organizer_id'],
      privateChatOwnerSellerId: json['private_chat_owner_seller_id'],
      isPrivateChatFromSeller: json['is_private_chat_from_seller'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'created_by': createdBy,
      'is_enrolled': isEnrolled,
      'organizer_id': organizerId,
      'private_chat_owner_seller_id': privateChatOwnerSellerId,
      'is_private_chat_from_seller': isPrivateChatFromSeller,
    };
  }
}
