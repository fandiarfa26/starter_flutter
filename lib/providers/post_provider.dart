import 'package:flutter/material.dart';
import 'package:starter_flutter/models/post_model.dart';
import 'package:starter_flutter/utils/services/api_service.dart';

class PostProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _loading = false;
  List<PostModel>? _data;

  bool get loading => _loading;
  List<PostModel>? get data => _data;

  Future<void> fetchPosts() async {
    _loading = true;
    Map<String, dynamic> result = await _apiService.getPosts();
    if (result['status'] == 'success') {
      _data =
          result['data'].map<PostModel>((d) => PostModel.fromJson(d)).toList();
    } else {
      debugPrint(result['message']);
    }
    _loading = false;
    notifyListeners();
  }
}
