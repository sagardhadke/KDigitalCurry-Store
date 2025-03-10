import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/routes/app_pages.dart';
import 'package:kdigital_curry_ecom/app/utils/constants/app_colors.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade800,
      body: SingleChildScrollView(
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              Container(
                height: 300.h,
                width: double.infinity,
                color: MyAppColors.primaryColor,
                child: Center(
                  child: Image.asset(
                    height: 200.h,
                    width: 200.w,
                    'assets/icons/kDigitalCurryLogo.png',
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 0.90.sh,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "User Name",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      onTapOutside: (event) {
                        if (FocusManager.instance.primaryFocus != null) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        }
                      },
                      onChanged: (value) {
                        if (controller.isLoginFormClicked) {
                          controller.loginFormKey.currentState!.validate();
                        }
                      },
                      validator: (username) {
                        if (username == null || username.isEmpty) {
                          return 'UserName is required';
                        }
                        return null;
                      },
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        hintText: "Enter User Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 15.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        obscureText: !controller.passwordVisible.value,
                        onTapOutside: (event) {
                          if (FocusManager.instance.primaryFocus != null) {
                            FocusManager.instance.primaryFocus!.unfocus();
                          }
                        },
                        onChanged: (value) {
                          if (controller.isLoginFormClicked) {
                            controller.loginFormKey.currentState!.validate();
                          }
                        },
                        validator: (pass) {
                          if (pass == null || pass.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 15.h,
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.passwordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                        ),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (val) =>
                                      controller.toggleRememberMe(),
                                  activeColor: MyAppColors.textColor,
                                ),
                              ),
                              Text(
                                "Remember Me",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ]),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 55.h,
                      child: ElevatedButton(
                        onPressed: controller.isUserLogging.value
                            ? null
                            : () {
                                if (controller.loginFormKey.currentState!
                                    .validate()) {
                                  controller.login();
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyAppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: controller.isUserLogging.value
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : Text(
                                "Log In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Center(
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.REGISTER),
                        child: Text(
                          "Don't Have an Account? Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
