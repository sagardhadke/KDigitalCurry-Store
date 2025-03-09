import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/modules/productListing/widgets/product.dart';
import 'package:kdigital_curry_ecom/app/routes/app_pages.dart';

import '../controllers/product_listing_controller.dart';

class ProductListingView extends GetView<ProductListingController> {
  const ProductListingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Product Listing'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite_border,
              ),
              onPressed: () {
                Get.toNamed(Routes.ADD_TO_CART);
              },
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Obx(
              () => controller.isAllProductsLoading.value
                  ? Center(
                      child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.black),
                    )
                  : controller.filteredProducts.isEmpty
                      ? Center(
                          child: Text("No Products Founds"),
                        )
                      : Column(
                          children: [
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Flexible(
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () =>
                                        controller.openSortBottomSheet(),
                                    icon: Icon(Icons.sort, color: Colors.white),
                                    label: Text("Sort By",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Flexible(
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () =>
                                        controller.openFilterBottomSheet(),
                                    icon: Icon(Icons.filter_list,
                                        color: Colors.white),
                                    label: Text("Filter",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  mainAxisExtent: 290.h,
                                ),
                                itemCount: controller.filteredProducts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.PRODUCT_DETAILS,
                                          arguments: controller
                                              .filteredProducts[index]);
                                    },
                                    child: MyProducts(
                                        index: index,
                                        name: controller.filteredProducts[index]
                                                .title ??
                                            '',
                                        image: controller
                                                .filteredProducts[index]
                                                .image ??
                                            '',
                                        description: controller
                                                .filteredProducts[index]
                                                .description ??
                                            '',
                                        price: controller
                                                .filteredProducts[index]
                                                .price ??
                                            0,
                                        oldPrice: controller
                                                .filteredProducts[index]
                                                .price! +
                                            350,
                                        discount: 30),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
            ),
          ),
        ));
  }
}
