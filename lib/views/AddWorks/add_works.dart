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

import '../types_api/list_of_places_api.dart';
import '../types_api/list_of_types_works_api.dart';

class AddWorks extends StatefulWidget {
  const AddWorks({super.key});

  @override
  State<AddWorks> createState() => _AddWorksState();
}

class _AddWorksState extends State<AddWorks> {
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
              key: homeController.formAddWorks,
              child: PaddingCustom(
                theBottom: 20.h,
                child: Column(children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextCustom(
                        theText: "صفحة إضافة فرص العمل والاعلانات",
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
                        "لطفًا قم بإدخال البيانات لإضافة الاعلانات-فرص العمل في الجالية",
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
                              homeController.nameWork = value;
                            },
                            onSaved: (newValue) {
                              homeController.nameWork = newValue.toString();
                            },
                            controller: homeController.nameWorkController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'المسمى الوظيفي',
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
                            controller:
                                homeController.descriptionWorkController,
                            onChanged: (value) {
                              homeController.descriptionWo = value;
                            },
                            onSaved: (newValue) {
                              homeController.descriptionWo =
                                  newValue.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'وصف-متطلبات العمل',
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
                            controller:
                                homeController.numberPhoneWorkController,
                            onChanged: (value) {
                              homeController.Worknumber = value;
                            },
                            onSaved: (newValue) {
                              homeController.Worknumber = newValue.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'الرقم الرسمي للتواصل مع جهة العمل',
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
                            controller: homeController.ComWorkController,
                            onChanged: (value) {
                              homeController.WorkCom = value;
                            },
                            onSaved: (newValue) {
                              homeController.WorkCom = newValue.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "اسم الشركة المقدمة للعمل",
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
                    height: 27.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextCustom(
                          theText: "تصنيف العمل:",
                          fontSizeWidth: 17,
                          fontFamily: AppTextStyles.Almarai,
                          fontColor: AppColors.blackColorsTypeOne),
                      InkWell(
                          onTap: () {
                            homeController.showtheTypesOfWorks.value = true;
                          },
                          child: ContainerCustomApi(
                            colorContainer: AppColors.theAppColorBlue,
                            theBorderRadius: 15,
                            heigthContainer: 30.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17.h),
                              child: GetX<HomeController>(
                                builder: (Thecontrollern) => Text(
                                  Thecontrollern.theTypeWork.value.toString(),
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextCustom(
                          theText: "منطقة العمل:",
                          fontSizeWidth: 17,
                          fontFamily: AppTextStyles.Almarai,
                          fontColor: AppColors.blackColorsTypeOne),
                      InkWell(
                          onTap: () {
                            homeController.showThePlacesList.value = true;
                          },
                          child: ContainerCustomApi(
                            colorContainer: AppColors.theAppColorBlue,
                            theBorderRadius: 15,
                            heigthContainer: 30.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17.h),
                              child: GetX<HomeController>(
                                builder: (Thecontroller) => Text(
                                  Thecontroller.thePlaceList.value.toString(),
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextCustom(
                          theText: " اختيار صورة رمزية للعمل:",
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

                          /*   await Future.delayed(Duration(seconds: 15),
                                          () async {
                                        controller.upIm(myfile);
                                        setState(() {
                                          controller.filename =
                                              basename(myfile.path);
                                        });
                                        setState(() {});
                                      });*/
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
                    height: 27.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          homeController.AddWork(
                              homeController.nameWork.toString(),
                              homeController.descriptionWo.toString(),
                              homeController.filename.toString(),
                              homeController.WorkCom.toString(),
                              homeController.idOfTypeWork.value.toString(),
                              homeController.placeCom.toString(),
                              homeController.Worknumber.toString());
                        },
                        child: ContainerCustomApi(
                          colorContainer: AppColors.yellowColor,
                          theBorderRadius: 15,
                          heigthContainer: 30.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 37.h),
                            child: Text(
                              "إضافة فرصة العمل الان",
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
                  )
                ]),
              ),
            ),
          ),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showtheTypesOfWorks.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showtheTypesOfWorks.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showtheTypesOfWorks.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Container(
                        color: AppColors.whiteColor,
                        width: 300.w,
                        height: 500.h,
                        child: ListOfTypesWorksApi(),
                      ),
                    ),
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showThePlacesList.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showThePlacesList.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showThePlacesList.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Container(
                        color: AppColors.whiteColor,
                        width: 300.w,
                        height: 500.h,
                        child: ListOfPlacesApi(),
                      ),
                    ),
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingAddWork.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingAddWork.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isLoadingAddWork.value,
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
                  visible: controller.isAddWork.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddWork.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddWork.value,
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
                              homeController.cleanTheWorksDataAdd();
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
                  visible: controller.isAddErrorWork.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddErrorWork.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddErrorWork.value,
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
                                homeController.cleanTheWorksDataAdd();
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
