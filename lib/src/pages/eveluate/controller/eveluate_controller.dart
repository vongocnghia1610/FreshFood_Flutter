import 'package:freshfood/src/models/address.dart';
import 'package:freshfood/src/models/eveluate.dart';
import 'package:freshfood/src/pages/payment/controller/payment_controller.dart';
import 'package:freshfood/src/repository/eveluate_repository.dart';
import 'package:freshfood/src/repository/payment_repository.dart';
import 'package:freshfood/src/repository/user_repository.dart';
import 'package:get/get.dart';

class EveluateController extends GetxController {
  List<EveluateModel> listEveluate = [];
  getAllEveluate(String productId, int skip, int limit) {
    EveluateRepository()
        .getEveluateByProduct(productId: productId, skip: skip, limit: limit)
        .then((value) {
      if (value.isNotEmpty) {
        listEveluate =
            value.map((data) => EveluateModel.fromMap(data)).toList();
        update();
      }
    });
  }
}
