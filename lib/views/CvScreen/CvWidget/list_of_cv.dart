import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_container.dart';

import 'package:shimmer/shimmer.dart';

import 'detilas_cv.dart';

class ListOfCv extends StatelessWidget {
  const ListOfCv({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getTheGoldUsersFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ContainerCustom(
                heigthContainer: MediaQuery.sizeOf(context).height,
                widthContainer: MediaQuery.sizeOf(context).width,
                colorContainer: AppColors.whiteColorTypeTwo,
                child: GridView.builder(
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, i) {
                      return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          child: InkWell(
                              onTap: () async {
                                homeController.getDataCvUser(
                                  snapshot.data['data'][i]['user_id']
                                      .toString(),
                                );
                                Future.delayed(const Duration(seconds: 1),
                                    () async {
                                  Get.to(DetalasCv());
                                });
                              },
                              child: Container(
                                height: 130.h,
                                color: AppColors.whiteColor,
                                child: Column(children: [
                                  Image.asset(ImagesPath.crown,
                                      width: 80.w,
                                      height: 100.h,
                                      fit: BoxFit.contain),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 15.h,
                                      child: Text(
                                        snapshot.data['data'][i]['user_name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 1.h,
                                            fontSize: 15,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.yellowColor),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                ]),
                              )));
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (1 / 1.3),
                        crossAxisCount: 3,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0)));
          } else
            return GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Shimmer.fromColors(
                      baseColor: Color.fromARGB(31, 83, 82, 82),
                      highlightColor: AppColors.whiteColor,
                      enabled: true,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          child: InkWell(
                              onTap: () async {
/////////////////////
                              },
                              child: Container(
                                height: 130.h,
                                color: AppColors.whiteColor,
                                child: Column(children: [
                                  Image.asset(ImagesPath.logo,
                                      width: 70.w,
                                      height: 100.h,
                                      fit: BoxFit.cover),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 15.h,
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            height: 1.h,
                                            fontSize: 15,
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                AppColors.balckColorTypeThree),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ]),
                              ))));
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (1 / 1.3),
                    crossAxisCount: 3,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0));
        });
  }
}
