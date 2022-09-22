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
    required this.status,
    required this.message,
    this.token,
  });

  bool status;
  String message;
  String? token;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"] ?? "No token",
      );
}
