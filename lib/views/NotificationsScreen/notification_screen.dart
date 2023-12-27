import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../core/constant/appcolors.dart';
import '../../customWidgets/custom_padding.dart';
import 'NotificationsWidgets/list_of_notifications.dart';
import 'NotificationsWidgets/top_header_notifications_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
            TopHeaderNotificationsScreen(),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(height: 500.h, child: ListOfNotifications())
          ]),
        ),
      )),
    );
  }
}
