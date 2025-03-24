import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  Future<dynamic> postRequest(Map<String, dynamic> data) async {
    const String baseUrl =
        'https://case-flow-management-server-8i5l.onrender.com/predict';
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
