import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/modules/productWishList/controllers/product_wish_list_controller.dart';

class MyProducts extends StatelessWidget {
  final int index;
  final String name;
  final String image;
  final String description;
  final double price;
  final double oldPrice;
  final double discount;
  const MyProducts({
    super.key,
    required this.index,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    final ProductWishListController _wishListController =
        Get.find<ProductWishListController>();
    return Card(
      elevation: 0,
      color: Colors.grey[100],
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) {
                      return Image.asset(
                        "assets/images/placeholder.png",
                        fit: BoxFit.cover,
                      );
                    },
                    imageUrl: image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Obx(() => IconButton(
                      icon: Icon(
                        _wishListController.isWishlisted(index)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: _wishListController.isWishlisted(index)
                            ? Colors.red
                            : Colors.grey,
                      ),
                      onPressed: () {
                        _wishListController.toggleWishlist(index);
                      },
                    )),
              )
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      "₹$price",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "₹$oldPrice",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "(${discount.toInt()}% OFF)",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
