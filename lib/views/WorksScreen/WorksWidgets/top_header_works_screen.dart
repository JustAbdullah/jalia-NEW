import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/core/constant/appcolors.dart';

class TopHeaderWorksScreen extends StatelessWidget {
  const TopHeaderWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text("الاعلانات والفرص الوظيفية ",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppTextStyles.Almarai,
                  color: AppColors.blackColorTypeTeo)),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "شاهد قائمة العروض الوظيفية المتوفرة في التطبيق",
            style: TextStyle(
                fontSize: 14,
                fontFamily: AppTextStyles.Almarai,
                color: AppColors.balckColorTypeThree),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
