import 'package:flutter/material.dart';
import 'package:freshfood/src/pages/payment/widget/default_button.dart';

class PaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/success.gif')),
          Text(
            'Bạn đã thanh toán thành công',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          DefaultButton(
            btnText: 'Ok',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
