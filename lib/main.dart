import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/services/auth_service.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(FirebaseService());
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
