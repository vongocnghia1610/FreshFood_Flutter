import 'package:freshfood/src/models/cart_model.dart';
import 'package:freshfood/src/repository/payment_repository.dart';
import 'package:get/get.dart';

import 'addressController.dart';

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

  getMoney() {
    final addressController = Get.put(AddressController());

    PaymentRepository()
        .getShipFee(
            address: addressController.addressSelected.address,
            province: addressController.addressSelected.province,
            district: addressController.addressSelected.district)
        .then((value) {
      transportFee = double.parse(value.toString());
      total = transportFee + productPrice;
      update();
    });
  }
}
