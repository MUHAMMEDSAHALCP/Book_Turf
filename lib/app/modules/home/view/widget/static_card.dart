import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/bottom_navigation/view_model/bottom_nav_provider.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StaticCard extends StatelessWidget {
  const StaticCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .18,
      width: double.infinity,
      decoration: boxDecoration.copyWith(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      "Hi, Muhammed sahal",
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.copyWith(
                        color: whiteColor,
                      ),
                    ),
                  ),
                  height10,
                  FittedBox(
                    child: Text(
                      "Explore vanues and\nbook your favourite spot.",
                      style: textStyle.copyWith(
                        color: greyColor.shade300,
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, BottomNavView.id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomNavView()));
                        Provider.of<BottomNavProvider>(context, listen: false)
                            .currentIndexState(0);
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/static_new.png",
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
