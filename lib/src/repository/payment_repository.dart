import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_gateway.dart';
import 'base_repository.dart';

class PaymentRepository {
  Future<int> getShipFee({
    String address,
    String province,
    String district,
  }) async {
    Map<String, dynamic> paramsObject = {
      "address": address,
      "province": province,
      "district": district,
      "pick_province": 'Hồ Chí Minh',
      "pick_district": 'Thủ Đức',
      "weight": (5 * 1000).toString(),
    };

    http.Response response = await http.get(
      Uri.https("services.giaohangtietkiem.vn", "/services/shipment/fee",
          paramsObject),
      // Uri.http(root_url, '/' + name, paramsObject),
      headers: {'Token': '83b5796301Fc00A131eb690fA9d8B9B5cCf0497b'},
    );
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body)['fee']['fee'];
    }
    print(response.statusCode);
    return null;
  }

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
}
