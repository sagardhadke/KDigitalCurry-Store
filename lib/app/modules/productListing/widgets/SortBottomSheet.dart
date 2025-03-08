import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_listing_controller.dart';

class SortBottomSheet extends StatelessWidget {
  final ProductListingController _productListingController = Get.find<ProductListingController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sort By", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(icon: Icon(Icons.close), onPressed: () => Get.back()),
            ],
          ),
          Divider(),

          Obx(() => Column(
                children: [
                  RadioListTile<String>(
                    title: Text("Price: Low to High"),
                    value: "Low to High",
                    groupValue: _productListingController.selectedSortOption.value,
                    onChanged: (value) {
                      _productListingController.selectedSortOption.value = value!;
                      Get.back();
                    },
                  ),
                  RadioListTile<String>(
                    title: Text("Price: High to Low"),
                    value: "High to Low",
                    groupValue: _productListingController.selectedSortOption.value,
                    onChanged: (value) {
                      _productListingController.selectedSortOption.value = value!;
                      Get.back();
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
