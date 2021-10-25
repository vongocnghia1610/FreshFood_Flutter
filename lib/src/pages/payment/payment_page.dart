import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_postman_application/src/pages/payment/widget/default_button.dart';
import 'package:flutter_postman_application/src/pages/products/widget/drawer_layout.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:sizer/sizer.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int value = 0;
  final paymentLables = [
    'Thanh toán bằng PayPal',
    'Thanh toán bằng VNPay',
    'Thanh toán khi nhận hàng'
  ];
  final paymentIconss = [
    'assets/icons/paypal-logo.png',
    'assets/icons/vn-pay.jpg',
    'assets/icons/COD.png'
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Container(
          width: 70.w,
          child: Drawer(
            child: DrawerLayout(),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              PhosphorIcons.arrow_circle_left_bold,
              color: Colors.white,
            ),
            onPressed: () => {},
            iconSize: 30,
          ),
          title: Text(
            " Phương Thức Thanh Toán",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Text(
                  'Chọn hình thức thanh toán',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Radio(
                          activeColor: kPrimaryColor,
                          value: index,
                          groupValue: value,
                          onChanged: (i) => setState(() => value = i),
                        ),
                        title: Text(
                          paymentLables[index],
                          style: TextStyle(color: kDarkPrimaryColor),
                        ),
                        trailing: Image.asset(
                          paymentIconss[index],
                          width: 40.sp,
                          height: 20.sp,
                        ),
                        //  Icon(
                        //   paymentIcons[index],
                        //   color: kPrimaryColor,
                        // ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: paymentLables.length),
              ),
              DefaultButton(
                btnText: 'Đồng ý',
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}
