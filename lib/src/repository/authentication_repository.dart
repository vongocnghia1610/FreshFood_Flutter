import 'dart:async';
import 'dart:convert';
import 'package:freshfood/src/repository/api_gateway.dart';
import 'package:freshfood/src/repository/base_repository.dart';

class AuthenticationRepository {
  Future<Map<String, dynamic>> login(String email, String password) async {
    var body = {
      "email": email,
      "password": password,
    };
    var response = await HandleApis().post(
      ApiGateway.LOGIN,
      body,
    );

    print(body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return null;
  }

  Future<String> register(String email, String phone, String password,
      String fullname, String address) async {
    var body = {
      "email": email,
      "password": password,
      "phone": phone,
      "name": fullname,
      "address": address
    };
    var response = await HandleApis().post(
      ApiGateway.REGISTER,
      body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return null;
  }

  Future<bool> forgotPassword(String email) async {
    var response = await HandleApis().get(
      ApiGateway.FORGOTPASSWORD,
      'email=$email',
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<Map<String, dynamic>> confirmOtp(String email, String otp) async {
    var body = {"email": email, "otp": otp};
    var response = await HandleApis().post(
      ApiGateway.CONFIRMOTP,
      body,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return null;
  }

  Future<bool> changePasswordWithOtp(String password, String token) async {
    var body = {"token": token, "password": password};
    var response = await HandleApis().post(
      ApiGateway.CHANGEPASSWORDWITHOTP,
      body,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
