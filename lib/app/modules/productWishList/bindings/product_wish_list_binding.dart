import 'package:get/get.dart';

import '../controllers/product_wish_list_controller.dart';

class ProductWishListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductWishListController>(
      () => ProductWishListController(),
    );
  }
}
