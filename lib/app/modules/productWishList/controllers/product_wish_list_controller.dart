import 'package:get/get.dart';

class ProductWishListController extends GetxController {
  RxList<int> wishlistIndexes = <int>[].obs;

  bool isWishlisted(int index) {
    return wishlistIndexes.contains(index);
  }

  void toggleWishlist(int index) {
    if (isWishlisted(index)) {
      wishlistIndexes.remove(index);
    } else {
      wishlistIndexes.add(index);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
