class UserLocationModel {
  UserLocationModel({
    this.features,
    this.type,
  });
  String? type;
  List<Feature>? features;

  factory UserLocationModel.fromJson(Map<String, dynamic> json) =>
      UserLocationModel(
        features: List<Feature>.from(
          json["features"].map(
            (dynamic x) => Feature.fromJson(x),
          ),
        ),
        type: json["type"],
      );
}

class Feature {
  Feature({
    this.placeName,
  });
  String? placeName;
  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        placeName: json["place_name"],
      );
}
