import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/utils/constants/app_colors.dart';
import 'package:kdigital_curry_ecom/app/utils/constants/asset_constants.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.primaryColor,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 8,
            child: Center(
                child: Image.asset(
                    height: 200.h, width: 200.w, controller.appLogo.value)),
          ),
          Spacer(),
          Lottie.asset(
            'assets/anim/loader.json',
            width: 150.w,
            height: 150.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
