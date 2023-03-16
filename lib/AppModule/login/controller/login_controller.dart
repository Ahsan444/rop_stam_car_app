import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rop_stam_assignment/AppModule/login/controller/user_pref/user_pref.dart';
import 'package:rop_stam_assignment/AppModule/login/model/login_model.dart';
import 'package:rop_stam_assignment/AppModule/utils/utils.dart';

import '../../repository/login_repo/login_repository.dart';
import '../../res/routes/route_name.dart';

class LoginController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var loginModel = LoginModel();
  LoginRepository loginRepository = LoginRepository();
  UserPref userPref = UserPref();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

   void loginUserMethod(var email,pass) {
     var data = {
       'email': email,
       'password': pass
     };

       loginRepository.loginUserApi(data).then((value) {
         Get.back();
         Utils.toastMessage('Login Successfully');
         userPref.saveUserToken(LoginModel.fromJson(value)).then((value) {
           Get.offAllNamed(RouteName.dashboardScreen);
         }).onError((error, stackTrace) {
            debugPrint('error while saving token ---> $error'  );
         });
       }).onError((error, stackTrace) {
         Get.back();
         debugPrint('error while login ---> $error'  );
       });



  }



  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.onClose();
  }


}