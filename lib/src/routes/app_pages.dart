import 'package:freshfood/src/app.dart';
import 'package:freshfood/src/pages/Admin/admin_vnpay_page.dart';
import 'package:freshfood/src/pages/Admin/edit_product_page.dart';
import 'package:freshfood/src/pages/address/address_page.dart';
import 'package:freshfood/src/pages/address/edit_address_page.dart';
import 'package:freshfood/src/pages/address/update_address_page.dart';
import 'package:freshfood/src/pages/address/update_address_page_detail.dart';
import 'package:freshfood/src/pages/authentication/authentication_page.dart';
import 'package:freshfood/src/pages/authentication/change_password_with_otp_page.dart';
import 'package:freshfood/src/pages/authentication/otp_password_page.dart';
import 'package:freshfood/src/pages/authentication/pages/login_page.dart';
import 'package:freshfood/src/pages/cart/cart_page.dart';
import 'package:freshfood/src/pages/chat/chat_detail_pager.dart';
import 'package:freshfood/src/pages/chat/chat_page.dart';
import 'package:freshfood/src/pages/eveluate/eveluate_page.dart';
import 'package:freshfood/src/pages/eveluate/eveluate_product_page.dart';
import 'package:freshfood/src/pages/home/home_page.dart';
import 'package:freshfood/src/pages/order/order_detail_page.dart';
import 'package:freshfood/src/pages/order/order_history_page.dart';
import 'package:freshfood/src/pages/order/order_page.dart';
import 'package:freshfood/src/pages/payment/payment_detail.dart';
import 'package:freshfood/src/pages/payment/payment_page.dart';
import 'package:freshfood/src/pages/payment/payment_web_page.dart';
import 'package:freshfood/src/pages/products/create_product_screen.dart';
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
      name: Routes.DETAIL_PAYMENT,
      page: () => PaymentDetailPage(
        list: Get.arguments['list'],
      ),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.OTP,
      page: () => OtpPassPage(email: Get.arguments['email']),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.ADDRESS,
      page: () => AddressPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.ADD_ADDRESS,
      page: () => EditAddressPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.UPDATE_ADDRESS,
      page: () => UpdateAddressPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.METHOD_PAYMENT,
      page: () => PaymentPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.UPDATE_ADDRESS_PAGE_DETAIL,
      page: () => UpdateAddressPageDetail(address: Get.arguments['address']),
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
    GetPage(
      name: Routes.PAYMENT_WEB_PAGE,
      page: () => PaymentWebPage(
        link: Get.arguments['link'],
      ),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.EVELUATE_DETAIL,
      page: () => EveluateProductPage(productId: Get.arguments['productId']),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.DETAIL_ORDER,
      page: () => OrderDetailPage(
        order: Get.arguments['order'],
      ),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.HISTORY_ORDER,
      page: () => OrderHistoryPage(
        history: Get.arguments['history'],
      ),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.UPDATE_PRODUCT,
      page: () =>
          EditProductPage(productCurrent: Get.arguments['productCurrent']),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.CREATE_PRODUCT,
      page: () => CreateProductPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.EVELUATE_PRODUCT,
      page: () => EveluatePage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
    GetPage(
      name: Routes.ADMIN_VNPAY_PAGE,
      page: () => AdminVnPayWebPage(
        method: Get.arguments['method'],
      ),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 100),
      children: [],
    ),
  ];
}
