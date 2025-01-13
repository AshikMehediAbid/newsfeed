class NewsfeedGeneric {
  bool isLoading;

  NewsfeedGeneric({this.isLoading = false});

  NewsfeedGeneric update({bool? loading}) {
    return NewsfeedGeneric(isLoading: loading ?? this.isLoading);
  }
}
