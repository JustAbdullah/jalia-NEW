import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/customWidgets/custom_container.dart';
import 'package:jalia/customWidgets/custom_padding.dart';
import 'package:jalia/customWidgets/custom_text.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import '../AddQues/add_ques.dart';
import '../auth/sign_up_screen.dart';
import 'QuestionsWidgets/list_of_qoestions.dart';
import 'QuestionsWidgets/top_header_qoestions_screen.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeTwo,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: PaddingCustom(
              theTop: 30,
              child: Column(children: [
                TopHeaderQoestionsScreen(),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(height: 450.h, child: ListOfQoestions()),
                SizedBox(
                  height: 15.h,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      if (homeController.displayIsHavaAccount.value == 0) {
                        homeController.isUserNotHaveAccount.value = true;
                      } else {
                        Get.to(AddQues());
                      }
                    },
                    child: ContainerCustom(
                        colorContainer: AppColors.yellowColor,
                        heigthContainer: 40.h,
                        widthContainer: 200.w,
                        child: TextCustom(
                          Theheight: 2.2,
                          theText: "إضافة موضوع جديد",
                          fontSizeWidth: 20,
                          fontFamily: AppTextStyles.Almarai,
                          fontColor: AppColors.balckColorTypeThree,
                        )),
                  ),
                )
              ]),
            ),
          ),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isUserNotHaveAccount.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isUserNotHaveAccount.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isUserNotHaveAccount.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: ContainerCustom(
                      widthContainer: 300,
                      heigthContainer: 195,
                      theBorderRadius: 10,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 20.h),
                        child: SingleChildScrollView(
                          child: Column(children: [
                            TextCustom(
                                theText: "تنبية",
                                fontSizeWidth: 20,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.redColor),
                            SizedBox(
                              height: 4.h,
                            ),
                            TextCustom(
                                Theheight: 1.5,
                                theText:
                                    "عزيزي المستخدم لم تقم بستجيل دخولك,,قم بتسجيل دخولك اولاً وفي حال لم تمتلك حساب قم بإنشاء حساب جديد الان",
                                fontSizeWidth: 15,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.balckColorTypeThree),
                            SizedBox(
                              height: 25.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(SignUp());
                                    controller.isUserNotHaveAccount.value =
                                        false;
                                  },
                                  child: ContainerCustom(
                                    widthContainer: 120.w,
                                    heigthContainer: 30,
                                    colorContainer: AppColors.yellowColor,
                                    child: Center(
                                      child: TextCustom(
                                          theText: "صفحة التسجيل",
                                          fontSizeWidth: 17,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontColor:
                                              AppColors.balckColorTypeThree),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.isUserNotHaveAccount.value =
                                        false;
                                  },
                                  child: ContainerCustom(
                                    widthContainer: 100.w,
                                    heigthContainer: 30,
                                    colorContainer: AppColors.redColor,
                                    child: Center(
                                      child: TextCustom(
                                          theText: "الإخفاء الان",
                                          fontSizeWidth: 17,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontColor: AppColors.whiteColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ),
                  )))
        ],
      )),
    );
  }
}
