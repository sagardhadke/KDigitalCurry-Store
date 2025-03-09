import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/modules/productDetails/controllers/product_details_controller.dart';

import '../../productWishList/controllers/product_wish_list_controller.dart';
import '../controllers/product_listing_controller.dart';

class ProductListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListingController>(
      () => ProductListingController(),
    );
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(),
    );
    Get.lazyPut<ProductWishListController>(
      () => ProductWishListController(),
    );
  }
}
