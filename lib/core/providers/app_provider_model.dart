import 'package:flutter/material.dart';

class AppProviderModel extends ChangeNotifier {
  int selectedIndex = 0;

  AppProviderModel({required this.selectedIndex});

  //? change button navigation bar index.
  void changeIndex(int index) {
    selectedIndex = index;

    // update
    notifyListeners();
  }
}
