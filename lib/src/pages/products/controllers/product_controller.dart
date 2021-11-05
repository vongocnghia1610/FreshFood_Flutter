import 'dart:async';
import 'dart:io';

import 'package:flutter_postman_application/src/models/product.dart';
import 'package:flutter_postman_application/src/pages/cart/controller/cart_controller.dart';
import 'package:flutter_postman_application/src/repository/cart_repository.dart';
import 'package:flutter_postman_application/src/repository/product_repository.dart';
import 'package:flutter_postman_application/src/utils/snackbar.dart';
import 'package:get/get.dart';
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
    CartRepository().addToCart(product.id, product.number).then((value) {
      if (value.isNotEmpty) {
        var cartController = Get.put(CartController());
        cartController.getListProduct();
        GetSnackBar getSnackBar = GetSnackBar(
          title: 'Thành công',
          subTitle: 'Thêm vào giỏ hàng thành công',
        );
        getSnackBar.show();
      } else {
        GetSnackBar getSnackBar = GetSnackBar(
          title: 'Thất bại',
          subTitle: 'Thêm vào giỏ hàng thất bại',
        );
        getSnackBar.show();
      }
    });
  }
}
