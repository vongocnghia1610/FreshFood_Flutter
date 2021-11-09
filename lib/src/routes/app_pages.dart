import 'package:freshfood/src/app.dart';
import 'package:freshfood/src/pages/authentication/authentication_page.dart';
import 'package:freshfood/src/pages/authentication/change_password_with_otp_page.dart';
import 'package:freshfood/src/pages/authentication/otp_password_page.dart';
import 'package:freshfood/src/pages/authentication/pages/login_page.dart';
import 'package:freshfood/src/pages/cart/cart_page.dart';
import 'package:freshfood/src/pages/chat/chat_detail_pager.dart';
import 'package:freshfood/src/pages/chat/chat_page.dart';
import 'package:freshfood/src/pages/home/home_page.dart';
import 'package:freshfood/src/pages/order/order_page.dart';
import 'package:freshfood/src/pages/products/detail_product_screen.dart';
import 'package:freshfood/src/pages/products/product_screen.dart';
import 'package:freshfood/src/pages/profile/profile_page.dart';
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
      name: Routes.LOGIN,
      page: () => LoginPages(),
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
      page: () => ProfilePages(
        user: Get.arguments['user'],
      ),
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
      page: () => DetailProductPage(
        id: Get.arguments['id'],
      ),
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
    GetPage(
      name: Routes.ORDER,
      page: () => OrderPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => ChatPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.OTP,
      page: () => OtpPassPage(
        email: Get.arguments['email'],
      ),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.CHANGEPASSWORDWITHOTP,
      page: () => ChangePasswordWithOtp(
        token: Get.arguments['token'],
      ),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
  ];
}
