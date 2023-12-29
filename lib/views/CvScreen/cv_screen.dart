import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/controllers/home_controller.dart';
import 'package:jalia/customWidgets/custom_padding.dart';

import '../../core/constant/appcolors.dart';
import '../../customWidgets/custome_textfiled.dart';
import '../../customWidgets/search_text_filed.dart';
import 'CvWidget/list_of_cv.dart';
import 'CvWidget/list_of_cv_searching_name.dart';
import 'CvWidget/top_header_business_screen.dart';

class CvScreen extends StatelessWidget {
  const CvScreen({super.key});

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
                    TopHeaderCVScreen(),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: GetX<HomeController>(
                          builder: (controller) => TextFormFiledCustomSearch(
                            labelData: "ابحث عن سيرة ذاتية  ما",
                            hintData: "قم رجاءًا بإدخال اسم الشخص",
                            iconData:
                                controller.showTheResultCvNameSearch.value ==
                                        true
                                    ? Icons.close
                                    : Icons.search,
                            controllerData: homeController.TheNameSearchCv,
                            value: (value) {
                              homeController.theNameSearchingCv =
                                  value.toString();
                              return value;
                            },
                            fillColor: AppColors.whiteColor,
                            hintColor: AppColors.theAppColorBlue,
                            iconColor:
                                controller.isSearchingNameCv.value == true
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
                              controller.isSearchingNameCv.value = true;
                              homeController.theNameSearchingCv =
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
                      height: 15.h,
                    ),
                    SingleChildScrollView(
                        child: SizedBox(
                            height: 400.h,
                            child: GetX<HomeController>(
                                builder: (thecontrollerFluter) =>
                                    thecontrollerFluter
                                                .showTheResultCvNameSearch
                                                .value ==
                                            true
                                        ? ListOfCvSearchingName()
                                        : ListOfCv())))
                  ]),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
