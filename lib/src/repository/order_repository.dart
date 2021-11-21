import 'dart:convert';

import 'package:freshfood/src/models/address.dart';
import 'package:http/http.dart' as http;

import 'api_gateway.dart';
import 'base_repository.dart';

class OrderRepository {
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

  Future<dynamic> createOrder(
      {List<String> cartId,
      AddressModel address,
      String note,
      int typePaymentOrder}) async {
    var body = {
      "cartId": cartId,
      "area": {
        "name": address.name,
        "phone": address.phone,
        "province": address.province,
        "district": address.district,
        "address": address.address
      },
      "note": note,
      "typePaymentOrder": typePaymentOrder
    };
    var response = await HandleApis().post(ApiGateway.CREATE_ORDER, body);
    print(jsonEncode(body));

    print("chonayne");

    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return [];
  }

  Future<List<dynamic>> getOrders({
    String search,
    int skip,
    int limit,
    int status,
  }) async {
    // Map<String, dynamic> paramsObject = {
    //   "search": search,
    //   "skip": skip,
    //   "limit": limit,
    //   "status": status,
    // };

    var response = await HandleApis().get(
      ApiGateway.GET_ORDER,
      'search=$search&status=$status&skip=$skip&limit=$limit',
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }

    return [];
  }
}