import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/pages/cart/cart_page.dart';
import 'package:flutter_postman_application/src/pages/chat/chat_page.dart';
import 'package:flutter_postman_application/src/pages/home/home_page.dart';
import 'package:flutter_postman_application/src/pages/option/option_page.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:sizer/sizer.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var pages = [
    HomePage(),
    CartPage(),
    ChatPage(),
    OptionPage(),
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: kDefaultPadding * 2,
          right: kDefaultPadding * 2,
        ),
        height: 60,
        decoration: selected != 1
            ? BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: Offset(0, -10),
                  blurRadius: 35,
                  color: kPrimaryColor.withOpacity(0.38),
                )
              ])
            : BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavigationItem(
              PhosphorIcons.storefront_fill,
              PhosphorIcons.storefront,
              0,
            ),
            _buildNavigationItem(
              PhosphorIcons.shopping_cart_fill,
              PhosphorIcons.shopping_cart,
              1,
            ),
            _buildNavigationItem(
              PhosphorIcons.messenger_logo_fill,
              PhosphorIcons.messenger_logo,
              2,
            ),
            _buildNavigationItem(
              PhosphorIcons.user_circle_fill,
              PhosphorIcons.user_circle,
              3,
            ),
          ],
        ),
      ),
      body: pages[selected],
    );
  }

  Widget _buildNavigationItem(iconActive, iconInactive, index) {
    return IconButton(
      onPressed: () => {
        setState(() {
          selected = index;
        }),
        // if (index == 3) {Get.toNamed(Routes.PROFILE)}
      },
      icon: Icon(
        selected == index ? iconActive : iconInactive,
        size: 20.sp,
        color: selected == index ? kPrimaryColor : Colors.grey.shade600,
      ),
    );
  }
}
