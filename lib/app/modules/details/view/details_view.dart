import 'package:book_turf/app/components/button_widget.dart';
import 'package:book_turf/app/components/custom_appbar.dart';
import 'package:book_turf/app/components/turf_type_bar.dart';
import 'package:book_turf/app/modules/booking/view/booking_view.dart';
import 'package:book_turf/app/modules/booking/view_model/booking_view_model.dart';
import 'package:book_turf/app/modules/details/view_model/details_view_model.dart';
import 'package:book_turf/app/modules/details/view/widgets/aminities_container.dart';
import 'package:book_turf/app/modules/details/widgets/circle_avatar.dart';
import 'package:book_turf/app/modules/details/widgets/text_button_widget.dart';
import 'package:book_turf/app/modules/home/model/home_model.dart';
import 'package:book_turf/app/modules/profile/components/my_favourite/view_model/favourite_view_model.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
  static String id = "Detials_view";
  final NearestTurfDetails? data;
  const DetailsView({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundcolor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  text: "Turf Details",
                  visible: true,
                  favouriteOnClick: () {
                    context
                        .read<FavouriteViewModel>()
                        .favourite(context, data!);
                  },
                ),
                height20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        data!.turfImages!.turfImages1
                                            .toString(),
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          width5,
                          CircleAvatarWidget(
                              borderRadius: 55,
                              radius: 50,
                              networkImage: data!.turfLogo.toString()),
                          width5,
                          Expanded(
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        data!.turfImages!.turfImages3
                                            .toString(),
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      height30,
                      Center(
                        child:
                            Text(data!.turfName.toString(), style: textStyle),
                      ),
                      height5,
                      Center(
                        child: Text(
                          data!.turfPlace.toString(),
                          style: textStyle.copyWith(
                              color: primaryColor, fontSize: 15),
                        ),
                      ),
                      height30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButtonWidget(
                            onPressed: () {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30.0))),
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Morning",
                                              style: textStyle,
                                            ),
                                            Text(
                                              data!.turfPrice!.morningPrice
                                                  .toString(),
                                              style: textStyle.copyWith(
                                                  color: redColor,
                                                  fontSize: 15),
                                            ),
                                            height20,
                                            const Text(
                                              "After noon",
                                              style: textStyle,
                                            ),
                                            Text(
                                              data!.turfPrice!.afternoonPrice
                                                  .toString(),
                                              style: textStyle.copyWith(
                                                color: redColor,
                                                fontSize: 15,
                                              ),
                                            ),
                                            height20,
                                            const Text(
                                              "Evening",
                                              style: textStyle,
                                            ),
                                            Text(
                                              data!.turfPrice!.afternoonPrice
                                                  .toString(),
                                              style: textStyle.copyWith(
                                                color: redColor,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            text: "Pricing",
                          ),
                          width5,
                          TextButtonWidget(
                              onPressed: () {
                                context
                                    .read<DetailsViewModel>()
                                    .openMap(data!.turfInfo!.turfMap);
                              },
                              text: "Location"),
                        ],
                      ),
                      height30,
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: boxDecoration.copyWith(color: primaryColor),
                        child: Center(
                          child: TurfTypeBar(
                            text: data!.turfType!.turfSixes! == true
                                ? "6's"
                                : "7's",
                          ),
                        ),
                      ),
                      height30,
                      const Text(
                        "Amenities",
                        style: textStyle,
                      ),
                      height10,
                    ],
                  ),
                ),
                Center(
                  child: Wrap(
                    children: [
                      AminitiesContainer(
                          text: data!.turfAmenities!.turfWater! == true
                              ? "Water"
                              : ""),
                      AminitiesContainer(
                          text: data!.turfAmenities!.turfCafeteria! == true
                              ? "Cafeteria"
                              : ""),
                      AminitiesContainer(
                        text: data!.turfAmenities!.turfParking! == true
                            ? "Parking"
                            : "",
                      ),
                      AminitiesContainer(
                        text: data!.turfAmenities!.turfDressing! == true
                            ? "Dressing"
                            : "",
                      ),
                      AminitiesContainer(
                        text: data!.turfAmenities!.turfGallery! == true
                            ? "Gallery"
                            : "",
                      ),
                      AminitiesContainer(
                        text: data!.turfAmenities!.turfWashroom! == true
                            ? "Washroom"
                            : "",
                      ),
                    ],
                  ),
                ),
                height30,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child:
                      Consumer<DetailsViewModel>(builder: (context, value, _) {
                    return MaterialButtonWidget(
                      isLoading: value.isLoading == true
                          ? const CupertinoActivityIndicator(
                              color: whiteColor,
                              radius: 15,
                            )
                          : Text(
                              "Book now",
                              style: textStyle.copyWith(
                                color: whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      color: secondaryColor,
                      textColor: whiteColor,
                      onClick: () {
                        context
                            .read<BookingViewModel>()
                            .addTurfTimeSlot(data!, context);
                        context.read<BookingViewModel>().disposeValue();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingView(data: data)));
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
