import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/views/WorksScreen/WorksWidgets/detals_works.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class ListOfWorksFluter extends StatelessWidget {
  const ListOfWorksFluter({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getAllDataWorkSearching(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return PaddingCustom(
              theTop: 00,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 200.h,
                color: AppColors.whiteColorTypeTwo,
                child: homeController.noData.value == true
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(ImagesPath.noDataIcon, width: 200.w),
                            SizedBox(
                              height: 55.h,
                            ),
                            TextCustom(
                                theText: "لايوجد بيانات لعملية الفلترة",
                                fontSizeWidth: 15,
                                fontFamily: AppTextStyles.Almarai,
                                fontWeight: FontWeight.bold,
                                fontColor: AppColors.theAppColorBlue),
                          ],
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data['data'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          // ignore: curly_braces_in_flow_control_structures
                          return PaddingCustom(
                            theBottom: 10,
                            child: InkWell(
                              onTap: () {
                                homeController.works.work_id = snapshot
                                    .data['data'][i]['work_id']
                                    .toString();

                                homeController.works.work_name = snapshot
                                    .data['data'][i]['work_name']
                                    .toString();

                                homeController.works.work_description = snapshot
                                    .data['data'][i]['work_description']
                                    .toString();

                                homeController.works.work_image = snapshot
                                    .data['data'][i]['work_image']
                                    .toString();

                                homeController.works.work_copmany = snapshot
                                    .data['data'][i]['work_company']
                                    .toString();

                                homeController.works.work_number_phone =
                                    snapshot.data['data'][i]
                                            ['work_number_phone']
                                        .toString();

                                homeController.works.work_type = snapshot
                                    .data['data'][i]['work_type']
                                    .toString();

                                homeController.works.work_place = snapshot
                                    .data['data'][i]['work_place']
                                    .toString();

                                homeController.works.work_date = snapshot
                                    .data['data'][i]['work_date']
                                    .toString();

                                homeController.works.work_add_by = snapshot
                                    .data['data'][i]['work_add_by']
                                    .toString();

                                homeController.works.id_type_work = snapshot
                                    .data['data'][i]['id_type_work']
                                    .toString();

                                homeController.works.name_type_work = snapshot
                                    .data['data'][i]['name_type_work']
                                    .toString();

                                homeController.works.name_id_place = snapshot
                                    .data['data'][i]['name_id_place']
                                    .toString();

                                Get.to(DetalesWorks());
                              },
                              child: ContainerCustom(
                                theBorderRadius: 10,
                                colorContainer: AppColors.whiteColor,
                                heigthContainer: 120,
                                widthContainer:
                                    MediaQuery.sizeOf(context).width,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: CustomCachedNetworkImage(
                                                  urlTheImage: snapshot
                                                      .data['data'][i]
                                                          ['work_image']
                                                      .toString(),
                                                  width: 100,
                                                  height: 100,
                                                  boxFit: BoxFit.contain,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: PaddingCustom(
                                                theTop: 5,
                                                child: Container(
                                                  width: 120.w,
                                                  height: 20.h,
                                                  child: Text(
                                                    snapshot.data['data'][i]
                                                        ['work_name'],
                                                    style: TextStyle(
                                                      height: 1,
                                                      color:
                                                          AppColors.blackColor,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 170.w,
                                              height: 70.h,
                                              child: SingleChildScrollView(
                                                child: PaddingCustom(
                                                  theTop: 2,
                                                  child: Text(
                                                    "${snapshot.data['data'][i]['work_description']}",
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        height: 1.4.h,
                                                        color: AppColors
                                                            .balckColorTypeThree,
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 180.w,
                                              child: SingleChildScrollView(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ContainerCustomApi(
                                                      colorContainer: AppColors
                                                          .theAppColorBlue,
                                                      theBorderRadius: 15,
                                                      heigthContainer: 15.h,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    8.h),
                                                        child: Text(
                                                          "${snapshot.data['data'][i]['name_id_place']}",
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .whiteColor,
                                                            fontFamily:
                                                                AppTextStyles
                                                                    .Almarai,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    ContainerCustomApi(
                                                      colorContainer: AppColors
                                                          .theAppColorBlue,
                                                      theBorderRadius: 15,
                                                      heigthContainer: 15.h,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    8.h),
                                                        child: Text(
                                                          "Istanbul",
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .whiteColor,
                                                            fontFamily:
                                                                AppTextStyles
                                                                    .Almarai,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: PaddingCustom(
                                                theTop: 5,
                                                child: ContainerCustomApi(
                                                  colorContainer:
                                                      AppColors.yellowColor,
                                                  theBorderRadius: 15,
                                                  heigthContainer: 15.h,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.h),
                                                    child: Text(
                                                      "إعلان",
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .blackColor,
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
              ),
            );
          } else {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Shimmer.fromColors(
                      baseColor: Color.fromARGB(31, 169, 167, 167),
                      highlightColor: AppColors.whiteColor,
                      enabled: true,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: PaddingCustom(
                          theBottom: 10,
                          child: ContainerCustom(
                            theBorderRadius: 10,
                            colorContainer: AppColors.whiteColor,
                            heigthContainer: 130,
                            widthContainer: MediaQuery.sizeOf(context).width,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                              "${ImagesPath.logo}",
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: PaddingCustom(
                                          theTop: 30,
                                          child: TextCustom(
                                            theText: "يتم التحميل",
                                            fontColor: AppColors.blackColor,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontSizeWidth: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 150.w,
                                        height: 100.h,
                                        child: PaddingCustom(
                                          theTop: 15,
                                          child: Text(
                                            "يتم التحميل",
                                            maxLines: 4,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                height: 1.7.h,
                                                color: AppColors
                                                    .balckColorTypeThree,
                                                fontFamily:
                                                    AppTextStyles.Almarai),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: PaddingCustom(
                                            theTop: 5,
                                            child: ContainerCustomApi(
                                              colorContainer:
                                                  AppColors.theAppColorBlue,
                                              theBorderRadius: 15,
                                              heigthContainer: 15.h,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.h),
                                                child: Text(
                                                  "يتم التحميل",
                                                  style: TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
                });
          }
        });
  }
}
