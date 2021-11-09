import 'dart:convert';
import 'dart:io';
import 'package:freshfood/src/models/user.dart';
import 'package:freshfood/src/providers/user_provider.dart';
import 'package:freshfood/src/repository/api_gateway.dart';
import 'package:freshfood/src/repository/base_repository.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<dynamic> getProfile() async {
    var response = await HandleApis().get(ApiGateway.GET_PROFILE);

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return [];
  }

  Future<dynamic> updateImage({File avatar}) async {
    var request = http.MultipartRequest(
        'POST', Uri.http(root_url, ApiGateway.UPDATE_IMAGE));
    request.headers["Content-Type"] = 'multipart/form-data';
    request.headers["Authorization"] =
        'Bearer ' + (userProvider.user == null ? '' : userProvider.user.token);
    request.files.add(http.MultipartFile.fromBytes(
      "image",
      avatar.readAsBytesSync(),
      filename: avatar.path,
    ));
    var response = await http.Response.fromStream(await request.send());
    print("phongtu");

    print(response.statusCode);
    print(jsonDecode(response.body)['data']);
    if ([200, 201].contains(response.statusCode)) {
      var jsonResult = jsonDecode(response.body)['data'];
      return jsonResult;
    }

    return null;
  }

  Future<List<dynamic>> getAllAddress() async {
    var response = await HandleApis().get(ApiGateway.GET_ADDRESS);

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return [];
  }
}
