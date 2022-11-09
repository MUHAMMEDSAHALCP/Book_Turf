class GetBookTurfModel {
  GetBookTurfModel({
    this.status,
    this.data,
    this.message,
    this.error,
  });
  bool? error;
  String? message;
  bool? status;
  List<Datum>? data;

  factory GetBookTurfModel.fromJson(Map<String, dynamic> json) =>
      GetBookTurfModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"] ?? true,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.bookingDate,
    this.turfId,
    this.timeSlot,
  });

  String? id;
  String? bookingDate;
  String? turfId;
  List<int>? timeSlot;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        bookingDate: json["booking_date"],
        turfId: json["turf_id"],
        timeSlot: List<int>.from(json["time_slot"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "booking_date": bookingDate,
        "turf_id": turfId,
        "time_slot": List<dynamic>.from(timeSlot!.map((x) => x)),
      };
}
