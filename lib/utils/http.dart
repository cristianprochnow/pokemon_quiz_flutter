import 'dart:convert';

import 'package:http/http.dart' as http;

class Http {
  static Future<Map<String, dynamic>> getData(String url) async {
    final Uri uri = Uri.parse(url);
    final http.Response response = await http.get(uri);

    final int httpCode = response.statusCode;
    final String content = response.body;

    bool isSuccess = httpCode == 200;

    if (isSuccess) {
      return jsonDecode(content);
    }

    throw Exception("Erro ao baixar os dados de pokémons: $httpCode");
  }
}