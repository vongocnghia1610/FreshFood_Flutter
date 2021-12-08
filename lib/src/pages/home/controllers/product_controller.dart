import 'dart:async';

import 'package:freshfood/src/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<dynamic> _listRecomPro = [];
  List<dynamic> listAllProduct = [];
  List<dynamic> _listProductUser = [];

  int skip = 1;
  StreamController<List<dynamic>> _listRecommendController =
      StreamController<List<dynamic>>.broadcast();
  StreamController<List<dynamic>> _listProductController =
      StreamController<List<dynamic>>.broadcast();
  StreamController<List<dynamic>> _listProductUserController =
      StreamController<List<dynamic>>.broadcast();
  initialController() {
    _listRecomPro = [];
    _listProductUser = [];
  }

  getRecommendProduct() {
    ProductRepository().getRecommendProduct(skip, 10).then((value) {
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

  getAllProduct({String search, int skip, int limit, String groupProduct}) {
    ProductRepository()
        .getAllProduct(search, skip, limit, groupProduct)
        .then((value) {
      print(value);
      if (value.isNotEmpty) {
        listAllProduct = value;
        update();
      }
    });
  }

  getProductUser() {
    ProductRepository().getProductUser().then((value) {
      print(value);
      if (value.isNotEmpty) {
        print("zo rooi ne 1");

        _listProductUser = value;
        _listProductUserController.add(_listProductUser);
        update();
      }
    });
  }

  Stream<List<dynamic>> get listProductRecommend =>
      _listRecommendController.stream;
  Stream<List<dynamic>> get listProduct => _listProductController.stream;
  Stream<List<dynamic>> get listProductUser =>
      _listProductUserController.stream;
}
