import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_postman_application/src/app.dart';
import 'package:flutter_postman_application/src/lang/translation_service.dart';
import 'package:flutter_postman_application/src/pages/Admin/manager_user.dart';
import 'package:flutter_postman_application/src/pages/address/address_page.dart';
import 'package:flutter_postman_application/src/pages/address/edit_address_page.dart';
import 'package:flutter_postman_application/src/pages/eveluate/eveluate_page.dart';
import 'package:flutter_postman_application/src/pages/order/order_detail_page.dart';
import 'package:flutter_postman_application/src/pages/order/order_history_page.dart';
import 'package:flutter_postman_application/src/pages/order/order_page.dart';
import 'package:flutter_postman_application/src/pages/payment/payment_detail.dart';
import 'package:flutter_postman_application/src/pages/payment/payment_error.dart';
import 'package:flutter_postman_application/src/pages/payment/payment_page.dart';
import 'package:flutter_postman_application/src/pages/payment/payment_success.dart';
import 'package:flutter_postman_application/src/pages/products/create_product_screen.dart';
import 'package:flutter_postman_application/src/providers/user_provider.dart';
import 'package:flutter_postman_application/src/routes/app_pages.dart';
import 'package:flutter_postman_application/src/shared/logger/logger_utils.dart';
import 'package:flutter_postman_application/src/theme/theme_service.dart';
import 'package:flutter_postman_application/src/theme/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvider>(
        create: (context) => userProvider,
      ),
      // ChangeNotifierProvider<AddressProvider>(
      //   create: (context) => addressProvider,
      // ),
      // ChangeNotifierProvider<ChatProvider>(
      //   create: (context) => chatProvider,
      // ),
      // ChangeNotifierProvider<QuantityProvider>(
      //   create: (context) => quantityProvider,
      // ),
      // ChangeNotifierProvider<InfoUserProvider>(
      //   create: (context) => infoUserProvider,
      // ),
    ],
    child: Sizer(builder: (context, orientation, builder) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        logWriterCallback: Logger.write,
        // initialRoute: AppPages.INITIAL,
        home: App(),
        getPages: AppPages.routes,
        // initialRoute: AppPages.INITIAL,
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: ThemeService().getThemeMode(),
      );
    }),
  ));
}
