import 'package:flutter_postman_application/src/pages/navigation/navigation.dart';
import 'package:flutter_postman_application/src/pages/products/create_product_screen.dart';
import 'package:flutter_postman_application/src/pages/products/product_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_postman_application/src/pages/home/home_page.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CreateProductPage();
  }
}
