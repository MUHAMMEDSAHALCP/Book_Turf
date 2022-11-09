class BookingTurfModel {
  BookingTurfModel({
    this.bookingDate,
    this.turfId,
    this.timeSlot,
  });

  String? bookingDate;
  String? turfId;
  List<dynamic>? timeSlot;

  factory BookingTurfModel.fromJson(Map<String, dynamic> json) =>
      BookingTurfModel(
        bookingDate: json["booking_date"],
        turfId: json["turf_id"],
        timeSlot: List<int>.from(json["time_slot"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "booking_date": bookingDate,
        "turf_id": turfId,
        "time_slot": List<dynamic>.from(timeSlot!.map((x) => x)),
      };
}

class BookingTurfModelResponse {
  BookingTurfModelResponse({
    this.status,
    this.message,
  });
  
  bool? status;
  String? message;

  factory BookingTurfModelResponse.fromJson(Map<String, dynamic> json) =>
      BookingTurfModelResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
