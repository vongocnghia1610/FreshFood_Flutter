import 'dart:async';

import 'package:freshfood/src/models/eveluate.dart';
import 'package:freshfood/src/models/product.dart';
import 'package:freshfood/src/pages/cart/controller/cart_controller.dart';
import 'package:freshfood/src/repository/cart_repository.dart';
import 'package:freshfood/src/repository/discount_repository.dart';
import 'package:freshfood/src/repository/product_repository.dart';
import 'package:freshfood/src/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DiscountController extends GetxController {
  int skip = 1;
  List<dynamic> listDiscount = [];
  DateTime startTime;
  DateTime endTime;

  initialController() {
    listDiscount = [];
    skip = 1;
  }

  getAllDiscount() {
    if (skip != -1) {
      DiscountRepository().getAllDiscount(skip, 10).then((value) {
        print(value);
        if (value != null) {
          listDiscount.addAll(value);
          skip++;
          update();
        } else {
          skip = -1;
          update();
        }
      });
    }
  }

  getDiscountActive() {
    if (skip != -1) {
      DiscountRepository().getDiscountActive().then((value) {
        print(value);
        if (value != null) {
          listDiscount.addAll(value);
          skip++;
          update();
        } else {
          skip = -1;
          update();
        }
      });
    }
  }

  initDateTime() {
    startTime = DateTime.now();
    endTime = DateTime.now();
  }

  setStartTime(DateTime picked) {
    startTime = picked;
    update();
  }

  setEndTime(DateTime picked) {
    endTime = picked;
    update();
  }
}
