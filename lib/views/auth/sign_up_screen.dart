import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/controllers/home_controller.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/customWidgets/custom_container.dart';
import 'package:jalia/customWidgets/custom_text.dart';
import 'package:jalia/views/auth/login_screen.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custome_textfiled.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              key: homeController.formSign,
              child: Column(children: [
                SizedBox(
                  height: 80.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: TextCustom(
                      theText: "إنشاء حساب جديد",
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
                      "قم بإدخال المعلومات التالية لإكمال عملية إنشاء الحساب",
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
                    controllerData: homeController.nameController,
                    value: (value) {
                      homeController.nameSignUp = value.toString();
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
                      homeController.nameSignUp = value.toString();
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
                    controllerData: homeController.passwordController,
                    value: (value) {
                      homeController.passwordSignUp = value.toString();
                      return value;
                    },
                    fillColor: AppColors.whiteColor,
                    hintColor: AppColors.theAppColorBlue,
                    iconColor: AppColors.theAppColorBlue,
                    borderSideColor: AppColors.whiteColor,
                    fontColor: AppColors.balckColorTypeThree,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    autofillHints: [AutofillHints.password],
                    onChanged: (value) {
                      homeController.passwordSignUp = value.toString();
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
                    labelData: "رقم الهاتف",
                    hintData: "قم لطفًا بإدخال رقم الهاتف",
                    iconData: Icons.phone_android,
                    controllerData: homeController.phoneController,
                    value: (value) {
                      homeController.phoneSignUp = value.toString();
                      return value;
                    },
                    fillColor: AppColors.whiteColor,
                    hintColor: AppColors.theAppColorBlue,
                    iconColor: AppColors.theAppColorBlue,
                    borderSideColor: AppColors.whiteColor,
                    fontColor: AppColors.balckColorTypeThree,
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    autofillHints: [AutofillHints.name],
                    onChanged: (value) {
                      homeController.phoneSignUp = value.toString();
                      return value;
                    },
                    validator: (value) {},
                  ),
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
                          "لديك حساب بالفعل؟",
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
                            Get.offAll(const Login());
                          },
                          child: Text(
                            "قم بتسجيل الدخول الان",
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
                    homeController.signUpAccounts(
                      homeController.nameSignUp.toString(),
                      homeController.passwordSignUp.toString(),
                      homeController.phoneSignUp.toString(),
                    );
                  },
                  child: ContainerCustom(
                    colorContainer: AppColors.theAppColorBlue,
                    widthContainer: 200,
                    heigthContainer: 40,
                    child: TextCustom(
                        Theheight: 2.h,
                        theText: "إنشاء الحساب الان",
                        fontSizeWidth: 16,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.whiteColor),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.w),
                    child: Text(
                      "في حال إنشاءك الحساب فإنك توافق على شروط واحكام منصة تطبيق الجالية الأسطنبولية",
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 14.5.sp,
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.redColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.w),
                    child: Text(
                      "قراءة الاحكام والشروط",
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 14.5.sp,
                          fontFamily: AppTextStyles.Almarai,
                          fontWeight: FontWeight.bold,
                          color: AppColors.yellowColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingTheScreenSignUp.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingTheScreenSignUp.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingTheScreenSignUp.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(ImagesPath.loading, width: 140.w),
                        Text(
                          "انتظر قليلاً يتم إنشاء الحساب والتاكد من البيانات ",
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
                  visible: controller.isAddTheUser.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddTheUser.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddTheUser.value,
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
                              "عزيزي المستخدم تم إنشاء الحساب بنجاح,,قم بالضغط على الزر للتوجة للرئيسية",
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
                              homeController.cleanTheSignUp();
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
                  visible: controller.isErrorAboutAddTheUser.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isErrorAboutAddTheUser.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isErrorAboutAddTheUser.value,
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
                              "عزيزي المستخدم هناك إشكالية,,الرجاء تغيير اسم المستخدم والمحاولة مجددًا",
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
                                homeController.cleanTheSignUp();
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
