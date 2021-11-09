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
    print(jsonEncode(body));
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
}
