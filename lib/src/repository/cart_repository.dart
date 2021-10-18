import 'dart:convert';
import 'package:flutter_postman_application/src/repository/api_gateway.dart';
import 'package:flutter_postman_application/src/repository/base_repository.dart';

class CartRepository {
  Future<List<dynamic>> getProductCart() async {
    var response = await HandleApis().get(ApiGateway.GETCART);

    if (response.statusCode == 200) {
      print("hello");
      return jsonDecode(response.body)['data'];
    }
    return [];
  }
}
