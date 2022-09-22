class OtpModel {
  OtpModel({
    this.userOtp,
    this.id,
  });

  String? userOtp;
  String? id;

  Map<String, dynamic> toJson() => {
        "user_otp": userOtp,
        "_id": id,
      };
}

class OtpModelResponse {
  OtpModelResponse({
    required this.status,
    required this.message,
    required this.jwt,
  });

  bool status;
  String message;
  String jwt;

  factory OtpModelResponse.fromJson(Map<String, dynamic> json) =>
      OtpModelResponse(
        status: json["status"],
        message: json["message"],
        jwt: json["jwt"],
      );
 
}
