import 'dart:async';

import 'package:flutter_postman_application/src/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<dynamic> _listRecomPro = [];

  int pageNum = 1;
  StreamController<List<dynamic>> _listRecommendController =
      StreamController<List<dynamic>>();
  initialController() {
    _listRecomPro = [];
  }

  getRecommendProduct() {
    print("zo rooi ne");

    ProductRepository().getRecommendProduct(1, 10).then((value) {
      print(value);
      if (value.isNotEmpty) {
        print("zo rooi ne 1");

        _listRecomPro.addAll(value);
        _listRecommendController.add(_listRecomPro);
        update();
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

  Stream<List<dynamic>> get listProductRecommend =>
      _listRecommendController.stream;
}
