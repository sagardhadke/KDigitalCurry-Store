import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/routes/app_pages.dart';
import 'package:kdigital_curry_ecom/app/utils/constants/app_colors.dart';
import 'package:kdigital_curry_ecom/app/utils/constants/asset_constants.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: controller.registerFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 0.35.sh,
                    width: double.infinity,
                    color: MyAppColors.primaryColor,
                    child: Center(
                      child: Image.asset(
                          height: 200.h, width: 200.w, AssetConstants.appLogo),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create a Account",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Full Name",
                              style: TextStyle(
                                fontSize: 14.sp,
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
                          controller: controller.fullNameController,
                          onTapOutside: (event) {
                            if (FocusManager.instance.primaryFocus != null) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            }
                          },
                          onChanged: (value) {
                            if (controller.isRegisterFormClicked) {
                              controller.registerFormKey.currentState!
                                  .validate();
                            }
                          },
                          validator: (fullName) {
                            if (fullName == null || fullName.isEmpty) {
                              return 'Full Name is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your Full Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 15.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                fontSize: 14.sp,
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
                          controller: controller.phoneNumController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          onTapOutside: (event) {
                            if (FocusManager.instance.primaryFocus != null) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            }
                          },
                          onChanged: (value) {
                            if (controller.isRegisterFormClicked) {
                              controller.registerFormKey.currentState!
                                  .validate();
                            }
                          },
                          validator: (phone) {
                            if (phone == null || phone.isEmpty) {
                              return 'Phone Number is required';
                            } else if (phone.length < 10) {
                              return 'Enter a valid phone number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Phone Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: CountryCodePicker(
                              backgroundColor: Colors.white,
                              showFlag: false,
                              favorite: ['IN', 'CA', 'USA'],
                              initialSelection: 'IN',
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
                              "Email",
                              style: TextStyle(
                                fontSize: 14.sp,
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
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 15.h,
                            ),
                          ),
                          onChanged: (value) {
                            if (controller.isRegisterFormClicked) {
                              controller.registerFormKey.currentState!
                                  .validate();
                            }
                          },
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Email is required';
                            }
                            String pattern =
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(email)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                              "Address",
                              style: TextStyle(
                                fontSize: 14.sp,
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
                          controller: controller.addressController,
                          onTapOutside: (event) {
                            if (FocusManager.instance.primaryFocus != null) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            }
                          },
                          onChanged: (value) {
                            if (controller.isRegisterFormClicked) {
                              controller.registerFormKey.currentState!
                                  .validate();
                            }
                          },
                          validator: (address) {
                            if (address == null || address.isEmpty) {
                              return 'Address is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Address",
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
                              "User Name",
                              style: TextStyle(
                                fontSize: 14.sp,
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
                          controller: controller.userNameController,
                          onTapOutside: (event) {
                            if (FocusManager.instance.primaryFocus != null) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            }
                          },
                          onChanged: (value) {
                            if (controller.isRegisterFormClicked) {
                              controller.registerFormKey.currentState!
                                  .validate();
                            }
                          },
                          validator: (username) {
                            if (username == null || username.isEmpty) {
                              return 'Username is required';
                            }
                            return null;
                          },
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
                                fontSize: 14.sp,
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
                            onChanged: (value) {
                              if (controller.isRegisterFormClicked) {
                                controller.registerFormKey.currentState!
                                    .validate();
                              }
                            },
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return 'Password is required';
                              } else if (password.length < 6) {
                                return 'Password must be at least 6 characters';
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
                        SizedBox(
                          height: 25.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 55.h,
                          child: ElevatedButton(
                            onPressed: controller.isUserRegistering.value
                                ? null
                                : () {
                                    controller.isRegisterFormClicked = true;
                                    if (controller.registerFormKey.currentState!
                                        .validate()) {
                                      controller.register();
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyAppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: controller.isUserRegistering.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : Text(
                                    "Create Account",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Center(
                          child: InkWell(
                            onTap: () => Get.toNamed(Routes.LOGIN),
                            child: Text(
                              "Already have an Account? Login",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.05.sh,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
