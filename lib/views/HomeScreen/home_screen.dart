import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/controllers/home_controller.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/core/constant/images_path.dart';
import 'package:jalia/customWidgets/custom_container.dart';
import 'package:jalia/customWidgets/custom_padding.dart';
import 'package:jalia/customWidgets/custom_text.dart';
import 'package:jalia/views/CvScreen/cv_screen.dart';
import 'package:jalia/views/QuestionsScreen/questions_screen.dart';
import 'package:jalia/views/auth/sign_up_screen.dart';

import '../../core/constant/appcolors.dart';
import '../ActivitiesScreen/activities_screen.dart';
import '../BusinessScreen/business_screen.dart';
import '../CommuncationScreen/communication_screen.dart';
import '../NotificationsScreen/notification_screen.dart';
import '../WorksScreen/works_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeOne,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(children: [
              PaddingCustom(
                  child: ContainerCustom(
                      heigthContainer: 70,
                      widthContainer: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: InkWell(
                          onTap: () {
                            homeController.isHaveAccountTheUser();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PaddingCustom(
                                  theTop: 20.h,
                                  child: GetX<HomeController>(
                                    builder: (controller) => Row(
                                      children: [
                                        Image.asset(
                                          controller.displayUserEligibilityAdd
                                                      .value ==
                                                  "2"
                                              ? ImagesPath.crown
                                              : ImagesPath.account,
                                          width: 40.w,
                                        ),
                                        PaddingCustom(
                                          theTop: 10.h,
                                          child: TextCustom(
                                            theText: controller
                                                .displayUserName.value,
                                            fontSizeWidth: 20,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontColor: controller
                                                        .displayUserEligibilityAdd
                                                        .value ==
                                                    "2"
                                                ? AppColors.yellowColor
                                                : AppColors.theAppColorBlue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Image.asset(ImagesPath.logo,
                                  width: 100.w,
                                  height: 70.h,
                                  fit: BoxFit.cover),
                            ],
                          ),
                        ),
                      ))),
              PaddingCustom(
                  theTop: 20.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(const BusinessScreen());
                          },
                          child: ContainerCustom(
                              heigthContainer: 150,
                              widthContainer: 100,
                              theBorderRadius: 10,
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImagesPath.iconWorksJalia,
                                    width: 60.w,
                                    height: 100.h,
                                  ),
                                  SizedBox(
                                    height: 00.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "دليل أعمال الجالية",
                                        style: TextStyle(
                                          height: 1.3.h,
                                          color: AppColors.blackColorTypeTeo,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 15.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const WorksScreen());
                          },
                          child: ContainerCustom(
                              heigthContainer: 150,
                              widthContainer: 100,
                              theBorderRadius: 10,
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImagesPath.iconAdsWorks,
                                    width: 60.w,
                                    height: 100.h,
                                  ),
                                  SizedBox(
                                    height: 0.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "الاعلانات وفرص العمل",
                                        style: TextStyle(
                                          height: 1.3.h,
                                          color: AppColors.blackColorTypeTeo,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 15.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                            onTap: () {
                              Get.to(const CvScreen());
                            },
                            child: ContainerCustom(
                                heigthContainer: 150,
                                widthContainer: 100,
                                theBorderRadius: 10,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      ImagesPath.iconInfoJalia,
                                      width: 60.w,
                                      height: 100.h,
                                    ),
                                    SizedBox(
                                      height: 0.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          "السير الذاتية للجالية",
                                          style: TextStyle(
                                            color: AppColors.blackColorTypeTeo,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontSize: 15.sp,
                                            height: 1.3.h,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                )))
                      ],
                    ),
                  )),
              PaddingCustom(
                  theTop: 20.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(QuestionsScreen());
                          },
                          child: ContainerCustom(
                              heigthContainer: 150,
                              widthContainer: 100,
                              theBorderRadius: 10,
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImagesPath.iconAskJalia,
                                    width: 60.w,
                                    height: 100.h,
                                  ),
                                  SizedBox(
                                    height: 00.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "أسال الجالية",
                                        style: TextStyle(
                                          height: 1.3.h,
                                          color: AppColors.blackColorTypeTeo,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 15.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const NotificationsScreen());
                          },
                          child: ContainerCustom(
                              heigthContainer: 150,
                              widthContainer: 100,
                              theBorderRadius: 10,
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImagesPath.iconNoJalia,
                                    width: 60.w,
                                    height: 100.h,
                                  ),
                                  SizedBox(
                                    height: 0.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "أشعارات الجالية",
                                        style: TextStyle(
                                          color: AppColors.blackColorTypeTeo,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 15.sp,
                                          height: 1.3.h,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(CommunicationScreen());
                          },
                          child: ContainerCustom(
                              heigthContainer: 150,
                              widthContainer: 100,
                              theBorderRadius: 10,
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImagesPath.iconCommunicationJalia,
                                    width: 60.w,
                                    height: 100.h,
                                  ),
                                  SizedBox(
                                    height: 0.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "منصات الجالية",
                                        style: TextStyle(
                                          color: AppColors.blackColorTypeTeo,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 15.sp,
                                          height: 1.3.h,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  )),
              PaddingCustom(
                  theTop: 20.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(ActivitiesScreen());
                          },
                          child: ContainerCustom(
                              heigthContainer: 150,
                              widthContainer: 100,
                              theBorderRadius: 10,
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImagesPath.iconNews,
                                    width: 60.w,
                                    height: 100.h,
                                  ),
                                  SizedBox(
                                    height: 00.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "نشاطات الجالية",
                                        style: TextStyle(
                                          height: 1.3.h,
                                          color: AppColors.blackColorTypeTeo,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 15.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        ContainerCustom(
                            heigthContainer: 150,
                            widthContainer: 100,
                            theBorderRadius: 10,
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    homeController.whereGoToAddBuss();
                                  },
                                  child: Column(children: [
                                    Image.asset(
                                      ImagesPath.plus,
                                      width: 60.w,
                                      height: 100.h,
                                    ),
                                    SizedBox(
                                      height: 0.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          "إضافة دليل عمل جديد",
                                          style: TextStyle(
                                            color: AppColors.blackColorTypeTeo,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontSize: 15.sp,
                                            height: 1.3.h,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                                GetX<HomeController>(
                                    builder: (controller) => Visibility(
                                        visible: controller
                                                .displayIsHavaAccount.value ==
                                            0,
                                        child: Container(
                                          width: 100.w,
                                          height: 150.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black45),
                                        ))),
                                GetX<HomeController>(
                                    builder: (controller) => Visibility(
                                        visible: controller
                                                .displayIsHavaAccount.value ==
                                            0,
                                        child: Container(
                                          width: 100.w,
                                          height: 150.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black45),
                                        ))),
                                GetX<HomeController>(
                                    builder: (controller) => Visibility(
                                        visible: controller
                                                .displayIsHavaAccount.value ==
                                            0,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 80.h),
                                                child: Text(
                                                  "قم بإنشاء حساب اولاً",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      fontSize: 15.sp,
                                                      height: 1.5.h,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        )))
                              ],
                            )),
                        SizedBox(
                          width: 15.w,
                        ),
                        ContainerCustom(
                            heigthContainer: 150,
                            widthContainer: 100,
                            theBorderRadius: 10,
                            child: Stack(
                              children: [
                                InkWell(
                                    onTap: () {
                                      homeController.whereGoToAddWork();
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          ImagesPath.plus,
                                          width: 60.w,
                                          height: 100.h,
                                        ),
                                        SizedBox(
                                          height: 0.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "إضافة فرصة عمل جديدة",
                                              style: TextStyle(
                                                color:
                                                    AppColors.blackColorTypeTeo,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontSize: 15.sp,
                                                height: 1.3.h,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                GetX<HomeController>(
                                    builder: (controller) => Visibility(
                                        visible: controller
                                                .displayIsHavaAccount.value ==
                                            0,
                                        child: Container(
                                          width: 100.w,
                                          height: 150.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black45),
                                        ))),
                                GetX<HomeController>(
                                    builder: (controller) => Visibility(
                                        visible: controller
                                                .displayIsHavaAccount.value ==
                                            0,
                                        child: Container(
                                          width: 100.w,
                                          height: 150.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black45),
                                        ))),
                                GetX<HomeController>(
                                    builder: (controller) => Visibility(
                                        visible: controller
                                                .displayIsHavaAccount.value ==
                                            0,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(top: 80.h),
                                              child: Text(
                                                "قم بإنشاء حساب اولاً",
                                                style: TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    fontSize: 15.sp,
                                                    height: 1.5.h,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        )))
                              ],
                            ))
                      ],
                    ),
                  )),
              PaddingCustom(
                  theTop: 20.h,
                  theBottom: 10.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        ContainerCustom(
                            heigthContainer: 150,
                            widthContainer: 100,
                            theBorderRadius: 10,
                            child: Stack(
                              children: [
                                InkWell(
                                    onTap: () {
                                      homeController.whereGoToAddCv();
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          ImagesPath.plus,
                                          width: 60.w,
                                          height: 100.h,
                                        ),
                                        SizedBox(
                                          height: 0.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "إضافة سيرة ذاتية",
                                              style: TextStyle(
                                                color:
                                                    AppColors.blackColorTypeTeo,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontSize: 15.sp,
                                                height: 1.3.h,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                GetX<HomeController>(
                                    builder: (controller) => Visibility(
                                        visible: controller
                                                .displayIsHavaAccount.value ==
                                            0,
                                        child: Container(
                                          width: 100.w,
                                          height: 150.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black45),
                                        ))),
                                GetX<HomeController>(
                                    builder: (controller) => Visibility(
                                        visible: controller
                                                .displayIsHavaAccount.value ==
                                            0,
                                        child: Container(
                                          width: 100.w,
                                          height: 150.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black45),
                                        ))),
                                GetX<HomeController>(
                                    builder: (controller) => Visibility(
                                        visible: controller
                                                .displayIsHavaAccount.value ==
                                            0,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(top: 80.h),
                                              child: Text(
                                                "قم بإنشاء حساب اولاً",
                                                style: TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    fontSize: 15.sp,
                                                    height: 1.5.h,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        )))
                              ],
                            ))
                      ],
                    ),
                  )),
            ]),
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
                      heigthContainer: 190,
                      theBorderRadius: 10,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 20.h),
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
                              fontSizeWidth: 17,
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
                                  controller.isUserNotHaveAccount.value = false;
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
                                  controller.isUserNotHaveAccount.value = false;
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
                  )))
        ]),
      ),
    );
  }
}
