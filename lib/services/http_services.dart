import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/res/constants/endpoint.dart';

class HttpService {
  Future<dynamic> postRequest(Map<String, dynamic> data) async {
    String baseUrl = Endpoints.predictionUrl;
    final url = Uri.parse(baseUrl);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('HTTP Error: ${response.statusCode} - ${response.body}');
    }
  }
}
