import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/core/constant/appcolors.dart';
import 'package:jalia/customWidgets/custom_text.dart';

class TopHeaderBusinessScreen extends StatelessWidget {
  const TopHeaderBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextCustom(
            theText: "قائمة دليل الاعمال التجارية",
            fontSizeWidth: 20,
            fontFamily: AppTextStyles.Almarai,
            fontColor: AppColors.blackColorTypeTeo),
        SizedBox(
          height: 15.h,
        ),
        TextCustom(
            theText:
                "شاهد قائمة دليل الاعمال التجارية المتوفرة في تطبيق الجالية",
            fontSizeWidth: 14,
            fontFamily: AppTextStyles.Almarai,
            fontColor: AppColors.balckColorTypeThree),
      ],
    );
  }
}
