import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisible = false.obs;
  RxBool rememberMe = false.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  RxBool isUserLogging = false.obs;

  bool isLoginFormClicked = true;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  Future<void> login() async {
    isLoginFormClicked = true;
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    isUserLogging.value = true;
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    String? error = await FirebaseService().loginUser(username, password);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userName", username);
    isUserLogging.value = false;
    if (error == null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar("Login Failed", error,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
