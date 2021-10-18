import 'package:flutter_postman_application/src/app.dart';
import 'package:flutter_postman_application/src/pages/authentication/authentication_page.dart';
import 'package:flutter_postman_application/src/pages/cart/cart_page.dart';
import 'package:flutter_postman_application/src/pages/home/home_page.dart';
import 'package:flutter_postman_application/src/pages/products/detail_product_screen.dart';
import 'package:flutter_postman_application/src/pages/products/product_screen.dart';
import 'package:flutter_postman_application/src/pages/profile/profile_page.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => App(),
      children: [],
    ),
    GetPage(
      name: Routes.AUTHENTICATION,
      page: () => AuthenticationPages(
        title: Get.arguments['title'],
        tuNghia: Get.arguments['tuNghiaaaa'],
      ),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePages(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.DETAIL_PRODUCT,
      page: () => DetailProductPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.CART,
      page: () => CartPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
  ];
}
