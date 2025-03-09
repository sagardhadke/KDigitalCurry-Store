import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/allProductsModel.dart';
import '../../../utils/constants/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsController extends GetxController {
  AllProductsModel? getDetails;
  RxBool isGet = false.obs;

  RxList<int> productsId = <int>[].obs;
  RxBool isAddToCartLoading = false.obs;
  final dio = Dio();

  List<AllProductsModel>? allProductsModel;
  RxList<AllProductsModel> filteredProducts = <AllProductsModel>[].obs;
  TextEditingController couponCode = TextEditingController();

  RxMap<int, int> productQuantities = <int, int>{}.obs;
  RxDouble totalPrice = 0.0.obs;
  double deliveryFee = 45.0;
  RxString appliedCoupon = ''.obs;
  RxDouble discount = 0.0.obs;

  RxMap<int, String> selectedSize = <int, String>{}.obs;

  Future<void> allProductsApi() async {
    try {
      isAddToCartLoading.value = true;
      final allProductsRes = await dio.get(ApiConstants.allProducts);
      if (allProductsRes.statusCode == 200) {
        allProductsModel = (allProductsRes.data as List)
            .map((e) => AllProductsModel.fromJson(e))
            .toList();
        filterProducts();
      } else {
        print("All Products status code ${allProductsRes.statusCode}");
      }
    } catch (e) {
      print("All Products API error $e");
    } finally {
      isAddToCartLoading.value = false;
    }
  }

  void filterProducts() {
    if (allProductsModel == null || allProductsModel!.isEmpty) {
      print("No products found in API response.");
      return;
    }

    print("All Product IDs: ${allProductsModel!.map((e) => e.id)}");
    print("Filter Product IDs: $productsId");

    filteredProducts.value = allProductsModel!
        .where((product) => productsId.contains(product.id))
        .toList();

    for (var product in filteredProducts) {
      productQuantities[product.id!] ??= 1;
    }

    calculateTotalPrice();

    print("Filtered Product IDs: ${filteredProducts.map((e) => e.id)}");
    print(
        "Filtered Product Titles: ${filteredProducts.map((e) => e.title)} | ");
  }

  Future<void> saveCartData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'cartItems', productsId.map((e) => e.toString()).toList());
  }

  Future<void> loadCartData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? storedCart = prefs.getStringList('cartItems');
    if (storedCart != null) {
      productsId.value = storedCart.map((e) => int.parse(e)).toList();
    }
    allProductsApi();
  }

  void updateSize(int productId, String newSize) {
    selectedSize[productId] = newSize;
  }

  void updateQuantity(int productId, int newQuantity) {
    if (productQuantities.containsKey(productId)) {
      productQuantities[productId] = newQuantity;
      calculateTotalPrice();
    }
  }

  void removeFromCart(int productId) async {
    productsId.remove(productId);
    filteredProducts.removeWhere((product) => product.id == productId);
    productQuantities.remove(productId);
    calculateTotalPrice();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'cartItems', productsId.map((e) => e.toString()).toList());
  }

  void calculateTotalPrice() {
    double total = 0.0;
    for (var product in filteredProducts) {
      total += (product.price ?? 0) * (productQuantities[product.id] ?? 1);
    }

    totalPrice.value = total + deliveryFee - discount.value;
  }

  void applyCoupon(String couponCode) {
    appliedCoupon.value = couponCode;
    if (couponCode == "DISCOUNT10") {
      discount.value = 10.0;
    } else if (couponCode == "SAVE20") {
      discount.value = 20.0;
    } else if (couponCode == "SAGAR50") {
      discount.value = 50.0;
    } else {
      discount.value = 0.0;
    }
    calculateTotalPrice();
  }

  @override
  void onInit() {
    super.onInit();
    loadCartData();
    if (Get.arguments != null && Get.arguments is AllProductsModel) {
      getDetails = Get.arguments as AllProductsModel;
      print("Product Details: ${getDetails?.title}");
      isGet.value = false;
    } else {
      print("Error: Product details not found!");
    }
    ever(productsId, (_) => saveCartData());
  }
}
