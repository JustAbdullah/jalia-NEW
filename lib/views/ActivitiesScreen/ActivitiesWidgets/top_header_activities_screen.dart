import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jalia/core/constant/app_text_styles.dart';
import 'package:jalia/core/constant/appcolors.dart';

class TopHeaderActivitiessScreen extends StatelessWidget {
  const TopHeaderActivitiessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text("نشاطات الجالية الاسطنبولية",
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
              "شاهد نشاطات وفعاليات الجالية الاسطنبولية وتطلع لكل جديد",
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
