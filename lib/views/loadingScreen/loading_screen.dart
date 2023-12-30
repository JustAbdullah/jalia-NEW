import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custom_text.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.goToHome();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: PaddingCustom(
            theTop: 100.h,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Image.asset(
                    ImagesPath.logo,
                    width: 209.w,
                    height: 250.h,
                    fit: BoxFit.cover,
                  ),
                  PaddingCustom(
                      theTop: 20,
                      child: Lottie.asset(ImagesPath.loading,
                          width: 109.w, height: 100.h)),
                  PaddingCustom(
                    theTop: 0,
                    theBottom: 00,
                    theLeft: 0,
                    theRight: 0,
                    child: TextCustom(
                      theText: "أنتظر قليلًا",
                      fontSizeWidth: 20,
                      fontFamily: AppTextStyles.Almarai,
                      fontColor: AppColors.balckColorTypeThree,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
