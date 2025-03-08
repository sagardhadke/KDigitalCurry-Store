import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_listing_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  final ProductListingController _controller =
      Get.find<ProductListingController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Filter",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(icon: Icon(Icons.close), onPressed: () => Get.back()),
            ],
          ),
          
          Obx(() => Column(
                children: _controller.availableCategories
                    .map((category) => CheckboxListTile(
                          title: Text(category),
                          value:
                              _controller.selectedCategories.contains(category),
                          onChanged: (bool? value) {
                            value!
                                ? _controller.selectedCategories.add(category)
                                : _controller.selectedCategories
                                    .remove(category);
                          },
                        ))
                    .toList(),
              )),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _controller.selectedPrices.clear();
                    _controller.selectedCategories.clear();
                  },
                  child: Text("Reset"),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => Get.back(),
                  child: Text("Apply Filter",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
