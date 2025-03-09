import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayDone extends StatefulWidget {
  const PayDone({super.key});

  @override
  _PayDoneState createState() => _PayDoneState();
}

class _PayDoneState extends State<PayDone> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      removeCartsItems();
      Get.offAllNamed(Routes.HOME);
    });
  }

  Future<void> removeCartsItems() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("cartItems");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/anim/pay.json',
          width: 150.w,
          height: 150.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
