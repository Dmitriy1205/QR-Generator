import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qr_authorization/api/response_model.dart';
import 'package:qr_authorization/assets/constants.dart' as constant;

class AuthPlink {
  Future<ResponseModel> getSlug() async {
    final response = await http.post(Uri.parse(constant.httpEndpoint),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'accept': 'application/json'
        },
        body: json
            .encode({'password': constant.password, 'email': constant.email}));

    var result = json.decode(response.body);
    print(result);
    if (response.statusCode == 201) {
      return ResponseModel.fromJson(result);
    } else {
      throw Exception(result);
    }
  }
}
