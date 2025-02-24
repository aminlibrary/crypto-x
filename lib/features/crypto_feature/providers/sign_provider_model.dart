import 'package:flutter/material.dart';

class SignProviderModel extends ChangeNotifier {
  bool isLoading;

  SignProviderModel({required this.isLoading});

  //? toggle to loading mode
  void toggleToLoading(bool onLoading) {
    isLoading = onLoading;

    // update
    notifyListeners();
  }
}
