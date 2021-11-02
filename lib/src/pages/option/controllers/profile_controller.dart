import 'package:flutter_postman_application/src/models/user.dart';
import 'package:flutter_postman_application/src/repository/user_repository.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  UserModel user = new UserModel();
  getProfile() {
    UserRepository().getProfile().then((value) {
      if (value.isNotEmpty) {
        user = UserModel.fromMap(value);
        update();
      }
    });
  }
}
