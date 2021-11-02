import 'dart:async';
import 'package:flutter_postman_application/src/models/cart.dart';
import 'package:flutter_postman_application/src/repository/cart_repository.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<dynamic> listProductCart = [];
  int pageNum = 1;
  // String total = '0';
  StreamController<String> _total = StreamController<String>.broadcast();
  StreamController<List<dynamic>> listProductCartController =
      StreamController<List<dynamic>>.broadcast();
  initialController() {
    listProductCart = [];
  }

  getTotalMoney() {
    double temp = 0;
    listProductCart.forEach((element) {
      if (element['selected'] == 1) {
        temp += element['cost'] * element['quantity'];
      }
    });
    _total.add(temp.toString());
    update();
  }

  changeStatusItem(index) {
    if (listProductCart[index]['selected'] == 1)
      listProductCart[index]['selected'] = 0;
    else
      listProductCart[index]['selected'] = 1;
    getTotalMoney();
  }

  deleteItem() {
    List<dynamic> temp = [];
    listProductCart.forEach((element) {
      if (element['selected'] == 1) {
        temp.add(element);
      }
    });
    temp.forEach((element) {
      listProductCart.remove(element);
    });
    listProductCartController.add(listProductCart);
    update();
    getTotalMoney();
  }

  increaseQuantity(index) {
    // if(listProductCart[index]['quantity'] )
    // {
    listProductCart[index]['quantity']++;
    getTotalMoney();
    // }
  }

  decreaseQuantity(index) {
    if (listProductCart[index]['quantity'] > 1) {
      listProductCart[index]['quantity']--;
      getTotalMoney();
    }
  }

  selectAddCart() {
    listProductCart.forEach((element) {
      element['selected'] = 1;
    });
    getTotalMoney();
  }

  deleteAddCart() {
    listProductCart.forEach((element) {
      element['selected'] = 0;
    });
    getTotalMoney();
  }

  getListProduct() {
    CartRepository().getProductCart().then((value) {
      print(value);
      if (value.isNotEmpty) {
        print("zo dc cart r nek");
        listProductCart.addAll(value);
        listProductCartController.add(listProductCart);
        update();
      }
    });
  }

  Stream<List<dynamic>> get listProduct => listProductCartController.stream;
  Stream<String> get total => _total.stream;
}
