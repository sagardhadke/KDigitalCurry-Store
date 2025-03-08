import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/modules/productWishList/controllers/product_wish_list_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProductWishListController>(
      () => ProductWishListController(),
    );
  }
}
