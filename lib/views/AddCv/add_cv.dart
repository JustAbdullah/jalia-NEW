import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/controllers/home_controller.dart';
import 'package:jalia/core/constant/images_path.dart';
import 'package:jalia/customWidgets/custom_padding.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_container.dart';
import '../../customWidgets/custom_container_api.dart';
import '../../customWidgets/custom_text.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class AddCV extends StatefulWidget {
  const AddCV({super.key});

  @override
  State<AddCV> createState() => _AddCVState();
}

class _AddCVState extends State<AddCV> {
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
              key: homeController.formAddCv,
              child: PaddingCustom(
                theBottom: 20.h,
                child: Column(children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextCustom(
                        theText: "صفحة إضافة السير الذاتية",
                        fontSizeWidth: 23,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: AppColors.blackColorsTypeOne),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Text(
                        "لطفًا قم بإدخال البيانات لإضافة السيرة الذاتية في الجالية",
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
                    height: 17.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Material(
                        elevation: 4,
                        shadowColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: TextFormField(
                            onChanged: (value) {
                              homeController.nameCv = value;
                            },
                            onSaved: (newValue) {
                              homeController.nameCv = newValue.toString();
                            },
                            controller: homeController.nameCvController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'الاسم الذي سيعرض',
                                isDense: true, // important line
                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10,
                                    0), // control your hints text size
                                hintStyle: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    letterSpacing: 2,
                                    color: AppColors.theAppColorBlue,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.white30,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none)),
                            maxLines: 2,
                            minLines: 2,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 17.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Material(
                        elevation: 4,
                        shadowColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: TextFormField(
                            controller: homeController.descriptionCvController,
                            onChanged: (value) {
                              homeController.descriptionCv = value;
                            },
                            onSaved: (newValue) {
                              homeController.descriptionCv =
                                  newValue.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'وصف السيرة الذاتية',
                                isDense: true, // important line
                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10,
                                    0), // control your hints text size
                                hintStyle: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    letterSpacing: 2,
                                    color: AppColors.theAppColorBlue,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.white30,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none)),
                            maxLines: 15,
                            minLines: 15,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 17.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Material(
                        elevation: 4,
                        shadowColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: TextFormField(
                            onChanged: (value) {
                              homeController.phoneNumberOFCv = value;
                            },
                            onSaved: (newValue) {
                              homeController.phoneNumberOFCv =
                                  newValue.toString();
                            },
                            controller: homeController.phoneNumberCvController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'رقم التواصل الخاص بك',
                                isDense: true, // important line
                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10,
                                    0), // control your hints text size
                                hintStyle: TextStyle(
                                    fontFamily: AppTextStyles.Almarai,
                                    letterSpacing: 2,
                                    color: AppColors.theAppColorBlue,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.white30,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none)),
                            maxLines: 2,
                            minLines: 2,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 17.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextCustom(
                          theText: "صورة للسيرة الذاتية:",
                          fontSizeWidth: 17,
                          fontFamily: AppTextStyles.Almarai,
                          fontColor: AppColors.blackColorsTypeOne),
                      InkWell(
                        onTap: () async {
                          XFile? xfile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (xfile != null) {
                            Random random = new Random();
                            int randomNumber = random.nextInt(10000000);
                            File myfile = await File(xfile!.path);

                            String dir =
                                (await getApplicationDocumentsDirectory()).path;
                            String newPath =
                                path.join(dir, '$randomNumber.jpg');
                            File f = await File(myfile.path).copy(newPath);

                            Timer.periodic(Duration(seconds: 1), (Timer timer) {
                              // ignore: unnecessary_null_comparison
                              if (myfile == null) {
                              } else {
                                if (homeController.isChooesImage.value ==
                                    false) {
                                  setState(() {});

                                  homeController.upIm(f);
                                  setState(() {
                                    homeController.filename = basename(f.path);
                                  });
                                  homeController.addImageWork.value = true;
                                  homeController.isChooesImage.value = true;
                                } else {}
                              }
                            });
                          } else {}
                        },
                        child: GetX<HomeController>(
                          builder: (controller) => ContainerCustomApi(
                              colorContainer:
                                  controller.addImageWork.value == true
                                      ? Colors.green
                                      : AppColors.redColor,
                              theBorderRadius: 15,
                              heigthContainer: 30.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 37.h),
                                child: Text(
                                  controller.addImageWork.value == true
                                      ? "تم رفع الصورة"
                                      : "رفع صورة",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontSize: 16,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Text(
                        "اختار وتحكم بعرض السيرة الذاتية",
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
                    height: 17.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          homeController..isPublicCv.value = "0";
                        },
                        child: GetX<HomeController>(
                          builder: (controller) => ContainerCustomApi(
                              colorContainer: controller.isPublicCv.value == "0"
                                  ? Colors.green
                                  : AppColors.redColor,
                              theBorderRadius: 15,
                              heigthContainer: 30.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 17.h),
                                child: Text(
                                  "مخفية عن الاخرين",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontSize: 16,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          homeController.isPublicCv.value = "1";
                        },
                        child: GetX<HomeController>(
                          builder: (controller) => ContainerCustomApi(
                              colorContainer: controller.isPublicCv.value == "1"
                                  ? Colors.green
                                  : AppColors.redColor,
                              theBorderRadius: 15,
                              heigthContainer: 30.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 17.h),
                                child: Text(
                                  "قابلة للرؤية",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontSize: 16,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (homeController.nameCv == "a" &&
                              homeController.descriptionCv == "a" &&
                              homeController.phoneNumberOFCv == "a" &&
                              homeController.addImageWork.value == false) {
                            homeController.isNotHaveDataintoCv.value = true;
                          } else {
                            homeController.isNotHaveDataintoCv.value = false;
                            homeController.AddCv(
                                homeController.nameCv.toString(),
                                homeController.descriptionCv.toString(),
                                homeController.filename.toString(),
                                homeController.isPublicCv.value.toString(),
                                homeController.phoneNumberOFCv.toString());
                          }
                        },
                        child: ContainerCustomApi(
                          colorContainer: AppColors.yellowColor,
                          theBorderRadius: 15,
                          heigthContainer: 30.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 37.h),
                            child: Text(
                              "إضافة السيرة الذاتية الان",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  GetX<HomeController>(
                      builder: (controller) => Visibility(
                            visible: controller.isNotHaveDataintoCv.value,
                            child: Text(
                              "عليك ملاْ جميع البيانات المطلوبة من أجل إضافةالسيرة الذاتية",
                              style: TextStyle(
                                color: AppColors.redColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                ]),
              ),
            ),
          ),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingAddCv.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingAddCv.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingAddCv.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(ImagesPath.loading, width: 140.w),
                        Text(
                          "انتظر قليلاً يتم إضافة البيانات",
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
                  visible: controller.isAddCv.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddCv.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddCv.value,
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
                              "عزيزي المستخدم,,لقد تم إضافة البيانات بنجح سيتم نشرها بعد عملية التحقق والفحص",
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
                              homeController.cleanTheDataCv();
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
                            ),
                          )
                        ],
                      ),
                    ),
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddErrorCv.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddErrorCv.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddErrorCv.value,
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
                              "عزيزي المستخدم هنالك مشكلة في عملية الإضافة,,حاول مجددًا",
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
                                homeController.cleanTheDataCv();
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
