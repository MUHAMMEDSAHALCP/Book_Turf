class PhoneOtpModel {
  String userOtp;
  String userNumber;
  String id;
  PhoneOtpModel(
      {required this.userNumber, required this.id, required this.userOtp});

  Map<String, dynamic> toJson() => {
        "user_otp": userOtp,
        "user_number": userNumber,
        "_id": id,
      };
}

class PhoneOtpModelResponse {
  bool? status;
  String? token;
  bool? error;
  String? message;

  PhoneOtpModelResponse({
    this.status,
    this.token,
    this.message,
    this.error,
  });

  factory PhoneOtpModelResponse.fromJson(Map<String, dynamic> json) {
    return PhoneOtpModelResponse(
      status: json["status"],
      token: json["jwt"],
    );
  }
}
