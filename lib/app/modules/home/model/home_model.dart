class HomeTurfModel {
  HomeTurfModel({
    this.status,
    this.data,
    this.message,
    this.error,
  });
  bool? status;
  List<Datum>? data;
  bool? error;
  String? message;

  factory HomeTurfModel.fromJson(Map<String, dynamic> json) => HomeTurfModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            .toList(),
      );
}

class Datum {
  Datum({
    required this.turfImages,
    required this.turfName,
    required this.turfPlace,
  });
  TurfImages turfImages;
  String turfName;
  String turfPlace;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        turfImages: TurfImages.fromJson(json["turf_images"]),
        turfName: json["turf_name"],
        turfPlace: json["turf_place"],
      );
}

class TurfImages {
  TurfImages({
    this.turfImages1,
  });

  String? turfImages1;

  factory TurfImages.fromJson(Map<String, dynamic> json) => TurfImages(
        turfImages1: json["turf_images1"],
      );
}
