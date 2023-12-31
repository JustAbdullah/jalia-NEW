import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/controllers/home_controller.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/customWidgets/custom_container.dart';
import 'package:jalia/customWidgets/custom_text.dart';
import 'package:jalia/views/auth/sign_up_screen.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custome_textfiled.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeOne,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: homeController.formLogin,
              child: Column(children: [
                SizedBox(
                  height: 80.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: TextCustom(
                      theText: "تسجيل الدخول",
                      fontSizeWidth: 23,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.blackColorsTypeOne),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Text(
                      "لطفًا  قم بإدخال البيانات التالية لتسجيل دخولك",
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 15.5.sp,
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.balckColorTypeThree),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: TextFormFiledCustom(
                    labelData: "الاسم",
                    hintData: "قم لطفًا بإدخال الاسم ",
                    iconData: Icons.person,
                    controllerData: homeController.nameControllerLogin,
                    value: (value) {
                      homeController.nameLogin = value.toString();
                      return value;
                    },
                    fillColor: AppColors.whiteColor,
                    hintColor: AppColors.theAppColorBlue,
                    iconColor: AppColors.theAppColorBlue,
                    borderSideColor: AppColors.whiteColor,
                    fontColor: AppColors.balckColorTypeThree,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    autofillHints: [AutofillHints.name],
                    onChanged: (value) {
                      homeController.nameLogin = value.toString();
                      return value;
                    },
                    validator: (value) {},
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: TextFormFiledCustom(
                    labelData: "كلمة المرور",
                    hintData: "قم لطفًا بإدخال كلمة المرور",
                    iconData: Icons.password,
                    controllerData: homeController.passwordControllerLogin,
                    value: (value) {
                      homeController.passwordLogin = value.toString();
                      return value;
                    },
                    fillColor: AppColors.whiteColor,
                    hintColor: AppColors.theAppColorBlue,
                    iconColor: AppColors.theAppColorBlue,
                    borderSideColor: AppColors.whiteColor,
                    fontColor: AppColors.balckColorTypeThree,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    autofillHints: [AutofillHints.name],
                    onChanged: (value) {
                      homeController.passwordLogin = value.toString();
                      return value;
                    },
                    validator: (value) {},
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "ليس لديك حساب ؟",
                          style: TextStyle(
                              height: 1.5.h,
                              fontSize: 13.5.sp,
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.balckColorTypeThree),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(SignUp());
                          },
                          child: Text(
                            "قم بإنشاء حساب الان",
                            style: TextStyle(
                                height: 1.5.h,
                                fontSize: 13.5.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.yellowColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0.3.h,
                    color: AppColors.blackColorTypeTeo,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                InkWell(
                  onTap: () {
                    homeController.loginAccounts(
                        homeController.nameLogin.toString(),
                        homeController.passwordLogin.toString());
                  },
                  child: ContainerCustom(
                    colorContainer: AppColors.theAppColorBlue,
                    widthContainer: 200,
                    heigthContainer: 40,
                    child: Center(
                      child: Text(
                        "تسجيل الدخول الان",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTextStyles.Almarai,
                            color: AppColors.whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingTheScreenLogin.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingTheScreenLogin.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingTheScreenLogin.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(ImagesPath.loading, width: 140.w),
                        Text(
                          "انتظر قليلاً يتم تسجيل الدخول  والتاكد من البيانات ",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontFamily: AppTextStyles.Almarai,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isTheUserEnterTheRealyDataLogin.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isTheUserEnterTheRealyDataLogin.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isTheUserEnterTheRealyDataLogin.value,
                  child: PaddingCustom(
                    theTop: 190.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(ImagesPath.success, width: 140.w),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "عزيزي المستخدم تم تسجيل الدخول بنجاح,,قم بالضغط على الزر للتوجة للرئيسية",
                              style: TextStyle(
                                height: 1.7.h,
                                color: AppColors.whiteColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                            onTap: () {
                              homeController.cleanTheLogin();
                              homeController.goToHomeLoginSignUp();
                            },
                            child: ContainerCustom(
                              widthContainer: 200.w,
                              heigthContainer: 30,
                              colorContainer: AppColors.yellowColor,
                              child: Center(
                                child: TextCustom(
                                    theText: "التوجة الان",
                                    fontSizeWidth: 20,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeThree),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isErrorAboutLoginTheUser.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isErrorAboutLoginTheUser.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isErrorAboutLoginTheUser.value,
                  child: PaddingCustom(
                    theTop: 190.h,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(ImagesPath.error, width: 140.w),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              "عزيزي المستخدم اسم المستخدم او كلمة المرور خاطئة,,الرجاء التاكد من صحتهم",
                              style: TextStyle(
                                height: 1.7.h,
                                color: AppColors.whiteColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                              onTap: () {
                                homeController.cleanTheLogin();
                              },
                              child: ContainerCustom(
                                widthContainer: 200.w,
                                heigthContainer: 30,
                                colorContainer: AppColors.yellowColor,
                                child: Center(
                                  child: TextCustom(
                                      theText: "الاخفاء",
                                      fontSizeWidth: 20,
                                      fontFamily: AppTextStyles.Almarai,
                                      fontColor: AppColors.balckColorTypeThree),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ))),
        ],
      )),
    );
  }
}
