import 'dart:async';

import 'package:freshfood/src/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<dynamic> _listRecomPro = [];
  List<dynamic> listAllProduct = [];

  int pageNum = 1;
  StreamController<List<dynamic>> _listRecommendController =
      StreamController<List<dynamic>>.broadcast();
  StreamController<List<dynamic>> _listProductController =
      StreamController<List<dynamic>>.broadcast();
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

  getProduct() {
    ProductRepository().getRecommendProduct(1, 10).then((value) {
      print(value);
      if (value.isNotEmpty) {
        _listRecomPro.addAll(value);
        _listProductController.add(_listRecomPro);
        update();
      }
    });
  }

  getAllProduct() {
    ProductRepository().getAllProduct(1, 15).then((value) {
      print(value);
      if (value.isNotEmpty) {
        listAllProduct = value;
        update();
      }
    });
  }

  Stream<List<dynamic>> get listProductRecommend =>
      _listRecommendController.stream;
  Stream<List<dynamic>> get listProduct => _listProductController.stream;
}
