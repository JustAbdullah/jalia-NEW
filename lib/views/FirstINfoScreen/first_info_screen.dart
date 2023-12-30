import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_container.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custom_text.dart';

class FirstInfo extends StatelessWidget {
  const FirstInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoOne.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoOne.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoOne.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoOne.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 70.h),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 320.h,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          Lottie.asset(ImagesPath.alert,
                              width: 150.w, repeat: false),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Text(
                              "مرحبًا بك عزيزي المستخدم,,إنها زيارتك الأولى ولذلك سنقوم بإظهار الدليل التعريفي,,فضًلا شاهد بعناية...",
                              style: TextStyle(
                                  height: 1.5.h,
                                  color: AppColors.whiteColor,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          InkWell(
                            onTap: () {
                              controller.showInfoTwo();
                            },
                            child: ContainerCustom(
                              widthContainer: 180.w,
                              heigthContainer: 30,
                              colorContainer: AppColors.yellowColor,
                              child: Center(
                                child: TextCustom(
                                    theText: "المــتابعة",
                                    fontSizeWidth: 18,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeThree),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "1/5",
                            style: TextStyle(
                                height: 1.5.h,
                                color: AppColors.yellowColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                    ),
                  ),
                ))),
////////////////////////////////Two

        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoTwo.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoTwo.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoTwo.value,
                child: Column(
                  children: [
                    PaddingCustom(
                        theTop: 90.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: ContainerCustom(
                                    heigthContainer: 150,
                                    widthContainer: 100,
                                    theBorderRadius: 10,
                                    colorContainer: AppColors.yellowColor,
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "دليل أعمال الجالية",
                                              style: TextStyle(
                                                height: 1.3.h,
                                                color:
                                                    AppColors.blackColorTypeTeo,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
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
                                onTap: () {},
                                child: ContainerCustom(
                                    heigthContainer: 150,
                                    widthContainer: 100,
                                    theBorderRadius: 10,
                                    colorContainer: AppColors.yellowColor,
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "الاعلانات وفرص العمل",
                                              style: TextStyle(
                                                height: 1.3.h,
                                                color:
                                                    AppColors.blackColorTypeTeo,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
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
                                  onTap: () {},
                                  child: ContainerCustom(
                                      heigthContainer: 150,
                                      widthContainer: 100,
                                      theBorderRadius: 10,
                                      colorContainer: AppColors.yellowColor,
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
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                "السير الذاتية للجالية",
                                                style: TextStyle(
                                                  color: AppColors
                                                      .blackColorTypeTeo,
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
                                onTap: () {},
                                child: ContainerCustom(
                                    heigthContainer: 150,
                                    widthContainer: 100,
                                    theBorderRadius: 10,
                                    colorContainer: AppColors.yellowColor,
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "أسال الجالية",
                                              style: TextStyle(
                                                height: 1.3.h,
                                                color:
                                                    AppColors.blackColorTypeTeo,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
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
                                onTap: () {},
                                child: ContainerCustom(
                                    heigthContainer: 150,
                                    widthContainer: 100,
                                    theBorderRadius: 10,
                                    colorContainer: AppColors.yellowColor,
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "أشعارات الجالية",
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
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              InkWell(
                                onTap: () {},
                                child: ContainerCustom(
                                    heigthContainer: 150,
                                    widthContainer: 100,
                                    theBorderRadius: 10,
                                    colorContainer: AppColors.yellowColor,
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "منصات الجالية",
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
                              )
                            ],
                          ),
                        )),
                    PaddingCustom(
                        theTop: 20.h,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(children: [
                              InkWell(
                                onTap: () {},
                                child: ContainerCustom(
                                    heigthContainer: 150,
                                    widthContainer: 100,
                                    theBorderRadius: 10,
                                    colorContainer: AppColors.yellowColor,
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "نشاطات الجالية",
                                              style: TextStyle(
                                                height: 1.3.h,
                                                color:
                                                    AppColors.blackColorTypeTeo,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
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
                              )
                            ]))),
                  ],
                ))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoTwo.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),

        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoTwo.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    height: 400.h,
                    child: SingleChildScrollView(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 50.h),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Text(
                              "هل تشاهد هذة الخيارات؟ إننا نوفر لك عزيزي المستخدم سبع  نوافذ أساسية تستطيع تصفحها بكل سهولة لمشاهدة تفاصيلها ونوافذها الداخلية",
                              style: TextStyle(
                                  height: 1.5.h,
                                  color: AppColors.whiteColor,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          InkWell(
                            onTap: () {
                              controller.showInfoThree();
                            },
                            child: ContainerCustom(
                              widthContainer: 180.w,
                              heigthContainer: 30,
                              colorContainer: AppColors.yellowColor,
                              child: Center(
                                child: TextCustom(
                                    theText: "المــتابعة",
                                    fontSizeWidth: 18,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeThree),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "2/5",
                            style: TextStyle(
                                height: 1.5.h,
                                color: AppColors.yellowColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
                  ),
                )))

        ///////////////////////Three.................../////////////

        ,
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoThree.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoThree.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoThree.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoThree.value,
                child: Column(
                  children: [
                    PaddingCustom(
                        theTop: 90.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "دليل أعمال الجالية",
                                              style: TextStyle(
                                                height: 1.3.h,
                                                color:
                                                    AppColors.blackColorTypeTeo,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
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
                                onTap: () {},
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "الاعلانات وفرص العمل",
                                              style: TextStyle(
                                                height: 1.3.h,
                                                color:
                                                    AppColors.blackColorTypeTeo,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
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
                                  onTap: () {},
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
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                "السير الذاتية للجالية",
                                                style: TextStyle(
                                                  color: AppColors
                                                      .blackColorTypeTeo,
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
                                onTap: () {},
                                child: ContainerCustom(
                                    heigthContainer: 150,
                                    widthContainer: 100,
                                    theBorderRadius: 10,
                                    colorContainer: AppColors.yellowColor,
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "أسال الجالية",
                                              style: TextStyle(
                                                height: 1.3.h,
                                                color:
                                                    AppColors.blackColorTypeTeo,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
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
                                onTap: () {},
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "أشعارات الجالية",
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
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              InkWell(
                                onTap: () {},
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "منصات الجالية",
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
                              )
                            ],
                          ),
                        )),
                  ],
                ))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoThree.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoThree.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),

        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoThree.value,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    height: 400.h,
                    child: SingleChildScrollView(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 50.h),
                      child: Column(
                        children: [
                          Lottie.asset(ImagesPath.messages, width: 100.w),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Text(
                              "هل ترى أيقونة أسال الجالية؟ انضم الان لمجتمع الجالية الضخم  وتفاعل وأسئل وجد مختلف الأجابات التى تحتاجها ",
                              style: TextStyle(
                                  height: 1.5.h,
                                  color: AppColors.whiteColor,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          InkWell(
                            onTap: () {
                              controller.showInfoFour();
                            },
                            child: ContainerCustom(
                              widthContainer: 180.w,
                              heigthContainer: 30,
                              colorContainer: AppColors.yellowColor,
                              child: Center(
                                child: TextCustom(
                                    theText: "المــتابعة",
                                    fontSizeWidth: 18,
                                    fontFamily: AppTextStyles.Almarai,
                                    fontColor: AppColors.balckColorTypeThree),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "3/5",
                            style: TextStyle(
                                height: 1.5.h,
                                color: AppColors.yellowColor,
                                fontFamily: AppTextStyles.Almarai,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
                  ),
                )))

        /////////////////////////Four............/////////////
        ,
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFour.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFour.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black26))),

        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFour.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFour.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFour.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black26))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFour.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black26))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFour.value,
                child: Align(
                  alignment: Alignment.center,
                  child: PaddingCustom(
                      theTop: 345.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: ContainerCustom(
                                  heigthContainer: 150,
                                  widthContainer: 100,
                                  theBorderRadius: 10,
                                  child: Stack(
                                    children: [
                                      Column(
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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                "نشاطات الجالية",
                                                style: TextStyle(
                                                  height: 1.3.h,
                                                  color: AppColors
                                                      .blackColorTypeTeo,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  fontSize: 15.sp,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: 150.h,
                                        width: 100.w,
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
                                colorContainer: AppColors.yellowColor,
                                child: Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {},
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "إضافة دليل عمل جديد",
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
                                        ),
                                      ]),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 15.w,
                            ),
                            ContainerCustom(
                                heigthContainer: 150,
                                widthContainer: 100,
                                theBorderRadius: 10,
                                colorContainer: AppColors.yellowColor,
                                child: Stack(
                                  children: [
                                    InkWell(
                                        onTap: () {},
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
                                                    color: AppColors
                                                        .blackColorTypeTeo,
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
                                  ],
                                )),
                          ],
                        ),
                      )),
                ))),

        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFour.value,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                        height: 400.h,
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.only(top: 220.h),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.w),
                                      child: Text(
                                        "عزيزي المستخدم.. هل ترى نوافذ الإضافة؟ ,يمكنك التمتع بهذة الصلاحيات عند تسجيلك وحصولك على العضوية",
                                        style: TextStyle(
                                            height: 1.5.h,
                                            color: AppColors.whiteColor,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.showInfoFive();
                                      },
                                      child: ContainerCustom(
                                        widthContainer: 180.w,
                                        heigthContainer: 30,
                                        colorContainer: AppColors.yellowColor,
                                        child: Center(
                                          child: TextCustom(
                                              theText: "المــتابعة",
                                              fontSizeWidth: 18,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontColor: AppColors
                                                  .balckColorTypeThree),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "4/5",
                                      style: TextStyle(
                                          height: 1.5.h,
                                          color: AppColors.yellowColor,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ))))))),

        ////////////////Five///////////

        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFive.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFive.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFive.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black12))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFive.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFive.value,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFive.value,
                child: PaddingCustom(
                    child: ContainerCustom(
                        heigthContainer: 70,
                        widthContainer: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PaddingCustom(
                                  theTop: 20.h,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImagesPath.account,
                                        width: 40.w,
                                      ),
                                      PaddingCustom(
                                        theTop: 10.h,
                                        child: TextCustom(
                                          theText: "اضغط هنا للتسجيل",
                                          fontSizeWidth: 14,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontColor: AppColors.redColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(ImagesPath.logo,
                                    width: 100.w,
                                    height: 70.h,
                                    fit: BoxFit.cover),
                              ],
                            ),
                          ),
                        ))))),
        GetX<HomeController>(
            builder: (controller) => Visibility(
                visible: controller.infoFive.value,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 500.h,
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.only(top: 170.h),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.w),
                                      child: Text(
                                        "أترى؟ الجزء العلوي من الشاشة؟ يمكنك الضغط على الايقونة لبدء عملية تسجيل الدخول-إنشاء حساب وفي حال تمت عملية التسجيل سيظهر لك الملف الشخصي...",
                                        style: TextStyle(
                                            height: 1.5.h,
                                            color: AppColors.whiteColor,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.w),
                                      child: Text(
                                        "نُشكر صبرك وحسن الإنصات ونرجو لك تجربة ممتعة ومفيدة,,إدارة الجالية الإسطنبولية",
                                        style: TextStyle(
                                            height: 1.5.h,
                                            color: AppColors.yellowColor,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.endTheInfo();
                                      },
                                      child: ContainerCustom(
                                        widthContainer: 180.w,
                                        heigthContainer: 30,
                                        colorContainer: AppColors.yellowColor,
                                        child: Center(
                                          child: TextCustom(
                                              theText: "الإخفاء الان",
                                              fontSizeWidth: 18,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontColor: AppColors
                                                  .balckColorTypeThree),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "5/5",
                                      style: TextStyle(
                                          height: 1.5.h,
                                          color: AppColors.yellowColor,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ))))))),
      ],
    );
  }
}
