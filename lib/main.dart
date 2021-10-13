import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_postman_application/src/app.dart';
import 'package:flutter_postman_application/src/lang/translation_service.dart';
import 'package:flutter_postman_application/src/pages/authentication/pages/login_page.dart';
import 'package:flutter_postman_application/src/pages/products/create_product_screen.dart';
import 'package:flutter_postman_application/src/pages/products/detail_product_screen.dart';
import 'package:flutter_postman_application/src/pages/profile/profile_page.dart';
import 'package:flutter_postman_application/src/routes/app_pages.dart';
import 'package:flutter_postman_application/src/shared/logger/logger_utils.dart';
import 'package:flutter_postman_application/src/theme/theme_service.dart';
import 'package:flutter_postman_application/src/theme/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await GetStorage.init();
  runApp(Sizer(builder: (context, orientation, builder) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      // initialRoute: AppPages.INITIAL,
      home: App(),
      getPages: AppPages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }));
}
