import 'package:crypto_app/features/crypto_feature/api/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProviderModel extends ChangeNotifier {
  UserModel userModel;

  UserProviderModel({required this.userModel});

  //? get user data
  void getUserData(UserModel data) {
    userModel = data;

    // update
    notifyListeners();
  }
}
