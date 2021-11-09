import 'package:freshfood/src/models/address.dart';
import 'package:freshfood/src/repository/user_repository.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  List<AddressModel> listAddress = [];
  getAllAddress() {
    UserRepository().getAllAddress().then((value) {
      if (value.isNotEmpty) {
        listAddress = value.map((data) => AddressModel.fromMap(data)).toList();
        update();
      }
    });
  }
}
