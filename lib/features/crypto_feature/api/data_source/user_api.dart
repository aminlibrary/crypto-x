import 'package:crypto_app/features/crypto_feature/api/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserApi {
  //? get user data
  Future<UserModel> getUserData({String? email, String? password}) async {
    //? try catch
    try {
      //* accounts data
      Map accounts = {};

      //* send request
      Response response = await Dio().get(
        "replace your api url",
      );

      //* status check
      if (response.statusCode == 200) {
        for (var item in response.data) {
          accounts.addAll(item);
        }

        //* check account available
        if (accounts.containsKey(email) == true &&
            password == accounts[email]["password"]) {
          //* return data
          return UserModel.fromJson(accounts[email]);
        } else {
          debugPrint("Error on account info - user data");
          return UserModel();
        }
      } else {
        //* error handle
        debugPrint("Error on status code - user data: ${response.statusCode}");
        return UserModel();
      }
    } catch (e) {
      //* error handle
      debugPrint("Error on catch - user data: $e");
      return UserModel();
    }
  }

  //? create account
  Future<String> createAccount({
    required UserModel userModel,
    required String email,
  }) async {
    //? try catch
    try {
      //* accounts data
      Map accounts = {};

      //* send request
      Response response = await Dio().get(
        "replace your api url",
      );

      //* status check
      if (response.statusCode == 200) {
        for (var item in response.data) {
          accounts.addAll(item);
        }

        //* check account available
        if (accounts.containsKey(email)) {
          //* return data
          return "account available";
        } else {
          //* send request
          await Dio().post(
            "replace your api url",
            data: {email: userModel.toJson()},
          );

          //* return
          return "create account success";
        }
      } else {
        //* error handle
        debugPrint("Error on status code - user data: ${response.statusCode}");
        return "create account failed";
      }
    } catch (e) {
      //* error handle
      debugPrint("Error on catch - user data: $e");
      return "create account failed";
    }
  }

  //? update account
  Future<String> updateAccount({
    required UserModel userModel,
    required String email,
    required int id,
  }) async {
    //? try catch
    try {
      //* accounts data
      Map accounts = {};

      //* send request
      Response response = await Dio().get(
        "replace your api url",
      );

      //* status check
      if (response.statusCode == 200) {
        for (var item in response.data) {
          accounts.addAll(item);
        }

        //* check account available
        if (accounts.containsKey(email)) {
          //* send request
          Response updateResponse = await Dio().put(
            "replace your api url/${accounts["id"]}",
            data: {email: userModel.toJson()},
          );

          //* status check
          if (updateResponse.statusCode == 200) {
            //* return data
            return "update account success";
          } else {
            //* error handle
            debugPrint(
              "Error on status code - user data: ${updateResponse.statusCode}",
            );
            return "update account failed";
          }
        } else {
          //* send request
          await Dio().post(
            "replace your api url",
            data: {email: userModel.toJson()},
          );

          //* return
          return "create account success";
        }
      } else {
        //* error handle
        debugPrint("Error on status code - user data: ${response.statusCode}");
        return "create account failed";
      }
    } catch (e) {
      //* error handle
      debugPrint("Error on catch - user data: $e");
      return "update account failed";
    }
  }
}
