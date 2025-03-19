import 'package:flutter/material.dart';

class AppProvidersLanguges extends ChangeNotifier {
  String AppLanguge = 'en';
  void changeLanguge(String newLanguge) {
    if (AppLanguge == newLanguge) return;
    AppLanguge = newLanguge;
    notifyListeners();
  }
}
