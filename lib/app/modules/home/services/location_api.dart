import 'dart:developer';
import 'package:book_turf/app/components/error.handler.dart';
import 'package:book_turf/app/modules/home/model/location_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class GetUserLoction extends ChangeNotifier {
  GetUserLoction() {
    _location = Location();
    getUserLocation();
  }
  bool isLoading = true;
  dynamic userplaceName;
  Location? _location;
  Location? get location => _location;
  Future<UserLocationModel?> getUserLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGrantend;
    bool network = await checking();
    serviceEnabled = await location!.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location!.requestService();
    }
    permissionGrantend = await location!.hasPermission();
    if (permissionGrantend == PermissionStatus.denied) {
      permissionGrantend = await location!.requestPermission();
      if (permissionGrantend != PermissionStatus.granted) {}
    }
    if (network) {
      try {
        LocationData locationData = await location!.getLocation();
        double latitude = locationData.latitude!;
        double longitude = locationData.longitude!;
        log("response  lat: $latitude");
        log("response  lng: $longitude");
        Response response = await Dio().get(
            "https://api.mapbox.com/geocoding/v5/mapbox.places/$longitude,$latitude.json?limit=1&types=place%2Cpostcode%2Clocality&access_token=pk.eyJ1IjoibXVoYW1tZWRzYWhhbGNwIiwiYSI6ImNsODd3MGwyeTA3MnkzdnF1Zm82dzhtcWoifQ.YI-ZTjmYLRx0WskXF9sIbQ");
        log(
          "response ffd: ${response.data}",
        );
        if (response.statusCode! >= 200 && response.statusCode! < 299) {
          isLoading = false;
          notifyListeners();
          final userData = UserLocationModel.fromJson(response.data);
          userplaceName = userData.features!.first.placeName;
          log(userplaceName.toString());
          notifyListeners();
          return UserLocationModel.fromJson(response.data);
        }
      } catch (e) {
        return UserLocationModel(error: false, message: handleError(e));
      }
    } else {
      return UserLocationModel(
          error: false, message: "Please check your internet !!!");
    }
    return null;
  }
}
