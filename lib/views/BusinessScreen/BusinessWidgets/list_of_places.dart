import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';

import '../../../customWidgets/custom_padding.dart';
import 'package:shimmer/shimmer.dart';

class ListOfPlaces extends StatelessWidget {
  const ListOfPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getTPlacesFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200.h,
              color: AppColors.whiteColorTypeTwo,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return PaddingCustom(
                      theBottom: 14,
                      theLeft: 13,
                      theRight: 13,
                      theTop: 14,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: InkWell(
                            onTap: () {
                              homeController.placeCom = snapshot.data['data'][i]
                                      ['id_place']
                                  .toString();
                              if (homeController.isFluterPlaceWork.value ==
                                  false) {
                                homeController.countTheFluterWorks.value =
                                    homeController.countTheFluterWorks.value +
                                        1;
                              } else {}

                              homeController.placeCom = snapshot.data['data'][i]
                                      ['id_place']
                                  .toString();
                              homeController.thePlaceWork.value = snapshot
                                  .data['data'][i]['name_id_place']
                                  .toString();
                              homeController.isFluterPlaceWork.value = true;
                              homeController.idOfPlaceWork.value = int.parse(
                                  snapshot.data['data'][i]['id_place']
                                      .toString());

                              homeController.showthePlaces.value = false;
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.w, vertical: 1.h),
                                child: Text(
                                  snapshot.data['data'][i]['name_id_place'],
                                  style: TextStyle(
                                    height: 1,
                                    color: AppColors.blackColor,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )),
                    );
                  }),
            );
          } else {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 15,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Shimmer.fromColors(
                      baseColor: Color.fromARGB(31, 83, 82, 82),
                      highlightColor: AppColors.whiteColor,
                      enabled: true,
                      child: PaddingCustom(
                        theTop: 10,
                        theBottom: 10,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 200.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                ))),
                      ));
                });
          }
        });
  }
}
