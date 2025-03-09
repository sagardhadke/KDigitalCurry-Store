import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/modules/productDetails/controllers/product_details_controller.dart';
import 'package:kdigital_curry_ecom/app/modules/productDetails/views/pay_done_view.dart';

class AddToCartProduct extends StatefulWidget {
  const AddToCartProduct({super.key});

  @override
  State<AddToCartProduct> createState() => _AddToCartProductState();
}

class _AddToCartProductState extends State<AddToCartProduct> {
  final ProductDetailsController _controller =
      Get.find<ProductDetailsController>();

  @override
  void initState() {
    _controller.allProductsApi();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Cart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Obx(() {
                  if (_controller.isAddToCartLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (_controller.filteredProducts.isEmpty) {
                    return Center(child: Text("No items in your cart"));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _controller.filteredProducts.length,
                    itemBuilder: (context, index) {
                      var product = _controller.filteredProducts[index];

                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  product.image ?? '',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.image_not_supported);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          product.title ?? 'Product',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _controller
                                              .removeFromCart(product.id!);
                                        },
                                        child: Icon(Icons.delete_outline,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text('Qty'),
                                      SizedBox(width: 8),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey[300]!),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Obx(() {
                                          return DropdownButton<int>(
                                            value:
                                                _controller.productQuantities[
                                                        product.id] ??
                                                    1,
                                            onChanged: (newValue) {
                                              if (newValue != null) {
                                                _controller.updateQuantity(
                                                    product.id!, newValue);
                                              }
                                            },
                                            items: List.generate(
                                                    5, (index) => index + 1)
                                                .map((int value) {
                                              return DropdownMenuItem<int>(
                                                value: value,
                                                child: Text(value.toString()),
                                              );
                                            }).toList(),
                                          );
                                        }),
                                      ),
                                      SizedBox(width: 16),
                                      Text('Size'),
                                      SizedBox(width: 8),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey[300]!),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Obx(() {
                                          return DropdownButton<String>(
                                            value: _controller
                                                    .selectedSize[product.id] ??
                                                'M',
                                            underline: SizedBox(),
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            items: ['S', 'M', 'L', 'XL', 'XXL']
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              if (newValue != null) {
                                                _controller.updateSize(
                                                    product.id!, newValue);
                                              }
                                            },
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'In stock',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Obx(() => Text(
                                                '₹${(product.price ?? 0) * (_controller.productQuantities[product.id] ?? 1)}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              )),
                                          SizedBox(width: 8),
                                          Obx(() => Text(
                                                '₹${((product.price ?? 0) + 358) * (_controller.productQuantities[product.id] ?? 1)}',
                                                style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              )),
                                          SizedBox(width: 8),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: Colors.green[50],
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Text(
                                              '10% OFF',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      child: Row(
                                        children: [
                                          Icon(Icons.favorite_border, size: 16),
                                          SizedBox(width: 4),
                                          Text(
                                            'Save To Wishlist',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
                SizedBox(height: 16),
                Text('Have a promocode'),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextField(
                          controller: _controller.couponCode,
                          onTapOutside: (event) {
                            if (FocusManager.instance.primaryFocus != null) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Coupon Code',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        _controller.applyCoupon(
                            _controller.couponCode.text.toUpperCase().trim());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text('Apply'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text('Applicable Coupons'),
                SizedBox(height: 8),
                Column(
                  children: [
                    _buildCouponTile(
                      'DISCOUNT10',
                      'Save ₹10 on your purchase.',
                    ),
                    _buildCouponTile(
                      'SAVE20',
                      '20% off on premium shirts',
                    ),
                    _buildCouponTile(
                      'SAGAR50',
                      'Enjoy 50% off this season',
                    ),
                    SizedBox(height: 16),
                    Obx(() => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order Total Summary',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total'),
                                  Text(
                                    '₹${_controller.totalPrice.value.toStringAsFixed(2)}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Discount'),
                                  Text(
                                    '-₹${_controller.discount.value.toStringAsFixed(2)}', // ✅ Make it reactive
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Coupon Code'),
                                  Text(
                                    _controller.appliedCoupon.value.isNotEmpty
                                        ? '-₹${_controller.discount.value.toStringAsFixed(2)}' // ✅ Ensure discount updates
                                        : '-₹0.00',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Delivery Fee'),
                                  Text(
                                      '₹${_controller.deliveryFee.toStringAsFixed(2)}'),
                                ],
                              ),
                              SizedBox(height: 16),
                              Divider(),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order Total',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '₹${(_controller.totalPrice.value).toStringAsFixed(2)}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => PayDone()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text('Proceed to Pay'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCouponTile(String code, String description,
      {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Radio(
            value: code,
            groupValue: isSelected ? code : '',
            onChanged: (_) {},
            activeColor: Colors.red,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
