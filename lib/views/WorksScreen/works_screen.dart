import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/controllers/home_controller.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/customWidgets/custom_padding.dart';
import 'package:jalia/customWidgets/custom_text.dart';
import 'package:jalia/views/WorksScreen/WorksWidgets/list_of_places.dart';
import 'package:jalia/views/WorksScreen/WorksWidgets/list_of_works.dart';
import 'package:jalia/views/WorksScreen/WorksWidgets/top_header_works_screen.dart';

import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_container_api.dart';
import '../../customWidgets/custome_textfiled.dart';
import '../../customWidgets/search_text_filed.dart';
import 'WorksWidgets/list_of_types_works.dart';
import 'WorksWidgets/list_of_works_fluter.dart';
import 'WorksWidgets/list_of_works_search_with_name.dart';

class WorksScreen extends StatelessWidget {
  const WorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeTwo,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: PaddingCustom(
                  theTop: 36,
                  theBottom: 10,
                  child: Column(children: [
                    TopHeaderWorksScreen(),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: GetX<HomeController>(
                          builder: (controller) => TextFormFiledCustomSearch(
                            labelData: "ابحث عن وظيفة",
                            hintData: "قم رجاءًا بإدخال اسم الوظيفة",
                            iconData:
                                controller.showTheResultWorkNameSearch.value ==
                                        true
                                    ? Icons.close
                                    : Icons.search,
                            controllerData: homeController.TheNameSearchWork,
                            value: (value) {
                              homeController.theNameSearchingWork =
                                  value.toString();
                              return value;
                            },
                            fillColor: AppColors.whiteColor,
                            hintColor: AppColors.theAppColorBlue,
                            iconColor:
                                controller.isSearchingNameWork.value == true
                                    ? AppColors.redColor
                                    : AppColors.balckColorTypeThree,
                            borderSideColor: AppColors.whiteColor,
                            onTap: () {
                              controller.searchNowNameWork();
                            },
                            fontColor: AppColors.balckColorTypeThree,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            autofillHints: [AutofillHints.name],
                            onChanged: (value) {
                              controller.isSearchingNameWork.value = true;
                              homeController.theNameSearchingWork =
                                  value.toString();
                              return value;
                            },
                            validator: (p0) {},
                          ),
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: GetX<HomeController>(
                            builder: (controller) => Row(
                              children: [
                                PaddingCustom(
                                  theTop: 0,
                                  child: TextCustom(
                                      theText: "المنطقة:",
                                      fontSizeWidth: 15,
                                      fontFamily: AppTextStyles.Almarai,
                                      fontColor: AppColors.balckColorTypeThree),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                InkWell(
                                    onTap: () {
                                      homeController.showthePlaces.value = true;
                                    },
                                    child: ContainerCustomApi(
                                      colorContainer:
                                          controller.isFluterPlaceWork.value ==
                                                  true
                                              ? AppColors.yellowColor
                                              : AppColors.theAppColorBlue,
                                      theBorderRadius: 15,
                                      heigthContainer: 20.h,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.h),
                                        child: Text(
                                          controller.thePlaceWork.value,
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontFamily: AppTextStyles.Almarai,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 5.w,
                                ),
                                PaddingCustom(
                                    theTop: 0,
                                    child: InkWell(
                                      onTap: () {
                                        homeController
                                            .showtheTypesOfWorks.value = true;
                                      },
                                      child: TextCustom(
                                          theText: "التصنيف:",
                                          fontSizeWidth: 15,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontColor:
                                              AppColors.balckColorTypeThree),
                                    )),
                                InkWell(
                                  onTap: () {
                                    homeController.showtheTypesOfWorks.value =
                                        true;
                                  },
                                  child: ContainerCustomApi(
                                    colorContainer:
                                        controller.isFluterTypeWork.value ==
                                                true
                                            ? AppColors.yellowColor
                                            : AppColors.theAppColorBlue,
                                    theBorderRadius: 15,
                                    heigthContainer: 20.h,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.h),
                                      child: Text(
                                        homeController.theTypeWork.value
                                            .toString(),
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.makeFluter();
                                  },
                                  child: ContainerCustomApi(
                                    colorContainer:
                                        controller.countTheFluterWorks.value ==
                                                    1 ||
                                                controller.countTheFluterWorks
                                                        .value ==
                                                    2
                                            ? AppColors.redColor
                                            : AppColors.balckColorTypeThree,
                                    theBorderRadius: 15,
                                    heigthContainer: 20.h,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.h),
                                      child: Text(
                                        controller.isFluterNow.value == true
                                            ? "إلغاء الفلترة"
                                            : controller.countTheFluterWorks
                                                            .value ==
                                                        1 ||
                                                    controller
                                                            .countTheFluterWorks
                                                            .value ==
                                                        2
                                                ? "قم بالفلترة الان"
                                                : "فلترة",
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    SingleChildScrollView(
                        child: SizedBox(
                            height: 450.h,
                            child: GetX<HomeController>(
                                builder: (thecontrollerFluter) =>
                                    thecontrollerFluter
                                                .showTheResultWorkNameSearch
                                                .value ==
                                            true
                                        ? ListOfWorksSearchingByName()
                                        : thecontrollerFluter
                                                    .isFluterNow.value ==
                                                true
                                            ? ListOfWorksFluter()
                                            : ListOfWorks())))
                  ]),
                ),
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
                        child: ListOfTypesWorks(),
                      ),
                    ),
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showthePlaces.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showthePlaces.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showthePlaces.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Container(
                        color: AppColors.whiteColor,
                        width: 300.w,
                        height: 500.h,
                        child: ListOfPlaces(),
                      ),
                    ),
                  )))
        ],
      )),
    );
  }
}
