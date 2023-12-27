import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/views/QuestionsScreen/QuestionsWidgets/detalis_qoestions.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/constant/app_text_styles.dart';
import '../../../core/constant/appcolors.dart';
import '../../../core/constant/images_path.dart';
import '../../../customWidgets/custom_container.dart';
import '../../../customWidgets/custom_container_api.dart';
import '../../../customWidgets/custom_padding.dart';
import '../../../customWidgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class ListOfQoestions extends StatelessWidget {
  const ListOfQoestions({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return FutureBuilder(
        future: homeController.getQuestionsDataFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.sizeOf(context).width,
              height: 150.h,
              color: AppColors.whiteColorTypeTwo,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return PaddingCustom(
                      theBottom: 10,
                      child: InkWell(
                        onTap: () async {
                          homeController.questions.community_questions_id =
                              snapshot.data['data'][i]['community_questions_id']
                                  .toString();
                          homeController.questions.ask =
                              snapshot.data['data'][i]['ask'].toString();
                          homeController.questions.user_id =
                              snapshot.data['data'][i]['user_id'].toString();
                          homeController.questions.user_name =
                              snapshot.data['data'][i]['user_name'].toString();
                          homeController.questions.eligibility_add = snapshot
                              .data['data'][i]['eligibility_add']
                              .toString();
                          homeController.questions.date =
                              snapshot.data['data'][i]['date'].toString();

                          Get.to(QoestionsDetails());
                        },
                        child: ContainerCustom(
                          theBorderRadius: 10,
                          colorContainer: AppColors.whiteColor,
                          heigthContainer: 80,
                          widthContainer: MediaQuery.sizeOf(context).width,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Lottie.asset(ImagesPath.person,
                                              width: 100,
                                              height: 40,
                                              fit: BoxFit.contain,
                                              repeat: false),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Visibility(
                                                visible: snapshot.data['data']
                                                            [i]
                                                        ['eligibility_add'] ==
                                                    "2",
                                                child: Image.asset(
                                                  ImagesPath.crown,
                                                  width: 20.w,
                                                )),
                                            TextCustom(
                                              theText: snapshot.data['data'][i]
                                                      ['user_name']
                                                  .toString(),
                                              fontSizeWidth: 16,
                                              fontFamily: AppTextStyles.Almarai,
                                              fontColor: snapshot.data['data']
                                                              [i]
                                                          ['eligibility_add'] ==
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
                                            width: 180.w,
                                            child: Text(
                                              snapshot.data['data'][i]['ask'],
                                              style: TextStyle(
                                                height: 1.5.h,
                                                color: AppColors.blackColor,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontSize: 15,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "قراءة المزيد....",
                                        style: TextStyle(
                                          height: 1.5.h,
                                          color: AppColors.theAppColorBlueWhite,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
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
                      baseColor: Color.fromARGB(31, 169, 167, 167),
                      highlightColor: AppColors.whiteColor,
                      enabled: true,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: PaddingCustom(
                          theBottom: 10,
                          child: ContainerCustom(
                            theBorderRadius: 10,
                            colorContainer: AppColors.whiteColor,
                            heigthContainer: 130,
                            widthContainer: MediaQuery.sizeOf(context).width,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                              "${ImagesPath.logo}",
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.contain,
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
                                        alignment: Alignment.topCenter,
                                        child: PaddingCustom(
                                          theTop: 30,
                                          child: TextCustom(
                                            theText: "يتم التحميل",
                                            fontColor: AppColors.blackColor,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontSizeWidth: 18,
                                            fontWeight: FontWeight.bold,
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
                                                fontSize: 14.sp,
                                                height: 1.7.h,
                                                color: AppColors
                                                    .balckColorTypeThree,
                                                fontFamily:
                                                    AppTextStyles.Almarai),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: PaddingCustom(
                                            theTop: 5,
                                            child: ContainerCustomApi(
                                              colorContainer:
                                                  AppColors.theAppColorBlue,
                                              theBorderRadius: 15,
                                              heigthContainer: 15.h,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.h),
                                                child: Text(
                                                  "يتم التحميل",
                                                  style: TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    fontSize: 14,
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
        });
  }
}
