import 'package:flutter/material.dart';

class TnbProviderModel extends ChangeNotifier {
  int selectedIndex = 0;

  TnbProviderModel({required this.selectedIndex});

  //? change top navigation bar index
  void changeIndex(int index) {
    selectedIndex = index;

    // update
    notifyListeners();
  }
}
