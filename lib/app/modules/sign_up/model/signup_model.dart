class SignUpModel {
  SignUpModel({
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

class SignUpResponse {
  SignUpResponse({
    required this.status,
    required this.id,
  });

  bool status;
  String id;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        status: json["status"],
        id: json["id"],
      );
}
