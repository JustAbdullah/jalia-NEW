import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/views/BusinessScreen/BusinessWidgets/detals_business.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_container.dart';
import 'package:shimmer/shimmer.dart';

import '../../../customWidgets/custom_text.dart';

class ListOfBusinessFluter extends StatelessWidget {
  const ListOfBusinessFluter({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getAllDataCompSearching(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return homeController.noDataComp.value == true
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(ImagesPath.noDataIcon, width: 200.w),
                        SizedBox(
                          height: 55.h,
                        ),
                        TextCustom(
                            theText: "لايوجد هنالك بيانات من عملية الفلترة",
                            fontSizeWidth: 15,
                            fontFamily: AppTextStyles.Almarai,
                            fontWeight: FontWeight.bold,
                            fontColor: AppColors.theAppColorBlue),
                      ],
                    ),
                  )
                : ContainerCustom(
                    heigthContainer: MediaQuery.sizeOf(context).height,
                    widthContainer: MediaQuery.sizeOf(context).width,
                    colorContainer: AppColors.whiteColorTypeTwo,
                    child: GridView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, i) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              child: InkWell(
                                  onTap: () async {
                                    homeController
                                            .business.business_directory_id =
                                        snapshot.data['data'][i]
                                                ['business_directory_id']
                                            .toString();
                                    homeController
                                            .business.business_directory_name =
                                        snapshot.data['data'][i]
                                                ['business_directory_name']
                                            .toString();
                                    homeController.business
                                            .business_directory_description =
                                        snapshot.data['data'][i][
                                                'business_directory_description']
                                            .toString();
                                    homeController
                                            .business.business_directory_image =
                                        snapshot.data['data'][i]
                                                ['business_directory_image']
                                            .toString();
                                    homeController
                                            .business.business_directory_type =
                                        snapshot.data['data'][i]
                                                ['business_directory_type']
                                            .toString();
                                    homeController
                                            .business.business_directory_place =
                                        snapshot.data['data'][i]
                                                ['business_directory_place']
                                            .toString();
                                    homeController
                                            .business.business_directory_date =
                                        snapshot.data['data'][i]
                                                ['business_directory_date']
                                            .toString();
                                    homeController.business
                                            .business_directory_number_phone =
                                        snapshot.data['data'][i][
                                                'business_directory_number_phone']
                                            .toString();
                                    homeController.business
                                            .business_directory_add_by =
                                        snapshot.data['data'][i]
                                                ['business_directory_add_by']
                                            .toString();
                                    homeController.business.id_type_business =
                                        snapshot.data['data'][i]
                                                ['id_type_business']
                                            .toString();
                                    homeController.business
                                            .name_type_id_type_business =
                                        snapshot.data['data'][i]
                                                ['name_type_id_type_business']
                                            .toString();
                                    homeController.business.id_palce = snapshot
                                        .data['data'][i]['id_palce']
                                        .toString();
                                    homeController.business.name_id_place =
                                        snapshot.data['data'][i]
                                                ['name_id_place']
                                            .toString();

                                    Get.to(DetalaBuainess());
                                  },
                                  child: Container(
                                    height: 130.h,
                                    color: AppColors.whiteColor,
                                    child: Column(children: [
                                      CustomCachedNetworkImage(
                                          urlTheImage: snapshot.data['data'][i]
                                              ['business_directory_image'],
                                          width: 70.w,
                                          height: 100.h,
                                          boxFit: BoxFit.cover),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: 15.h,
                                          child: Text(
                                            snapshot.data['data'][i]
                                                ['business_directory_name'],
                                            style: TextStyle(
                                                height: 1.h,
                                                fontSize: 15,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors
                                                    .balckColorTypeThree),
                                            textAlign: TextAlign.center,
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
