import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class ListOfActivities extends StatelessWidget {
  const ListOfActivities({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getDataActivitiesFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.sizeOf(context).width,
              color: AppColors.whiteColorTypeTwo,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return PaddingCustom(
                      theBottom: 10,
                      child: InkWell(
                        onTap: () async {
                          homeController.activities.activities_id = snapshot
                              .data['data'][i]['activities_id']
                              .toString();

                          homeController.activities.activities_name = snapshot
                              .data['data'][i]['activities_name']
                              .toString();

                          homeController.activities.activities_description =
                              snapshot.data['data'][i]['activities_description']
                                  .toString();
                          homeController.activities.activities_link = snapshot
                              .data['data'][i]['activities_link']
                              .toString();

                          homeController.activities.add_by =
                              snapshot.data['data'][i]['add_by'].toString();

                          homeController.activities.activities_date = snapshot
                              .data['data'][i]['activities_date']
                              .toString();
                          Uri mail = Uri.parse(snapshot.data['data'][i]
                                  ['activities_link']
                              .toString());
                          await launchUrl(mail);
                        },
                        child: ContainerCustom(
                          theBorderRadius: 10,
                          colorContainer: AppColors.whiteColor,
                          heigthContainer: 160,
                          widthContainer: MediaQuery.sizeOf(context).width,
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
                                          child: Image.asset(
                                            ImagesPath.logo,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
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
                                          child: SizedBox(
                                            width: 180.w,
                                            child: Text(
                                              snapshot.data['data'][i]
                                                  ['activities_name'],
                                              style: TextStyle(
                                                height: 1.5.h,
                                                color: AppColors.blackColor,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 190.w,
                                        child: SingleChildScrollView(
                                          child: PaddingCustom(
                                            theTop: 10,
                                            child: Text(
                                              "${snapshot.data['data'][i]['activities_description']}",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  height: 1.5.h,
                                                  color: AppColors
                                                      .balckColorTypeThree,
                                                  fontFamily:
                                                      AppTextStyles.Almarai),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              Uri mail = Uri.parse(snapshot
                                                  .data['data'][i]
                                                      ['activities_link']
                                                  .toString());
                                              await launchUrl(mail);
                                            },
                                            child: ContainerCustomApi(
                                              colorContainer:
                                                  AppColors.theAppColorBlue,
                                              theBorderRadius: 15,
                                              heigthContainer: 20.h,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30.h),
                                                child: Text(
                                                  "الإطلاع الان",
                                                  style: TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
