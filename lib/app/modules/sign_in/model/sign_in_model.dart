class SigninModel {
  SigninModel({
    required this.userMail,
    required this.userPassword,
  });

  String userMail;
  String userPassword;

  Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
      };
}

class SignInResponse {
  SignInResponse({
    this.status,
    this.message,
    this.token,
    this.refreshToken,
    this.error,
    this.id,
  });
  String? id;
  bool? status;
  String? message;
  String? token;
  String? refreshToken;
  bool? error;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
      status: json["status"],
      message: json["message"],
      token: json["token"] ?? "No token",
      refreshToken: json["refreshToken"],
      id: json["_id"]);
}
