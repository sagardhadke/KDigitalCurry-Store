import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return ScreenUtilInit(
          designSize: Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "KDigital Curry EComm",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          ),
        );
      },
    ),
  );
}
