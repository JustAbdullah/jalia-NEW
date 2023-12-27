import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/customWidgets/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../auth/sign_up_screen.dart';

class QoestionsDetails extends StatelessWidget {
  const QoestionsDetails({super.key});

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
                  TextCustom(
                      theText: "تفاصيل السؤال",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.balckColorTypeThree),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Lottie.asset(ImagesPath.person,
                                width: 100,
                                height: 70,
                                fit: BoxFit.contain,
                                repeat: false),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Visibility(
                                  visible: homeController
                                          .questions.eligibility_add ==
                                      "2",
                                  child: Image.asset(
                                    ImagesPath.crown,
                                    width: 20.w,
                                  )),
                              TextCustom(
                                theText: homeController.questions.user_name
                                    .toString(),
                                fontSizeWidth: 16,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor:
                                    homeController.questions.eligibility_add ==
                                            "2"
                                        ? AppColors.yellowColor
                                        : AppColors.blackColorTypeTeo,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: PaddingCustom(
                            theTop: 5,
                            child: Container(
                              width: 200.w,
                              child: Text(
                                homeController.questions.ask.toString(),
                                style: TextStyle(
                                  height: 1.5.h,
                                  color: AppColors.blackColor,
                                  fontFamily: AppTextStyles.Almarai,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 00.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ContainerCustom(
                        theBorderRadius: 0,
                        widthContainer: 200.w,
                        heigthContainer: 30,
                        colorContainer: AppColors.theAppColorBlue,
                        child: Center(
                          child: TextCustom(
                              theText: "التعليقات",
                              fontSizeWidth: 17,
                              fontFamily: AppTextStyles.Almarai,
                              fontColor: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder(
                          future: homeController.getCommentsDataFromDatabase(
                              homeController.questions.community_questions_id
                                  .toString()),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                width: MediaQuery.sizeOf(context).width,
                                color: AppColors.whiteColorTypeTwo,
                                child:
                                    homeController.isNoHaveComments.value ==
                                            true
                                        ? Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Lottie.asset(
                                                    ImagesPath.noDataIcon,
                                                    width: 200.w),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                TextCustom(
                                                    theText:
                                                        "لايوجد تعليق لهذا المنشور حتى الان",
                                                    fontSizeWidth: 15,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    fontWeight: FontWeight.bold,
                                                    fontColor: AppColors
                                                        .theAppColorBlue),
                                              ],
                                            ),
                                          )
                                        : ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                snapshot.data['data'].length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, i) {
                                              return PaddingCustom(
                                                theBottom: 10,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: AppColors.whiteColor,
                                                  ),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.h),
                                                      child: Row(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: 3
                                                                            .w),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {},
                                                                      child: Lottie.asset(
                                                                          ImagesPath
                                                                              .person,
                                                                          width:
                                                                              40,
                                                                          height:
                                                                              40,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                          repeat:
                                                                              false),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        TextCustom(
                                                                          theText: snapshot
                                                                              .data['data'][i]['user_name']
                                                                              .toString(),
                                                                          fontSizeWidth:
                                                                              16,
                                                                          fontFamily:
                                                                              AppTextStyles.Almarai,
                                                                          fontColor: snapshot.data['data'][i]['eligibility_add'] == "2"
                                                                              ? AppColors.yellowColor
                                                                              : snapshot.data['data'][i]['user_id'].toString() == "1"
                                                                                  ? AppColors.redColor
                                                                                  : AppColors.blackColorTypeTeo,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    TextCustom(
                                                                        theText: snapshot.data['data'][i]['user_id'].toString() ==
                                                                                "1"
                                                                            ? "مسؤول إداري"
                                                                            : snapshot.data['data'][i]['eligibility_add'] ==
                                                                                    "2"
                                                                                ? "عضو ذهبي"
                                                                                : "عضو عادي",
                                                                        fontSizeWidth:
                                                                            11,
                                                                        fontFamily:
                                                                            AppTextStyles
                                                                                .Almarai,
                                                                        fontColor:
                                                                            AppColors.balckColorTypeThree),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 3.w,
                                                          ),
                                                          SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topCenter,
                                                                  child:
                                                                      PaddingCustom(
                                                                    theTop: 5,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: 5
                                                                              .w,
                                                                          vertical:
                                                                              10.h),
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            270.w,
                                                                        child:
                                                                            Text(
                                                                          snapshot.data['data'][i]
                                                                              [
                                                                              'comment'],
                                                                          style:
                                                                              TextStyle(
                                                                            height:
                                                                                1.9.h,
                                                                            color:
                                                                                AppColors.blackColor,
                                                                            fontFamily:
                                                                                AppTextStyles.Almarai,
                                                                            fontSize:
                                                                                15,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                              );
                            } else {
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return Shimmer.fromColors(
                                        baseColor:
                                            Color.fromARGB(31, 169, 167, 167),
                                        highlightColor: AppColors.whiteColor,
                                        enabled: true,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.h),
                                          child: PaddingCustom(
                                            theBottom: 10,
                                            child: ContainerCustom(
                                              theBorderRadius: 10,
                                              colorContainer:
                                                  AppColors.whiteColor,
                                              heigthContainer: 130,
                                              widthContainer:
                                                  MediaQuery.sizeOf(context)
                                                      .width,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {},
                                                              child:
                                                                  Image.asset(
                                                                "${ImagesPath.logo}",
                                                                width: 100,
                                                                height: 100,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: PaddingCustom(
                                                            theTop: 30,
                                                            child: TextCustom(
                                                              theText:
                                                                  "يتم التحميل",
                                                              fontColor: AppColors
                                                                  .blackColor,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              fontSizeWidth: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 150.w,
                                                          height: 100.h,
                                                          child: PaddingCustom(
                                                            theTop: 15,
                                                            child: Text(
                                                              "يتم التحميل",
                                                              maxLines: 4,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  height: 1.7.h,
                                                                  color: AppColors
                                                                      .balckColorTypeThree,
                                                                  fontFamily:
                                                                      AppTextStyles
                                                                          .Almarai),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.h),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child:
                                                                PaddingCustom(
                                                              theTop: 5,
                                                              child:
                                                                  ContainerCustomApi(
                                                                colorContainer:
                                                                    AppColors
                                                                        .theAppColorBlue,
                                                                theBorderRadius:
                                                                    15,
                                                                heigthContainer:
                                                                    15.h,
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              8.h),
                                                                  child: Text(
                                                                    "يتم التحميل",
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .blackColor,
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai,
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ));
                                  });
                            }
                          })),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Material(
                        elevation: 4,
                        shadowColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: TextFormField(
                            controller: homeController.commentsController,
                            onChanged: (value) {
                              homeController.Thecomment = value;
                            },
                            onSaved: (newValue) {
                              homeController.Thecomment = newValue.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'أكتب التعليق هنا',
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
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 00.w, vertical: 10.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          if (homeController.displayIsHavaAccount.value == 0) {
                            homeController.isUserNotHaveAccount.value = true;
                          } else {
                            homeController.AddComments(
                                homeController.Thecomment.toString(),
                                homeController.questions.community_questions_id
                                    .toString());
                          }
                        },
                        child: ContainerCustom(
                          theBorderRadius: 0,
                          widthContainer: 200.w,
                          heigthContainer: 30,
                          colorContainer: AppColors.yellowColor,
                          child: Center(
                            child: TextCustom(
                                theText: "إضافة تعليق جديد",
                                fontSizeWidth: 17,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.whiteColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
          ),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddCo.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddCo.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddCo.value,
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
                              "لقد تم إضافة تعليقك بنجاح,,يمكنك مشاهدة تعليقك الان",
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
                              homeController.cleanTheCommetns();
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
                  visible: controller.isAddErrorCo.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddErrorCo.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.isAddErrorCo.value,
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
                              "عزيزي المستخدم هنالك مشكلة في إضافة التعليق ,,حاول مجددًا",
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
                                homeController.cleanTheCommetns();
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
