import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxString appLogo = 'assets/icons/kDigitalCurryLogo.png'.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    if (_auth.currentUser != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
