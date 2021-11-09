import 'package:freshfood/src/models/cart.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  double total = 0;
  double transportFee = 0;
  double productPrice = 0;
  int methodPayment;
  double getproductPrice(List<CartModel> list) {
    productPrice = 0;
    list.forEach((element) {
      productPrice += element.cost * element.quantity;
    });
    return productPrice;
  }

  String getPaymentMethod() {
    String temp;
    switch (methodPayment) {
      case 0:
        temp = "Paypal";
        break;

      case 1:
        temp = "VNPay";
        break;
      case 2:
        temp = "Thanh toán khi nhận hàng";
        break;
    }
    return temp;
  }

  changePaymentMethod(int value) {
    methodPayment = value;
    update();
  }
}
