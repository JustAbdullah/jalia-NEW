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

class AddQues extends StatefulWidget {
  const AddQues({super.key});

  @override
  State<AddQues> createState() => _AddQuesState();
}

class _AddQuesState extends State<AddQues> {
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
                        theText: "صفحة إضافة موضوع-سؤال جديد",
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
                        "لطفًا قم بإدخال سؤالك او موضوعك ليتم عرضة",
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
                            controller: homeController.quesController,
                            onChanged: (value) {
                              homeController.TheQues = value;
                            },
                            onSaved: (newValue) {
                              homeController.descriptionCv =
                                  newValue.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "اكتب موضوعك هنا-سؤالك",
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Text(
                        "سيتم عرض أسمك عند إضافة الموضوع-السؤال ويمكن من أعضاء الجالية الرد  عليك",
                        style: TextStyle(
                            height: 1.5.h,
                            fontSize: 15.5.sp,
                            fontFamily: AppTextStyles.Almarai,
                            color: AppColors.redColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          homeController.AddQu(
                              homeController.TheQues.toString());
                        },
                        child: ContainerCustomApi(
                          colorContainer: AppColors.yellowColor,
                          theBorderRadius: 15,
                          heigthContainer: 30.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 57.h),
                            child: Text(
                              "الإضافة الان",
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
                  visible: controller.isAddQu.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddQu.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddQu.value,
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
                              homeController.cleanTheQu();
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
                  visible: controller.isAddErrorQu.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddErrorQu.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddErrorQu.value,
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
                                homeController.cleanTheQu();
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
