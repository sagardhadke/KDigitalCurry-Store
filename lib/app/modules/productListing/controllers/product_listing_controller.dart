import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/model/allProductsModel.dart';
import 'package:kdigital_curry_ecom/app/utils/constants/api_constants.dart';

import '../widgets/FilterBottomSheet.dart';
import '../widgets/SortBottomSheet.dart';

class ProductListingController extends GetxController {
  RxBool isAllProductsLoading = false.obs;
  final dio = Dio();
  List<AllProductsModel>? allProductsModel = [];

  // Filters
  RxList<String> selectedCategories = <String>[].obs;
  RxList<String> availableCategories = <String>[].obs;
  RxList<double> selectedPrices = <double>[].obs;
  RxString selectedSortOption = ''.obs;

  @override
  void onInit() {
    super.onInit();
    allProductsApi();
  }

  Future<void> allProductsApi() async {
    try {
      isAllProductsLoading.value = true;
      final allProductsRes = await dio.get(ApiConstants.allProducts);
      if (allProductsRes.statusCode == 200) {
        allProductsModel = (allProductsRes.data as List)
            .map((e) => AllProductsModel.fromJson(e))
            .toList();
        print("All Products api Res ${allProductsRes.data}");

        availableCategories.value = allProductsModel!
            .map((product) => product.category!)
            .toSet()
            .toList();
      } else {
        print("All Products status code ${allProductsRes.statusCode}");
      }
    } catch (e) {
      print("All Products API error $e");
    } finally {
      isAllProductsLoading.value = false;
    }
  }

  List<AllProductsModel> get filteredProducts {
    List<AllProductsModel> products = allProductsModel!.where((product) {
      bool matchesCategory = selectedCategories.isEmpty ||
          selectedCategories.contains(product.category);
      return matchesCategory;
    }).toList();

    // Apply sorting
    if (selectedSortOption.value == "Low to High") {
      products.sort((a, b) => a.price!.compareTo(b.price!));
    } else if (selectedSortOption.value == "High to Low") {
      products.sort((a, b) => b.price!.compareTo(a.price!));
    }

    return products;
  }

  void openFilterBottomSheet() {
    Get.bottomSheet(
      FilterBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.white,
    );
  }

  void openSortBottomSheet() {
    Get.bottomSheet(
      SortBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.white,
    );
  }
}
