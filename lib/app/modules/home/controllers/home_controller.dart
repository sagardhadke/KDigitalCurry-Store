import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  final TextEditingController searchProducts = TextEditingController();

  //banner Images
  final RxList<String> bannerImages = [
    'assets/images/banner/banner.png',
    'assets/images/banner/banner2.jpg',
    'assets/images/banner/banner3.jpg',
    'assets/images/banner/banner4.jpg',
  ].obs;

  //brand Images
  final List<String> brandsImages = [
    'assets/images/brands/brand1.png',
    'assets/images/brands/brand2.png',
    'assets/images/brands/brand3.png',
    'assets/images/brands/brand4.png',
    'assets/images/brands/brand5.png',
    'assets/images/brands/brand6.png',
  ];

  // category Images
  final List<String> categoryImages = [
    'assets/images/category/category1.png',
    'assets/images/category/category2.png',
    'assets/images/category/category3.png',
  ];

  // category Images
  final List<Map<String, dynamic>> shoByCategoryImages = [
    {
      "categoryName": "Watches",
      "categoryImg": "assets/images/shop_by_category/watches.png",
    },
    {
      "categoryName": "Shoes",
      "categoryImg": "assets/images/shop_by_category/shoes.png",
    },
    {
      "categoryName": "Heels",
      "categoryImg": "assets/images/shop_by_category/heels.png",
    },
    {
      "categoryName": "Beauty & Make Up",
      "categoryImg": "assets/images/shop_by_category/beautyAndMakeup.png",
    },
    {
      "categoryName": "Jewellery",
      "categoryImg": "assets/images/shop_by_category/Jewellery.png",
    },
    {
      "categoryName": "Bags & Bag Packs",
      "categoryImg": "assets/images/shop_by_category/bagAndBagPack.png",
    },
    {
      "categoryName": "Sunglasses",
      "categoryImg": "assets/images/shop_by_category/sunglasses.png",
    },
    {
      "categoryName": "Perfume",
      "categoryImg": "assets/images/shop_by_category/perfume.png",
    },
  ];

  final List<Map<String, dynamic>> mensClothCollection = [
    {
      'title': 'Plaid Shirt',
      'image': 'assets/images/mens_cloth_collection/man1.png',
      'price': 499,
      'oldPrice': 650,
    },
    {
      'title': 'Denim Jacket',
      'image': 'assets/images/mens_cloth_collection/man2.png',
      'price': 799,
      'oldPrice': 950,
    },
    {
      'title': 'Graphic Tee',
      'image': 'assets/images/mens_cloth_collection/man4.png',
      'price': 399,
      'oldPrice': 500,
    },
    {
      'title': 'Chino Pants',
      'image': 'assets/images/mens_cloth_collection/man5.png',
      'price': 450,
      'oldPrice': 600,
    },
    {
      'title': 'Leather Jacket',
      'image': 'assets/images/mens_cloth_collection/man6.png',
      'price': 1199,
      'oldPrice': 1400,
    },
    {
      'title': 'Hoodie',
      'image': 'assets/images/mens_cloth_collection/man7.png',
      'price': 599,
      'oldPrice': 750,
    },
    {
      'title': 'Shorts',
      'image': 'assets/images/mens_cloth_collection/man8.png',
      'price': 299,
      'oldPrice': 400,
    },
  ];

  final List<Map<String, dynamic>> woMensClothCollection = [
    {
      'title': 'Floral Blouse',
      'image': 'assets/images/women_cloth_collection/womencoll1.png',
      'price': 499,
      'oldPrice': 650,
    },
    {
      'title': 'Striped Dress',
      'image': 'assets/images/women_cloth_collection/womencoll2.png',
      'price': 749,
      'oldPrice': 890,
    },
    {
      'title': 'Denim Jacket',
      'image': 'assets/images/women_cloth_collection/womencoll3.png',
      'price': 899,
      'oldPrice': 1050,
    },
    {
      'title': 'Silk Scarf',
      'image': 'assets/images/women_cloth_collection/womencoll4.png',
      'price': 299,
      'oldPrice': 400,
    },
    {
      'title': 'Leather Pants',
      'image': 'assets/images/women_cloth_collection/womencoll5.png',
      'price': 1299,
      'oldPrice': 1500,
    },
    {
      'title': 'Lace Top',
      'image': 'assets/images/women_cloth_collection/womencoll6.png',
      'price': 599,
      'oldPrice': 750,
    },
  ];

  // flash sales Images
  final List<String> flashSalesImages = [
    'assets/images/flash_sale/flash1.png',
    'assets/images/flash_sale/flash2.png',
    'assets/images/flash_sale/flash3.png',
    'assets/images/flash_sale/flash4.png',
    'assets/images/flash_sale/flash5.png',
  ];

  // faq
  final List<Map<String, String>> faqs = [
    {
      "question": "How can I place an order?",
      "answer":
          "Yes, you can try us for free for 30 days. We also offer a free 30-minute onboarding call."
    },
    {
      "question": "Is COD (Cash on Delivery) available?",
      "answer": "Yes, COD is available for select locations."
    },
    {
      "question": "What is your cancellation policy?",
      "answer": "Orders can be canceled within 24 hours before shipment."
    },
    {
      "question": "What is your return policy?",
      "answer":
          "Returns are accepted within 7 days of delivery if the item is unused."
    },
    {
      "question": "Do You Offer International Shipping?",
      "answer":
          "Yes, we ship to multiple countries with standard and express options."
    },
  ];

  // flash sales Images
  final List<String> offersSalesImages = [
    'assets/images/offers_sales/offersales1.png',
    'assets/images/offers_sales/offersales2.png',
    'assets/images/offers_sales/offersales3.png',
    'assets/images/offers_sales/offersales4.png',
    'assets/images/offers_sales/offersales5.png',
    'assets/images/offers_sales/offersales6.png',
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
