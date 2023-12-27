import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_container.dart';
import '../../customWidgets/custom_text.dart';

class ErrorAdd extends StatelessWidget {
  const ErrorAdd({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeOne,
      body: SafeArea(
          child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextCustom(
                  theText:
                      "عزيزي المستخدم,,ناسف لذلك ولكن لاتستطيع الإضافة الان,,عليك ترقية حسابك بالبداية",
                  fontSizeWidth: 17,
                  Theheight: 1.5,
                  fontFamily: AppTextStyles.Almarai,
                  fontColor: AppColors.blackColorTypeTeo),
              SizedBox(
                height: 20.h,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ContainerCustom(
                          widthContainer: 200,
                          heigthContainer: 40,
                          theBorderRadius: 10,
                          colorContainer: AppColors.yellowColor,
                          child: Center(
                            child: TextCustom(
                                theText: "التحصل على العضوية",
                                fontSizeWidth: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppTextStyles.Almarai,
                                fontColor: AppColors.blackColorTypeTeo),
                          )),
                    )
                  ]),
            ],
          ),
        ),
      )),
    );
  }
}
