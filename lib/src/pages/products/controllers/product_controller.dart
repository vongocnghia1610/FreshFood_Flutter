import 'dart:async';
import 'dart:io';

import 'package:flutter_postman_application/src/models/product.dart';
import 'package:flutter_postman_application/src/repository/cart_repository.dart';
import 'package:flutter_postman_application/src/repository/product_repository.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductDetailController extends GetxController {
  ProductModel product = new ProductModel();

  getDetailProduct(String id) {
    ProductRepository().getDetail(id).then((value) {
      print(id);
      if (value.isNotEmpty) {
        product = ProductModel.fromMap(value);
        print(product.name);
        // _listProductController.add(_listRecomPro);
        update();
      }
    });
  }

  increaseQuantity() {
    // if(listProductCart[index]['quantity'] )
    // {
    product.number++;
    update();
    // }
  }

  decreaseQuantity() {
    if (product.number > 1) {
      product.number--;
      update();
    }
  }

  addToCart() {
    CartRepository().addToCart(product.id, product.quantity).then((value) {
      print(value);
    });
  }
}
