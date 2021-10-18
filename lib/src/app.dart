import 'package:flutter_postman_application/src/pages/authentication/authentication_page.dart';
import 'package:flutter_postman_application/src/pages/cart/cart_page.dart';
import 'package:flutter_postman_application/src/pages/home/home_page.dart';
import 'package:flutter_postman_application/src/pages/navigation/navigation.dart';
import 'package:flutter_postman_application/src/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
    Provider.of<UserProvider>(context, listen: false).checkLogined();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<UserProvider>(context).user != null
        ? Navigation()
        : AuthenticationPages();
  }
}
