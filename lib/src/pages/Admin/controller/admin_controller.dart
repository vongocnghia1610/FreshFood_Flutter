import 'package:freshfood/src/models/address.dart';
import 'package:freshfood/src/models/user.dart';
import 'package:freshfood/src/repository/admin_repository.dart';
import 'package:freshfood/src/repository/user_repository.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  List<UserModel> listUser = [];
  getAllUser() {
    AdminRepository().getAllUser().then((value) {
      if (value.isNotEmpty) {
        print("abc");

        listUser = value.map((data) => UserModel.fromMap(data)).toList();
        update();
      }
    });
  }
}
