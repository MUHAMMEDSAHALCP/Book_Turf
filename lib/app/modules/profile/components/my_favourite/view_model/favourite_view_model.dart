import 'dart:developer';

import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/modules/profile/components/my_favourite/services/favourite_api.dart';
import 'package:book_turf/app/modules/profile/components/my_favourite/view/my_favourite.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FavouriteViewModel extends ChangeNotifier {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<dynamic> favourite(context, NearestTurfDetails newData) async {
    String? userId = await secureStorage.read(key: "_id");
    log(" UserId : ${userId.toString()}");
    TurfNearestData data = TurfNearestData(
      userId: userId,
      data: [
        NearestTurfDetails(
          turfMunicipality: newData.turfMunicipality,
          id: newData.id,
          turfName: newData.turfName,
          turfPlace: newData.turfPlace,
          turfCreatorId: newData.turfCreatorId,
          turfDistrict: newData.turfDistrict,
          turfLogo: newData.turfLogo,
          turfAmenities: TurfAmenities(
            turfCafeteria: newData.turfAmenities!.turfCafeteria,
            turfDressing: newData.turfAmenities!.turfDressing,
            turfParking: newData.turfAmenities!.turfParking,
            turfGallery: newData.turfAmenities!.turfGallery,
            turfWashroom: newData.turfAmenities!.turfWashroom,
            turfWater: newData.turfAmenities!.turfWater,
          ),
          turfCategory: TurfCategory(
            turfBadminton: newData.turfCategory!.turfBadminton,
            turfCricket: newData.turfCategory!.turfCricket,
            urfFootball: newData.turfCategory!.urfFootball,
            turfYoga: newData.turfCategory!.turfYoga,
          ),
          turfImages: TurfImages(
            turfImages1: newData.turfImages!.turfImages1,
            turfImages2: newData.turfImages!.turfImages2,
            turfImages3: newData.turfImages!.turfImages3,
          ),
          turfInfo: TurfInfo(
            turfIsAvailable: newData.turfInfo!.turfIsAvailable,
            turfMap: newData.turfInfo!.turfMap,
            turfRating: newData.turfInfo!.turfRating,
          ),
          turfPrice: TurfPrice(
            afternoonPrice: newData.turfPrice!.afternoonPrice,
            eveningPrice: newData.turfPrice!.eveningPrice,
            morningPrice: newData.turfPrice!.morningPrice,
          ),
          turfTime: TurfTime(
            timeMorningStart: newData.turfTime!.timeMorningStart,
            timeMorningEnd: newData.turfTime!.timeMorningEnd,
            timeAfternoonStart: newData.turfTime!.timeAfternoonStart,
            timeAfternoonEnd: newData.turfTime!.timeAfternoonEnd,
            timeEveningStart: newData.turfTime!.timeEveningStart,
            timeEveningEnd: newData.turfTime!.timeEveningEnd,
          ),
          turfType: TurfType(
            turfSevens: newData.turfType!.turfSevens,
            turfSixes: newData.turfType!.turfSixes,
          ),
        ),
      ],
    );
    FavouriteApiService().favouriteApi(context, data);
  }

  List<NearestTurfDetails> favoriteList = [];
  void fetchData(context) async {
    favoriteList.clear();
    notifyListeners();
    TurfNearestData? response =
        await FavouriteApiService().fetchFavorite(context);
    log(response!.data.toString());
    if (response.status == true) {
      favoriteList.addAll(response.data!);
      notifyListeners();
    } else {
      SnackBarWidget.chekFormFill(context, response.message);
    }
  }
}
