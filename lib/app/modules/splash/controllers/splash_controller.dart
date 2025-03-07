import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/routes/app_pages.dart';

class SplashController extends GetxController {

  RxString appLogo = 'assets/icons/kDigitalCurryLogo.png'.obs;


  @override
  void onInit() {
    super.onInit();
    mySplashDelay();
  }

  Future mySplashDelay() async {
    await Future.delayed(
      Duration(seconds: 2),
      () {
        Get.offAllNamed(Routes.LOGIN);
      },
    );
  }
}
