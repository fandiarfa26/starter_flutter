import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoProvider extends ChangeNotifier {
  PackageInfo? _packageInfo;
  PackageInfo? get packageInfo => _packageInfo;

  Future<void> getInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    notifyListeners();
  }
}
