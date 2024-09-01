import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  String? _selectedItem;

  String? get selectedItem => _selectedItem;

  void selectItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }
}
