class EmailOtpModel {
  EmailOtpModel({
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

class EmailOtpModelResponse {
  EmailOtpModelResponse({
    this.status,
    this.message,
    this.token,
    this.refreshToken,
    this.error,
  });
  bool? error;
  bool? status;
  String? token;
  String? refreshToken;
  String? message;
  factory EmailOtpModelResponse.fromJson(Map<String, dynamic> json) =>
      EmailOtpModelResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        refreshToken: json["refreshToken"],
        error: json["error"] ?? true,
      );
}
