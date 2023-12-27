import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jalia/customWidgets/custom_padding.dart';
import 'package:jalia/views/CommuncationScreen/CommuncationWidgets/top_header_communucation_screen.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import 'CommuncationWidgets/list_of_communcation.dart';

class CommunicationScreen extends StatelessWidget {
  const CommunicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeTwo,
      body: SafeArea(
          child: SingleChildScrollView(
        child: PaddingCustom(
          theTop: 30,
          child: Column(children: [
            TopHeaderCommunucationScreen(),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(height: 500.h, child: ListOfCommuncation())
          ]),
        ),
      )),
    );
  }
}
