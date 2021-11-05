import 'package:flutter/material.dart';
import 'package:freshfood/src/pages/payment/widget/default_button.dart';

class PaymentError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/error-img.gif')),
          Text(
            'Thanh toán gặp lỗi! Vui lòng thử lại',
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
