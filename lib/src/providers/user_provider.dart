import 'package:flutter/material.dart';
import 'package:flutter_postman_application/src/models/user.dart';

import 'package:get_storage/get_storage.dart';

class UserProvider extends ChangeNotifier {
  final _getStorage = GetStorage();
  final storageKey = 'token';
  UserModel _user;

  UserModel get user => _user;

  setUser(UserModel data) {
    _user = data;
    if (user != null) {
      _getStorage.write(storageKey, user.token);
    } else {
      _getStorage.write(storageKey, '');
    }
    notifyListeners();
  }

  checkLogined() {
    String token = _getStorage.read(storageKey) ?? '';
    if (token != '') {
      _user = UserModel(
        token: token,
      );
    } else {
      _user = null;
    }
  }

  // getInfoUser(Map<String, dynamic> data) {
  //   print(data['role']);
  //   _user.userId = data['_id'];
  //   _user.address = data['address'];
  //   _user.fullName = data['displayName'];
  //   _user.image = data['avatar'] == null || data['avatar'] == ''
  //       ? icon_app
  //       : data['avatar'];
  //   _user.phone = data['phone'];
  //   _user.role = data['role'];
  //   _user.username = data['userName'];
  //   _user.priceShipPTH = data['priceShipPTH'];
  //   _user.priceShipPTN = data['priceShipPTN'];
  //   _user.priceShipReceived = data['priceShipReceived'];
  //   _user.area = data['area'];
  //   notifyListeners();
  // }

  // updateShippingFee(Map<String, dynamic> data) {
  //   _user.priceShipPTH = data['priceShipPTH'];
  //   _user.priceShipPTN = data['priceShipPTN'];
  //   _user.priceShipReceived = data['priceShipReceived'];
  //   notifyListeners();
  // }
}

UserProvider userProvider = UserProvider();
