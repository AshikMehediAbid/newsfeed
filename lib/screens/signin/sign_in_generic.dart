class SignInGeneric {
  bool isLoading;

  SignInGeneric({this.isLoading = false});

  SignInGeneric update({bool? loading}) {
    return SignInGeneric(isLoading: loading ?? this.isLoading);
  }
}
