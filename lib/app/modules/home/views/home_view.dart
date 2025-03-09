import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kdigital_curry_ecom/app/modules/home/views/CategoryCard.dart';
import 'package:kdigital_curry_ecom/app/modules/home/views/productCard.dart';
import 'package:kdigital_curry_ecom/app/utils/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text('HomeView'),
        actions: [
          Icon(
            Icons.person_outline_sharp,
            color: Colors.black,
          ),
          SizedBox(
            width: 12.w,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 15.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onTapOutside: (event) {
                  if (FocusManager.instance.primaryFocus != null) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: MyAppColors.textColor))),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 350.h,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.bannerImages.length,
                onPageChanged: (int index) {
                  controller.currentPage.value = index;
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    controller.bannerImages[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => SmoothPageIndicator(
                    controller: controller.pageController,
                    count: controller.bannerImages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: MyAppColors.primaryColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                "Shop By Brands",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemCount: controller.brandsImages.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  controller.brandsImages[index],
                  fit: BoxFit.cover,
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "View All",
                style: TextStyle(fontSize: 15.sp, color: MyAppColors.textColor),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Browse Category",
                style: TextStyle(fontSize: 15.sp, color: MyAppColors.textColor),
              ),
            ),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.categoryImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => Get.toNamed(Routes.PRODUCT_LISTING),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Image.asset(
                        controller.categoryImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 250.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.offersSalesImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Image.asset(
                      controller.offersSalesImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Shop By Category",
                style: TextStyle(fontSize: 15.sp, color: MyAppColors.textColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: controller.shoByCategoryImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryCard(
                    title: controller.shoByCategoryImages[index]
                        ['categoryName'],
                    imagePath: controller.shoByCategoryImages[index]
                        ['categoryImg'],
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Color(0XFFCECECE),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Men’s Cloth Collection",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: MyAppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Color(0XFFCECECE),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.mensClothCollection.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: ProductCard(
                      title: controller.mensClothCollection[index]['title'],
                      imagePath: controller.mensClothCollection[index]['image'],
                      price: controller.mensClothCollection[index]['price'],
                      oldPrice: controller.mensClothCollection[index]
                          ['oldPrice'],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Color(0XFFCECECE),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Women’s Cloth Collection",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: MyAppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Color(0XFFCECECE),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.woMensClothCollection.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: ProductCard(
                      title: controller.woMensClothCollection[index]['title'],
                      imagePath: controller.woMensClothCollection[index]
                          ['image'],
                      price: controller.woMensClothCollection[index]['price'],
                      oldPrice: controller.woMensClothCollection[index]
                          ['oldPrice'],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Color(0XFFCECECE),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Flash Sale",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: MyAppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Color(0XFFCECECE),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.flashSalesImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Image.asset(
                      controller.flashSalesImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.faqs.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ExpansionTile(
                        title: Text(
                          controller.faqs[index]["question"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        iconColor: Colors.black,
                        collapsedIconColor: Colors.black,
                        children: controller.faqs[index]["answer"]!.isNotEmpty
                            ? [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    controller.faqs[index]["answer"]!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          Colors.black.withValues(alpha: 0.6),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ]
                            : [],
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.black.withValues(alpha: 0.1),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 200.h,
              width: double.infinity,
              color: MyAppColors.primaryColor,
              child: Center(
                child: Image.asset(
                  height: 125.h,
                  "assets/icons/kDigitalCurryLogo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
