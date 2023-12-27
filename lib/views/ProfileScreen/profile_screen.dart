import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/controllers/home_controller.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/customWidgets/custom_text.dart';

import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeOne,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 50.h,
                color: AppColors.whiteColor,
                child: TextCustom(
                    theText: "الملف الشخصي",
                    fontSizeWidth: 22,
                    fontFamily: AppTextStyles.Almarai,
                    fontColor: AppColors.theAppColorBlue),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ContainerCustom(
                        widthContainer: 150,
                        heigthContainer: 40,
                        theBorderRadius: 10,
                        colorContainer: AppColors.theAppColorBlue,
                        child: Center(
                          child: TextCustom(
                              theText: "اسم المستخدم:",
                              fontSizeWidth: 17,
                              fontFamily: AppTextStyles.Almarai,
                              fontColor: AppColors.whiteColor),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextCustom(
                          theText: homeController.displayUserName.value,
                          fontSizeWidth: 20,
                          fontFamily: AppTextStyles.Almarai,
                          fontColor: AppColors.blackColorTypeTeo),
                    ],
                  )),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ContainerCustom(
                          widthContainer: 150,
                          heigthContainer: 40,
                          theBorderRadius: 10,
                          colorContainer: AppColors.theAppColorBlue,
                          child: Center(
                            child: TextCustom(
                                theText: "رقم الهاتف:",
                                fontSizeWidth: 17,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.whiteColor),
                          ))
                    ],
                  )),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextCustom(
                          theText: homeController.displayUserPhone.value,
                          fontSizeWidth: 20,
                          fontFamily: AppTextStyles.Almarai,
                          fontColor: AppColors.blackColorTypeTeo),
                    ],
                  )),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ContainerCustom(
                      widthContainer: 150,
                      heigthContainer: 40,
                      theBorderRadius: 10,
                      colorContainer: AppColors.theAppColorBlue,
                      child: Center(
                        child: TextCustom(
                            theText: "حالة العضوية:",
                            fontSizeWidth: 17,
                            fontFamily: AppTextStyles.Almarai,
                            fontColor: AppColors.whiteColor),
                      ))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextCustom(
                      theText: homeController.displayUserEligibilityAdd.value ==
                              "1"
                          ? "حساب عادي"
                          : homeController.displayUserEligibilityAdd.value ==
                                  "2"
                              ? "عضو مميز في الجالية"
                              : "حساب عادي",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor:
                          homeController.displayUserEligibilityAdd.value == "2"
                              ? AppColors.yellowColor
                              : AppColors.blackColorTypeTeo),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContainerCustom(
                        widthContainer: 150,
                        heigthContainer: 40,
                        theBorderRadius: 10,
                        colorContainer: AppColors.theAppColorBlue,
                        child: Center(
                          child: TextCustom(
                              theText: "صلاحيات الإضافة:",
                              fontSizeWidth: 17,
                              fontFamily: AppTextStyles.Almarai,
                              fontColor: AppColors.whiteColor),
                        ))
                  ]),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextCustom(
                      theText: homeController.displayUserEligibilityAdd.value ==
                              "1"
                          ? "لاتمتلك صلاحيات الإضافة"
                          : homeController.displayUserEligibilityAdd.value ==
                                  "2"
                              ? "لديك كافة صلاحيات الإضافة"
                              : "لاتمتلك صلاحيات الإضافة",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor:
                          homeController.displayUserEligibilityAdd.value == "2"
                              ? AppColors.yellowColor
                              : AppColors.blackColorTypeTeo),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContainerCustom(
                        widthContainer: 150,
                        heigthContainer: 40,
                        theBorderRadius: 10,
                        colorContainer: AppColors.theAppColorBlue,
                        child: Center(
                          child: TextCustom(
                              theText: "المزيد من الخيارات",
                              fontSizeWidth: 17,
                              fontFamily: AppTextStyles.Almarai,
                              fontColor: AppColors.whiteColor),
                        ))
                  ]),
              SizedBox(
                height: 20.h,
              ),
              TextCustom(
                  Theheight: 1.5.h,
                  theText: homeController.displayUserEligibilityAdd.value == "1"
                      ? "لاتمتلك  المزيد من الخيارات,,في حال أردت التمتع بكافة الصلاحية قم بالاشتراك بالعضوية الذهبية"
                      : homeController.displayUserEligibilityAdd.value == "2"
                          ? ""
                          : "لاتمتلك اي مزيد من الخيارات,,في حال أردت التمتع بكافة الصلاحية قم بالاشتراك بالعضوية الذهبية",
                  fontSizeWidth: 17,
                  fontFamily: AppTextStyles.Almarai,
                  fontColor: AppColors.blackColorTypeTeo),
              SizedBox(
                height: 20.h,
              ),
              Visibility(
                visible: homeController.displayUserEligibilityAdd.value == "1",
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: ContainerCustom(
                            widthContainer: 200,
                            heigthContainer: 40,
                            theBorderRadius: 10,
                            colorContainer: AppColors.yellowColor,
                            child: Center(
                              child: TextCustom(
                                  theText: "التحصل على العضوية",
                                  fontSizeWidth: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontColor: AppColors.blackColorTypeTeo),
                            )),
                      )
                    ]),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
