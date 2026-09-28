import 'package:flutter/material.dart';

class ThemProvider extends ChangeNotifier {
  bool isDark = false;

  void changeThem(bool  vlaue) {
    isDark = vlaue;
    notifyListeners();
  }
}
