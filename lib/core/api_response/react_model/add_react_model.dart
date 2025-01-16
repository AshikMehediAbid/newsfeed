class AddReact {
  final int totalReactions;
  final List<LikeType> likeType;

  AddReact({
    required this.totalReactions,
    required this.likeType,
  });

  factory AddReact.fromJson(Map<String, dynamic> json) {
    return AddReact(
      totalReactions: json['total_reactions'],
      likeType: (json['likeType'] as List<dynamic>).map((e) => LikeType.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_reactions': totalReactions,
      'likeType': likeType.map((e) => e.toJson()).toList(),
    };
  }
}

class LikeType {
  final String reactionType;
  final Map<String, dynamic> meta;

  LikeType({
    required this.reactionType,
    required this.meta,
  });

  factory LikeType.fromJson(Map<String, dynamic> json) {
    return LikeType(
      reactionType: json['reaction_type'],
      meta: json['meta'] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reaction_type': reactionType,
      'meta': meta,
    };
  }
}
