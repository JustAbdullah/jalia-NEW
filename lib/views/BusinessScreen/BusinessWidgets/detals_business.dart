import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';

class DetalaBuainess extends StatelessWidget {
  const DetalaBuainess({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.w),
        child: PaddingCustom(
          theTop: 20,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextCustom(
                theText: "تفاصيل  حول الشركة",
                fontSizeWidth: 23,
                fontFamily: AppTextStyles.Almarai,
                fontColor: AppColors.blackColor),
            SizedBox(
              height: 2.h,
            ),
            Container(
                alignment: Alignment.topRight,
                height: 100.h,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomCachedNetworkImage(
                          urlTheImage: homeController
                              .business.business_directory_image
                              .toString(),
                          width: 100,
                          height: 100,
                          boxFit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        PaddingCustom(
                            theTop: 40,
                            child: Container(
                              alignment: Alignment.topRight,
                              width: 190.w,
                              height: 50.h,
                              child: Text(
                                homeController.business.business_directory_name
                                    .toString(),
                                style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 19,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeThree,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ],
                    ))),
            SizedBox(
              height: 3.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "مكان تواجد الشركة",
                style: TextStyle(
                  height: 1.5.h,
                  fontSize: 20.sp,
                  color: AppColors.balckColorTypeThree,
                  fontFamily: AppTextStyles.Almarai,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                alignment: Alignment.center,
                height: 35.h,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 25.h,
                          color: AppColors.yellowColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Center(
                              child: Text(
                                homeController.business.name_id_place
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.whiteColor,
                                  fontFamily: AppTextStyles.Almarai,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 25.h,
                          color: AppColors.theAppColorBlue,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Center(
                              child: Text(
                                "Istanbul",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.whiteColor,
                                  fontFamily: AppTextStyles.Almarai,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "تصنيف الشركة",
                style: TextStyle(
                  height: 1.5.h,
                  fontSize: 20.sp,
                  color: AppColors.balckColorTypeThree,
                  fontFamily: AppTextStyles.Almarai,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                alignment: Alignment.center,
                height: 35.h,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 25.h,
                          color: AppColors.redColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.w),
                            child: Center(
                              child: Text(
                                homeController
                                    .business.name_type_id_type_business
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: AppColors.whiteColor,
                                  fontFamily: AppTextStyles.Almarai,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "رقم التواصل الرسمي مع الشركة",
                style: TextStyle(
                  height: 1.5.h,
                  fontSize: 20.sp,
                  color: AppColors.balckColorTypeThree,
                  fontFamily: AppTextStyles.Almarai,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                alignment: Alignment.center,
                height: 35.h,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 25.h,
                          color: AppColors.yellowColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.w),
                            child: Center(
                              child: Text(
                                homeController
                                    .business.business_directory_number_phone
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: AppColors.whiteColor,
                                  fontFamily: AppTextStyles.Almarai,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 0.6.h,
                color: AppColors.blackColorTypeTeo,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "معلومات حول الشركة",
                style: TextStyle(
                  height: 1.5.h,
                  fontSize: 20.sp,
                  color: AppColors.balckColorTypeThree,
                  fontFamily: AppTextStyles.Almarai,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                homeController.business.business_directory_description
                    .toString(),
                style: TextStyle(
                  height: 1.8.h,
                  fontSize: 15.sp,
                  color: AppColors.balckColorTypeThree,
                  fontFamily: AppTextStyles.Almarai,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ]),
        ),
      ))),
    );
  }
}
