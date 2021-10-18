import 'dart:async';
import 'package:flutter_postman_application/src/repository/cart_repository.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<dynamic> _listProduct = [];

  int pageNum = 1;
  StreamController<List<dynamic>> _listProductController =
      StreamController<List<dynamic>>.broadcast();
  initialController() {
    _listProduct = [];
  }

  getListProduct() {
    print("zo rooi ne");

    CartRepository().getProductCart().then((value) {
      print(value);
      if (value.isNotEmpty) {
        print("zo dc cart r nek");

        _listProduct.addAll(value);
        _listProductController.add(_listProduct);
        update();
      }
    });
  }

  Stream<List<dynamic>> get listProduct => _listProductController.stream;
}
