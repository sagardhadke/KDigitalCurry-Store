import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/productDetails/bindings/product_details_binding.dart';
import '../modules/productDetails/views/add_to_cart_view.dart';
import '../modules/productDetails/views/product_details_view.dart';
import '../modules/productListing/bindings/product_listing_binding.dart';
import '../modules/productListing/views/product_listing_view.dart';
import '../modules/productWishList/bindings/product_wish_list_binding.dart';
import '../modules/productWishList/views/product_wish_list_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LISTING,
      page: () => const ProductListingView(),
      binding: ProductListingBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TO_CART,
      page: () => AddToCartProduct(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_WISH_LIST,
      page: () => const ProductWishListView(),
      binding: ProductWishListBinding(),
    ),
    
  ];
}
