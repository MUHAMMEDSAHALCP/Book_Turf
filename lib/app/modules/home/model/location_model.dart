class UserLocationModel {
  UserLocationModel({
    this.message,
    this.error,
    this.features,
  });
  String? message;
  bool? error;
  List<Feature>? features;

  factory UserLocationModel.fromJson(Map<String, dynamic> json) =>
      UserLocationModel(
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
      );
}

class Feature {
  Feature({
    this.placeName,
    this.context,
  });

  String? placeName;
  List<Context>? context;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        placeName: json["place_name"],
        context:
            List<Context>.from(json["context"].map((x) => Context.fromJson(x))),
      );
}

class Context {
  Context({
    this.text,
  });

  String? text;

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        text: json["text"],
      );
}
