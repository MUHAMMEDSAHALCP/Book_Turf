// class SpotTurfModel {
//   SpotTurfModel({
//     this.status,
//     this.data,
//   });
//   bool? status;
//   List<Datum>? data;

//   factory SpotTurfModel.fromJson(Map<String, dynamic> json) => SpotTurfModel(
//       status: json["status"],
//       data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
//           .toList());
// }

// class Datum {
//   Datum({
//     required this.turfName,
//     required this.turfPlace,
//     required this.turfImages,
//   });

//   String turfName;
//   String turfPlace;
//   TurfImages turfImages;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         turfName: json["turf_name"],
//         turfPlace: json["turf_place"],
//         turfImages: TurfImages.fromJson(json["turf_images"]),
//       );
// }

// class TurfImages {
//   TurfImages({
//     this.turfImages1,
//   });

//   String? turfImages1;

//   factory TurfImages.fromJson(Map<String, dynamic> json) => TurfImages(
//         turfImages1: json["turf_images1"],
//       );
// }

// class SpotTurfModel {
//   SpotTurfModel({
//     this.status,
//     this.length,
//     this.data,
//     this.error,
//     this.message,
//     this.userId,
//   });
//   String? userId;
//   String? message;
//   bool? error;
//   bool? status;
//   int? length;
//   List<Datum>? data;

//   factory SpotTurfModel.fromJson(Map<String, dynamic> json) => SpotTurfModel(
//         status: json["status"],
//         length: json["length"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "length": length,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   Datum({
//     this.turfCategory,
//     this.turfType,
//     this.turfInfo,
//     this.turfAmenities,
//     this.turfImages,
//     this.turfTime,
//     this.turfPrice,
//     this.id,
//     this.turfCreatorId,
//     this.turfName,
//     this.turfPlace,
//     this.turfMunicipality,
//     this.turfDistrict,
//     this.turfLogo,
//   });

//   TurfCategory? turfCategory;
//   TurfType? turfType;
//   TurfInfo? turfInfo;
//   TurfAmenities? turfAmenities;
//   TurfImages? turfImages;
//   TurfTime? turfTime;
//   TurfPrice? turfPrice;
//   String? id;
//   String? turfCreatorId;
//   String? turfName;
//   String? turfPlace;
//   String? turfMunicipality;
//   String? turfDistrict;
//   String? turfLogo;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         turfCategory: TurfCategory.fromJson(json["turf_category"]),
//         turfType: TurfType.fromJson(json["turf_type"]),
//         turfInfo: TurfInfo.fromJson(json["turf_info"]),
//         turfAmenities: TurfAmenities.fromJson(json["turf_amenities"]),
//         turfImages: TurfImages.fromJson(json["turf_images"]),
//         turfTime: TurfTime.fromJson(json["turf_time"]),
//         turfPrice: TurfPrice.fromJson(json["turf_price"]),
//         id: json["_id"],
//         turfCreatorId: json["turf_creator_id"],
//         turfName: json["turf_name"],
//         turfPlace: json["turf_place"],
//         turfMunicipality: json["turf_municipality"],
//         turfDistrict: json["turf_district"],
//         turfLogo: json["turf_logo"],
//       );

//   Map<String, dynamic> toJson() => {
//         "turf_category": turfCategory!.toJson(),
//         "turf_type": turfType!.toJson(),
//         "turf_info": turfInfo!.toJson(),
//         "turf_amenities": turfAmenities!.toJson(),
//         "turf_images": turfImages!.toJson(),
//         "turf_time": turfTime!.toJson(),
//         "turf_price": turfPrice!.toJson(),
//         "_id": id,
//         "turf_creator_id": turfCreatorId,
//         "turf_name": turfName,
//         "turf_place": turfPlace,
//         "turf_municipality": turfMunicipality,
//         "turf_district": turfDistrict,
//         "turf_logo": turfLogo,
//       };
// }

// class TurfAmenities {
//   TurfAmenities({
//     this.turfWashroom,
//     this.turfWater,
//     this.turfDressing,
//     this.turfParking,
//     this.turfGallery,
//     this.turfCafeteria,
//   });

//   bool? turfWashroom;
//   bool? turfWater;
//   bool? turfDressing;
//   bool? turfParking;
//   bool? turfGallery;
//   bool? turfCafeteria;

//   factory TurfAmenities.fromJson(Map<String, dynamic> json) => TurfAmenities(
//         turfWashroom: json["turf_washroom"],
//         turfWater: json["turf_water"],
//         turfDressing: json["turf_dressing"],
//         turfParking: json["turf_parking"],
//         turfGallery: json["turf_gallery"],
//         turfCafeteria: json["turf_cafeteria"],
//       );

//   Map<String, dynamic> toJson() => {
//         "turf_washroom": turfWashroom,
//         "turf_water": turfWater,
//         "turf_dressing": turfDressing,
//         "turf_parking": turfParking,
//         "turf_gallery": turfGallery,
//         "turf_cafeteria": turfCafeteria,
//       };
// }

// class TurfCategory {
//   TurfCategory({
//     this.turfCricket,
//     this.turfFootball,
//     this.turfBadminton,
//     this.turfYoga,
//   });

//   bool? turfCricket;
//   bool? turfFootball;
//   bool? turfBadminton;
//   bool? turfYoga;

//   factory TurfCategory.fromJson(Map<String, dynamic> json) => TurfCategory(
//         turfCricket: json["turf_cricket"],
//         turfFootball: json["turf_football"],
//         turfBadminton: json["turf_badminton"],
//         turfYoga: json["turf_yoga"],
//       );

//   Map<String, dynamic> toJson() => {
//         "turf_cricket": turfCricket,
//         "turf_football": turfFootball,
//         "turf_badminton": turfBadminton,
//         "turf_yoga": turfYoga,
//       };
// }

// class TurfImages {
//   TurfImages({
//     this.turfImages1,
//     this.turfImages2,
//     this.turfImages3,
//   });

//   String? turfImages1;
//   String? turfImages2;
//   String? turfImages3;

//   factory TurfImages.fromJson(Map<String, dynamic> json) => TurfImages(
//         turfImages1: json["turf_images1"],
//         turfImages2: json["turf_images2"],
//         turfImages3: json["turf_images3"],
//       );

//   Map<String, dynamic> toJson() => {
//         "turf_images1": turfImages1,
//         "turf_images2": turfImages2,
//         "turf_images3": turfImages3,
//       };
// }

// class TurfInfo {
//   TurfInfo({
//     this.turfIsAvailable,
//     this.turfRating,
//     this.turfMap,
//   });

//   bool? turfIsAvailable;
//   int? turfRating;
//   String? turfMap;

//   factory TurfInfo.fromJson(Map<String, dynamic> json) => TurfInfo(
//         turfIsAvailable: json["turf_isAvailable"],
//         turfRating: json["turf_rating"],
//         turfMap: json["turf_map"],
//       );

//   Map<String, dynamic> toJson() => {
//         "turf_isAvailable": turfIsAvailable,
//         "turf_rating": turfRating,
//         "turf_map": turfMap,
//       };
// }

// class TurfPrice {
//   TurfPrice({
//     this.morningPrice,
//     this.afternoonPrice,
//     this.eveningPrice,
//   });

//   int? morningPrice;
//   int? afternoonPrice;
//   int? eveningPrice;

//   factory TurfPrice.fromJson(Map<String, dynamic> json) => TurfPrice(
//         morningPrice: json["morning_price"],
//         afternoonPrice: json["afternoon_price"],
//         eveningPrice: json["evening_price"],
//       );

//   Map<String, dynamic> toJson() => {
//         "morning_price": morningPrice,
//         "afternoon_price": afternoonPrice,
//         "evening_price": eveningPrice,
//       };
// }

// class TurfTime {
//   TurfTime({
//     this.timeMorningStart,
//     this.timeMorningEnd,
//     this.timeAfternoonStart,
//     this.timeAfternoonEnd,
//     this.timeEveningStart,
//     this.timeEveningEnd,
//   });

//   int? timeMorningStart;
//   int? timeMorningEnd;
//   int? timeAfternoonStart;
//   int? timeAfternoonEnd;
//   int? timeEveningStart;
//   int? timeEveningEnd;

//   factory TurfTime.fromJson(Map<String, dynamic> json) => TurfTime(
//         timeMorningStart: json["time_morning_start"],
//         timeMorningEnd: json["time_morning_end"],
//         timeAfternoonStart: json["time_afternoon_start"],
//         timeAfternoonEnd: json["time_afternoon_end"],
//         timeEveningStart: json["time_evening_start"],
//         timeEveningEnd: json["time_evening_end"],
//       );

//   Map<String, dynamic> toJson() => {
//         "time_morning_start": timeMorningStart,
//         "time_morning_end": timeMorningEnd,
//         "time_afternoon_start": timeAfternoonStart,
//         "time_afternoon_end": timeAfternoonEnd,
//         "time_evening_start": timeEveningStart,
//         "time_evening_end": timeEveningEnd,
//       };
// }

// class TurfType {
//   TurfType({
//     this.turfSevens,
//     this.turfSixes,
//   });

//   bool? turfSevens;
//   bool? turfSixes;

//   factory TurfType.fromJson(Map<String, dynamic> json) => TurfType(
//         turfSevens: json["turf_sevens"],
//         turfSixes: json["turf_sixes"],
//       );

//   Map<String, dynamic> toJson() => {
//         "turf_sevens": turfSevens,
//         "turf_sixes": turfSixes,
//       };
// }
