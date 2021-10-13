import 'dart:async';
import 'package:flutter_postman_application/src/repository/group_product_repository.dart';
import 'package:get/get.dart';

class GroupProductController extends GetxController {
  List<dynamic> _listGroupProduct = [];

  StreamController<List<dynamic>> _listGroupProductController =
      StreamController<List<dynamic>>.broadcast();

  initialController() {
    _listGroupProduct = [];
  }

  getGroupProduct() {
    GroupProductRepository().getGroupProduct().then((value) {
      print("zodiml");
      print(value);
      if (value.isNotEmpty) {
        _listGroupProduct.addAll(value);
        _listGroupProductController.add(_listGroupProduct);
      }
    });
    // if (pageNum != -1) {
    //   BookRepository().getBooks(pageNum).then((value) {
    //     if (value.length > 0) {
    //       listBook.addAll(value);
    //       pageNum++;
    //       update();
    //     } else {
    //       pageNum = -1;
    //       update();
    //     }
    //   });
    // }
  }

  Stream<List<dynamic>> get listGroupProduct =>
      _listGroupProductController.stream;
}
