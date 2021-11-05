import 'dart:convert';
import 'package:freshfood/src/repository/api_gateway.dart';
import 'package:freshfood/src/repository/base_repository.dart';

class UserRepository {
  Future<dynamic> getProfile() async {
    var response = await HandleApis().get(ApiGateway.GET_PROFILE);

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return [];
  }
}
