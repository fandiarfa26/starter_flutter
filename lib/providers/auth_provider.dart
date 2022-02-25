// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/services/api_service.dart';
import '../../utils/services/auth_service.dart';

enum StatusAuth { Loading, NotLoggedIn, LoggedIn }

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService(FirebaseAuth.instance);
  final ApiService _apiService = ApiService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  PhoneAuthCredential? _phoneAuthCredential;
  String? _verificationId;
  String? _userId;
  StatusAuth _status = StatusAuth.Loading;
  String _inputEmail = '';
  bool _loadingCheck = false;
  bool _loading = false;

  PhoneAuthCredential? get phoneAuthCredential => _phoneAuthCredential;
  String? get verificationId => _verificationId;
  String? get userId => _userId;
  StatusAuth get status => _status;
  String get inputEmail => _inputEmail;
  bool get loadingCheck => _loadingCheck;
  bool get loading => _loading;

  Future<void> initAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userId');
    if (id != null) {
      _userId = id;
      _status = StatusAuth.LoggedIn;
    } else {
      _status = StatusAuth.NotLoggedIn;
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>> login() async {
    return {};
  }

  Future<void> logout() async {
    await _authService.logout();
    _status = StatusAuth.NotLoggedIn;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    _inputEmail = '';
    notifyListeners();
  }

  Future<void> resetInputValue() async {
    _verificationId = null;
    _inputEmail = '';
    _loading = false;
    _loadingCheck = false;
    notifyListeners();
  }

  void setEmailValue(String value) {
    _inputEmail = value;
    notifyListeners();
  }
}
