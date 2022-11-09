class PhoneModel {
  PhoneModel({
    required this.userNumber,
  });

  String userNumber;

  Map<String, dynamic> toJson() => {"user_number": userNumber};
}

class PhoneModelResponse {
  bool? status;
  String? id;
  bool? error;
  String? message;

  PhoneModelResponse({
    this.status,
    this.id,
    this.message,
    this.error,
  });

  factory PhoneModelResponse.fromJson(Map<String, dynamic> json) {
    return PhoneModelResponse(
      status: json["status"],
      id: json["_id"],
    );
  }
}
