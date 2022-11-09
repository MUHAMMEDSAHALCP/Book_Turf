import 'package:book_turf/app/components/turf_container.dart';
import 'package:book_turf/app/modules/details/view/details_view.dart';
import 'package:book_turf/app/modules/details/view_model/details_view_model.dart';
import 'package:book_turf/app/modules/search/view_model/search_view_model.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:book_turf/app/utilities/colors.dart';
import 'package:book_turf/app/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundcolor,
        body: Consumer<SearchViewModel>(
          builder: (BuildContext context, SearchViewModel data, _) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: boxDecoration.copyWith(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    height: 80,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: TextField(
                              onChanged: (value) {
                                data.runFilter(value);
                                print(value);
                              },
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                                hintText: 'Search turfs by Place name',
                                counterText: '',
                                suffixIcon: Icon(Icons.search_rounded),
                                fillColor: whiteColor,
                                filled: true,
                              ),
                              maxLength: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        data.searchList.isEmpty
                            ? const Center(
                                child: Text("No data found"),
                                // child: Image(
                                //     image:
                                //         AssetImage("assets/images/search.png")),
                              )
                            : Expanded(
                                child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: context
                                      .read<SearchViewModel>()
                                      .searchList
                                      .length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.5),
                                  ),
                                  itemBuilder: (context, index) {
                                    final newTurf = data.searchList[index];
                                    return TurfContainer(
                                      turfName: newTurf.turfName!,
                                      turfPlace: newTurf.turfPlace!,
                                      visible: false,
                                      turfImage: newTurf.turfLogo!,
                                      cardOnTap: () {
                                        context
                                            .read<DetailsViewModel>()
                                            .getBookTurf(newTurf, context);
                                        Navigations.push(
                                          DetailsView(
                                            data: newTurf,
                                          ),
                                        );
                                      },
                                      bookOnclick: () {},
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
