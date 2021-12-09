import 'dart:convert';
import 'dart:io';
import 'package:freshfood/src/models/user.dart';
import 'package:freshfood/src/providers/user_provider.dart';
import 'package:freshfood/src/repository/api_gateway.dart';
import 'package:freshfood/src/repository/base_repository.dart';
import 'package:http/http.dart' as http;

class AdminRepository {
  Future<List<dynamic>> getAllUser(search, skip, limit, role) async {
    var response = await HandleApis().get(ApiGateway.GET_ALL_USER,
        'skip=$skip&limit=$limit&search=$search&role=$role');
    print(jsonDecode(response.body)['data']);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return [];
  }

  Future<List<dynamic>> getstatisticOrder(
      String timeStart, String timeEnd) async {
    var response = await HandleApis().get(ApiGateway.GET_STATISTIC_ORDER,
        'timeStart=$timeStart&timeEnd=$timeEnd');
    print(jsonDecode(response.body)['data']);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return [];
  }

  Future<List<dynamic>> getstatisticProduct() async {
    var response = await HandleApis().get(ApiGateway.GET_STATISTIC_PRODUCT);
    print(jsonDecode(response.body)['data']);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return [];
  }

  Future<dynamic> getStatisticUser(String id) async {
    var response =
        await HandleApis().get(ApiGateway.GET_STATISTIC_USER, 'id=$id');
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return [];
  }
}
