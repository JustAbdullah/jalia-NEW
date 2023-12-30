import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';
import '../cv_screen.dart';

class DetalasCv extends StatelessWidget {
  const DetalasCv({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: GetX<HomeController>(
              builder: (controller) => controller.noDataAboutUserCv.value ==
                          false &&
                      controller.isCanSeeCvUser.value == "1"
                  ? SingleChildScrollView(
                      child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.w),
                      child: PaddingCustom(
                        theTop: 20,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextCustom(
                                  theText: "السيرة الذاتية لهذا العضو",
                                  fontSizeWidth: 23,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontColor: AppColors.blackColor),
                              SizedBox(
                                height: 12.h,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "معلومات حول السيرة الذاتية",
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
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
                                    Text(
                                      "الاسم:",
                                      style: TextStyle(
                                        height: 1.5.h,
                                        fontSize: 20.sp,
                                        color: AppColors.balckColorTypeThree,
                                        fontFamily: AppTextStyles.Almarai,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Text(
                                        homeController.nameTheUserCv.toString(),
                                        style: TextStyle(
                                          height: 1.8.h,
                                          fontSize: 18.sp,
                                          color: AppColors.balckColorTypeThree,
                                          fontFamily: AppTextStyles.Almarai,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "تفاصيل السيرة:",
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
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  homeController.aboutTheUserCv.toString(),
                                  style: TextStyle(
                                    height: 1.8.h,
                                    fontSize: 15.sp,
                                    color: AppColors.balckColorTypeThree,
                                    fontFamily: AppTextStyles.Almarai,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "تفاصيل أخرى:",
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
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
                                    Text(
                                      "صورة:",
                                      style: TextStyle(
                                        height: 1.5.h,
                                        fontSize: 20.sp,
                                        color: AppColors.balckColorTypeThree,
                                        fontFamily: AppTextStyles.Almarai,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(
                                      width: 25.w,
                                    ),
                                    CustomCachedNetworkImage(
                                        urlTheImage: homeController
                                            .imageTheUSerCv
                                            .toString(),
                                        width: 100.w,
                                        height: 150.h,
                                        boxFit: BoxFit.cover),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
                                    Text(
                                      "رقم التواصل:",
                                      style: TextStyle(
                                        height: 1.5.h,
                                        fontSize: 20.sp,
                                        color: AppColors.balckColorTypeThree,
                                        fontFamily: AppTextStyles.Almarai,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      homeController.numberTheUserCv.toString(),
                                      style: TextStyle(
                                        height: 1.5.h,
                                        fontSize: 20.sp,
                                        color: AppColors.yellowColor,
                                        fontFamily: AppTextStyles.Almarai,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ))
                  : Align(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "هذا المستخدم قد يكون لم يضف اي سيرة او أن السيرة غير قابلة للرؤية ",
                              style: TextStyle(
                                height: 1.8.h,
                                fontSize: 15.sp,
                                color: AppColors.balckColorTypeThree,
                                fontFamily: AppTextStyles.Almarai,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 80.h,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(CvScreen());
                              },
                              child: ContainerCustom(
                                colorContainer: AppColors.yellowColor,
                                widthContainer: 200,
                                heigthContainer: 40,
                                child: TextCustom(
                                    Theheight: 3.h,
                                    theText: "العودة",
                                    fontSizeWidth: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.whiteColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
        ));
  }
}
