import 'dart:io';

import 'package:freshfood/src/models/user.dart';
import 'package:freshfood/src/repository/user_repository.dart';
import 'package:freshfood/src/utils/snackbar.dart';
import 'package:get/get.dart';
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

  updateAvatar(File image) {
    UserRepository().updateImage(avatar: image).then((value) {
      Get.back();
      if (value == null) {
        GetSnackBar getSnackBar = GetSnackBar(
          title: 'Thất bại',
          subTitle: 'Cập nhật avatar thất bại',
        );
        getSnackBar.show();
      } else {
        user.avatar = value['image'];
        update();
        GetSnackBar getSnackBar = GetSnackBar(
          title: 'Thành công',
          subTitle: 'Cập nhật avatar thành công',
        );
        getSnackBar.show();
      }
    });
  }
}
