import 'package:freshfood/src/models/discount.dart';
import 'package:freshfood/src/pages/payment/controller/payment_controller.dart';
import 'package:freshfood/src/repository/discount_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DiscountController extends GetxController {
  int skip = 1;
  List<dynamic> listDiscount = [];
  DateTime startTime;
  DateTime endTime;
  DiscountModel currentDiscount;
  int indexSelected;
  int moneyDiscount = 0;
  final paymentController = Get.put(PaymentController());

  initialController() {
    listDiscount = [];
    skip = 1;
    moneyDiscount = 0;
  }

  getAllDiscount() {
    if (skip != -1) {
      DiscountRepository().getAllDiscount(skip, 10).then((value) {
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
    DiscountRepository().getDiscountActive().then((value) {
      if (value != null) {
        listDiscount.addAll(value);
        for (var item in listDiscount) {
          if (item['minimumDiscount'] < paymentController.productPrice)
            item['active'] = true;
        }
        update();
      }
    });
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

  applyDiscount() {
    currentDiscount = DiscountModel.fromMap(listDiscount[indexSelected]);
    moneyDiscount =
        paymentController.productPrice * currentDiscount.percentDiscount ~/ 100;
    if (moneyDiscount > currentDiscount.maxDiscount)
      moneyDiscount = currentDiscount.maxDiscount;
    update();
  }

  selectIndexDiscount(int index) {
    indexSelected = index;
    update();
  }
}
