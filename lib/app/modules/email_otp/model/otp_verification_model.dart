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
    this.error,
  });

  bool? status;
  String? message;
  bool? error;

  factory EmailOtpModelResponse.fromJson(Map<String, dynamic> json) =>
      EmailOtpModelResponse(
        status: json["status"],
        message: json["message"],
      );
}
