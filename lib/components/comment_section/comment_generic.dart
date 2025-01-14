class CommentGeneric {
  bool isLoading;

  CommentGeneric({this.isLoading = false});

  CommentGeneric update({bool? loading}) {
    return CommentGeneric(isLoading: loading ?? this.isLoading);
  }
}
