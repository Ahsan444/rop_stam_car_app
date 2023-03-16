import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';

import '../../../database/app_database.dart';
import '../../model/login_model.dart';

class UserPref{
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<bool> saveUserToken(LoginModel loginModel) async {
    final store = intMapStoreFactory.store('user');
    await store.add(await _db, loginModel.toJson());
    debugPrint('token saved: ${loginModel.toJson()}');
    return true;
  }

  Future<LoginModel> getUserToken() async {
    final store = intMapStoreFactory.store('user');
    var token = await store.findFirst(await _db);
    if(token != null){
      debugPrint('token found: ${token.value}');
      return LoginModel.fromJson(token.value);
    }
    return LoginModel();
  }

  Future<bool> clearUserToken() async {
    final store = intMapStoreFactory.store('user');
    await store.delete(await _db);
    debugPrint('token cleared');
    return false;
  }
}