import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/utils/constants/app_colors.dart';
import '../controllers/product_details_controller.dart';
import '../widgets/ProductInfoSection.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Product Details'),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isGet.value
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        placeholder: (context, url) => Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) {
                          return Image.asset(
                            height: 200.h,
                            "assets/images/placeholder.png",
                            fit: BoxFit.cover,
                          );
                        },
                        imageUrl: controller.getDetails.image ?? '',
                        height: 350.h,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        controller.getDetails.title ?? '',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(controller.getDetails.description ?? ''),
                      SizedBox(height: 10),
                      Text(
                        "₹${controller.getDetails.price}",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: MyAppColors.textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.local_offer),
                          Text(
                            "Save 30% Right Now",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF5A5A5A)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(
                                color: Colors.black, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyAppColors.primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.favorite_border),
                          Text(
                            "Add To Wishlist",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ProductInfoSection(),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
