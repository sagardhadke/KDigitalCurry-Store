import 'package:get/get.dart';

import '../../../model/allProductsModel.dart';

class ProductDetailsController extends GetxController {
  late AllProductsModel getDetails;
  RxBool isGet = true.obs;

  @override
  void onInit() {
    super.onInit();
    getDetails = Get.arguments as AllProductsModel;
    print("My Product Details: ${getDetails.title}");
    isGet.value = false;
  }
}
