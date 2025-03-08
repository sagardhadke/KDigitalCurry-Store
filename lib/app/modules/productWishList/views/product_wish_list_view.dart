import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/modules/productListing/controllers/product_listing_controller.dart';
import 'package:kdigital_curry_ecom/app/modules/productListing/widgets/product.dart';
import '../controllers/product_wish_list_controller.dart';

class ProductWishListView extends GetView<ProductWishListController> {
  const ProductWishListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductListingController productController =
        Get.find<ProductListingController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        centerTitle: true,
        
      ),
      body: Obx(() {
        if (controller.wishlistIndexes.isEmpty) {
          return const Center(
            child: Text("No items in wishlist",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: controller.wishlistIndexes.length,
            itemBuilder: (context, index) {
              final productIndex = controller.wishlistIndexes[index];
              final product = productController.allProductsModel![productIndex];

              return MyProducts(
                index: productIndex,
                name: product.title!,
                image: product.image!,
                description: product.description!,
                price: product.price!,
                oldPrice: product.price! + 350,
                discount: 30,
              );
            },
          ),
        );
      }),
    );
  }
}
