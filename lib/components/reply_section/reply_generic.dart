class ReplyGeneric {
  bool isLoading;

  ReplyGeneric({this.isLoading = false});

  ReplyGeneric update({bool? loading}) {
    return ReplyGeneric(isLoading: loading ?? this.isLoading);
  }
}
