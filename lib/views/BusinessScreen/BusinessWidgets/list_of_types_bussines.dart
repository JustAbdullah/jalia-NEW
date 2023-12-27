import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../customWidgets/custom_padding.dart';
import 'package:shimmer/shimmer.dart';

class ListOfBusinessTypes extends StatelessWidget {
  const ListOfBusinessTypes({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getTypesCompenyFromDatabase(),
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
                              homeController.typeCom =
                                  snapshot.data['data'][i]['id_type_business'];
                              if (homeController.isFluterTypeWork.value ==
                                  false) {
                                homeController.countTheFluterWorks.value =
                                    homeController.countTheFluterWorks.value +
                                        1;
                              } else {}
                              homeController.theTypeWork.value = snapshot
                                  .data['data'][i]['name_type_work']
                                  .toString();
                              homeController.isFluterTypeWork.value = true;

                              homeController.showtheTypesOfWorks.value = false;
                              homeController.idOfTypeWork.value = int.parse(
                                  snapshot.data['data'][i]['id_type_work']
                                      .toString());
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 1.w),
                                child: Text(
                                  snapshot.data['data'][i]
                                      ['name_type_id_type_business'],
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
