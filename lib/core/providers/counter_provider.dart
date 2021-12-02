import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _number = 0;

  int get number => _number;

  void increaseNumber() {
    _number = _number + 1;
    notifyListeners();
  }

  void decreaseNumber() {
    _number = _number - 1;
    notifyListeners();
  }

  void resetNumber() {
    _number = 0;
    notifyListeners();
  }
}
