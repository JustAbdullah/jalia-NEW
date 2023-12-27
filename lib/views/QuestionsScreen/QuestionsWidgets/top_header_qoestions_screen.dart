import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/core/constant/appcolors.dart';

class TopHeaderQoestionsScreen extends StatelessWidget {
  const TopHeaderQoestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text("اسئلة وتفاعل المجتمع",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppTextStyles.Almarai,
                  color: AppColors.blackColorTypeTeo)),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Text(
              "تفاعل وشاهد واستفد من مجتمع الجالية الأسطنبولية,,يمكنك طرح سؤالك وسيتم الإجابة عليك بأقرب وقت ممكن",
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
