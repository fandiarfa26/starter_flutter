import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starter_flutter/constants/api_path.dart';

class ApiService {
  static Map<String, String> _headers() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  Future<Map<String, dynamic>> getPosts() async {
    final response = await http.get(postsUrl, headers: _headers());
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return {"status": "success", "message": "OK", "data": data};
    } else {
      return {"status": "failed", "message": "Error"};
    }
  }
}
