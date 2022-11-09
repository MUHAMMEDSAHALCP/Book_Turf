class SignUpModel {
  SignUpModel({
    this.userMail,
    this.userPassword,
  });

  String? userMail;
  String? userPassword;
  Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
      };
}

class SignUpResponse {
  SignUpResponse({
    this.status,
    this.id,
    this.message,
    this.error,
  });
  bool? error;
  bool? status;
  String? id;
  String? message;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        status: json["status"],
        id: json["id"],
        message: json["message"],
        error: json["error"] ?? true,
      );
}
