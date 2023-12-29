import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/controllers/home_controller.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/customWidgets/custom_padding.dart';
import 'package:jalia/customWidgets/custom_text.dart';

import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_container_api.dart';
import '../../customWidgets/custome_textfiled.dart';
import '../../customWidgets/search_text_filed.dart';
import 'BusinessWidgets/list_of_business.dart';
import 'BusinessWidgets/list_of_business_fluter.dart';
import 'BusinessWidgets/list_of_business_searching_name.dart';
import 'BusinessWidgets/list_of_places.dart';
import 'BusinessWidgets/list_of_types_bussines.dart';
import 'BusinessWidgets/top_header_business_screen.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

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
                    TopHeaderBusinessScreen(),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: GetX<HomeController>(
                          builder: (controller) => TextFormFiledCustomSearch(
                            labelData: "ابحث عن شركة ما",
                            hintData: "قم رجاءًا بإدخال اسم الشركة",
                            iconData: controller
                                        .showTheResultCompenyNameSearch.value ==
                                    true
                                ? Icons.close
                                : Icons.search,
                            controllerData: homeController.TheNameSearchCompeny,
                            value: (value) {
                              homeController.theNameSearchingCompeny =
                                  value.toString();
                              return value;
                            },
                            fillColor: AppColors.whiteColor,
                            hintColor: AppColors.theAppColorBlue,
                            iconColor:
                                controller.isSearchingNameCompeny.value == true
                                    ? AppColors.redColor
                                    : AppColors.balckColorTypeThree,
                            borderSideColor: AppColors.whiteColor,
                            onTap: () {
                              controller.searchNowNameCompeny();
                            },
                            fontColor: AppColors.balckColorTypeThree,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            autofillHints: [AutofillHints.name],
                            onChanged: (value) {
                              controller.isSearchingNameCompeny.value = true;
                              homeController.theNameSearchingCompeny =
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
                                          controller.isFluterPlaceComp.value ==
                                                  true
                                              ? AppColors.yellowColor
                                              : AppColors.theAppColorBlue,
                                      theBorderRadius: 15,
                                      heigthContainer: 20.h,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.h),
                                        child: Text(
                                          controller.thePlaceComp.value,
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
                                            .showtheTypesOfComp.value = true;
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
                                    homeController.showtheTypesOfComp.value =
                                        true;
                                  },
                                  child: ContainerCustomApi(
                                    colorContainer:
                                        controller.isFluterTypeComp.value ==
                                                true
                                            ? AppColors.yellowColor
                                            : AppColors.theAppColorBlue,
                                    theBorderRadius: 15,
                                    heigthContainer: 20.h,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.h),
                                      child: Text(
                                        homeController.theTypeComp.value
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
                                    controller.makeFluterComp();
                                  },
                                  child: ContainerCustomApi(
                                    colorContainer:
                                        controller.countTheFluterComp.value ==
                                                    1 ||
                                                controller.countTheFluterComp
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
                                        controller.isFluterNowComp.value == true
                                            ? "إلغاء الفلترة"
                                            : controller.countTheFluterComp
                                                            .value ==
                                                        1 ||
                                                    controller
                                                            .countTheFluterComp
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
                            height: 400.h,
                            child: GetX<HomeController>(
                                builder: (thecontrollerFluter) =>
                                    thecontrollerFluter
                                                .showTheResultCompenyNameSearch
                                                .value ==
                                            true
                                        ? ListOfBusinessSearchingName()
                                        : thecontrollerFluter
                                                    .isFluterNowComp.value ==
                                                true
                                            ? ListOfBusinessFluter()
                                            : ListOfBusiness())))
                  ]),
                ),
              ),
            ),
          ),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showtheTypesOfComp.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showtheTypesOfComp.value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black38,
                  ))),
          GetX<HomeController>(
              builder: (controller) => Visibility(
                  visible: controller.showtheTypesOfComp.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Container(
                        color: AppColors.whiteColor,
                        width: 300.w,
                        height: 500.h,
                        child: ListOfBusinessTypes(),
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
