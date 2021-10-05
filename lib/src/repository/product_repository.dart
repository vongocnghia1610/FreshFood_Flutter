import 'dart:async';
import 'dart:convert';

import 'package:flutter_postman_application/src/repository/api_gateway.dart';
import 'package:flutter_postman_application/src/repository/base_repository.dart';

class ProductRepository {
  Future<List<dynamic>> getRecommendProduct(skip, limit) async {
    var response = await HandleApis().get(
      ApiGateway.GETRECOMMEND,
      'skip=$skip&limit=$limit',
    );

    if (response.statusCode == 200) {
      print("huhu");
      return jsonDecode(response.body)['data'];
    }

    return [];
  }

  Future<Map<String, dynamic>> createBook(String id) async {
    var body = {
      'id': id,
    };
    var response = await HandleApis().post(
      ApiGateway.GETRECOMMEND,
      body,
    );

    print(body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return null;
  }
}
