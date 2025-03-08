import 'package:get/get.dart';

import '../../productWishList/controllers/product_wish_list_controller.dart';
import '../controllers/product_listing_controller.dart';

class ProductListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListingController>(
      () => ProductListingController(),
    );
    Get.lazyPut<ProductWishListController>(
      () => ProductWishListController(),
    );
  }
}
