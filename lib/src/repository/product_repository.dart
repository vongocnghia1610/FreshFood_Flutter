import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_postman_application/src/models/product.dart';
import 'package:flutter_postman_application/src/repository/api_gateway.dart';
import 'package:flutter_postman_application/src/repository/base_repository.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<dynamic>> getRecommendProduct(skip, limit) async {
    var response = await HandleApis().get(
      ApiGateway.GET_RECOMMEND,
      'skip=$skip&limit=$limit',
    );

    if (response.statusCode == 200) {
      print("huhu");
      return jsonDecode(response.body)['data'];
    }

    return [];
  }

  Future<ProductModel> createProduct({
    List<File> images,
    double weight,
    double price,
    int quantity,
    String name,
    String detail,
    String groupProduct,
  }) async {
    var request = http.MultipartRequest(
        'POST', Uri.https(root_url, 'product/createProduct'));
    request.headers["Content-Type"] = 'multipart/form-data';
    request.headers["Authorization"] = 'Bearer ' +
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJOZ3V5ZW4gUGhhbiBOaGF0IFR1IiwiZGF0YSI6eyJpZCI6IjYxMzYzOWQxOWU1OTJiMDNkNDRmZjlmZCIsInJvbGUiOjB9LCJpYXQiOjE2MzA5NDM2OTc1MjksImV4cCI6MTYzMTAzMDA5NzUyOX0.RaOH15agShUZeaeKGch_7u_cc6T1R_QKrSUZMfaqvZI';

    request.fields.addAll({
      'name': name,
      'detail': detail,
      'price': price.toString(),
      'groupProduct': groupProduct,
      'weight': weight.toString(),
      'quantity': quantity.toString(),
    });

    if (images.isNotEmpty) {
      images.forEach((image) {
        request.files.add(
          http.MultipartFile.fromBytes(
            "image",
            image.readAsBytesSync(),
            filename: image.path,
          ),
        );
      });
    }

    var response = await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(jsonDecode(response.body));
    if ([200, 201].contains(response.statusCode)) {
      var jsonResult = jsonDecode(response.body)['data'];
      return ProductModel.fromMap(jsonResult);
    }

    return null;
  }
}
