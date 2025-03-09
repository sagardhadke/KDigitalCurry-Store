import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisible = false.obs;
  RxBool isUserRegistering = false.obs;

  bool isRegisterFormClicked = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneNumController.dispose();
    emailController.dispose();
    addressController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  Future<void> register() async {
    isRegisterFormClicked = true;
    if (!registerFormKey.currentState!.validate()) {
      return;
    }
    isUserRegistering.value = true;

    String fullName = fullNameController.text.trim();
    String phone = phoneNumController.text.trim();
    String email = emailController.text.trim();
    String address = addressController.text.trim();
    String username = userNameController.text.trim();
    String password = passwordController.text.trim();

    String? error = await FirebaseService().registerUser(
      email: email,
      password: password,
      fullName: fullName,
      phone: phone,
      address: address,
      username: username,
    );

    isUserRegistering.value = false;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userName", username);
    prefs.setString("Email", email);

    if (error == null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar("Registration Failed", error,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
