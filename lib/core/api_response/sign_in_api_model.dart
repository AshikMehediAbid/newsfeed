class SignInApiResponse {
/*  int status;
  String message;
  Object data;*/

  String? type, token, msg;

  SignInApiResponse({this.type, this.token, this.msg});

  // fromJson method to convert JSON to ApiResponse object
  factory SignInApiResponse.fromJson(Map<String, dynamic> json) {
    return SignInApiResponse(
/*      status: json['status'],
      message: json['message'],
      data: json['data'], // Assuming data is dynamic; could be a specific type if known*/
      type: json['type'],
      token: json['token'],
      msg: json['msg'],
    );
  }

  // toJson method to convert ApiResponse object to JSON
  Map<String, dynamic> toJson() {
    return {
      //'status': status,
      //'message': message,
      //'data': data, // This will need to be adjusted if 'data' is a complex type

      'type': type,
      'token': token,
      'msg': msg,
    };
  }
}
