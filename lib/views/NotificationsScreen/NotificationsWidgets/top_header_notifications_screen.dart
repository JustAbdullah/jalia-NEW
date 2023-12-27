import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/core/constant/appcolors.dart';

class TopHeaderNotificationsScreen extends StatelessWidget {
  const TopHeaderNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text("اشعارات الجالية الاسطنبولية",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppTextStyles.Almarai,
                  color: AppColors.blackColorTypeTeo)),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Text(
              "اشعارات الجالية الاسطنبولية للاحداث المهمة والتى تهم المجتمع",
              style: TextStyle(
                  height: 1.5.h,
                  fontSize: 14,
                  fontFamily: AppTextStyles.Almarai,
                  color: AppColors.balckColorTypeThree),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
