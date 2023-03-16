import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/controller/user_pref/user_pref.dart';
import '../../login/model/login_model.dart';
import '../../repository/register_repo/register_repository.dart';
import '../../res/routes/route_name.dart';
import '../../utils/utils.dart';

class RegisterController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final _registerEmailController = TextEditingController();
  final _registerPasswordController = TextEditingController();
  RegisterRepository registerRepository = RegisterRepository();
  UserPref userPref = UserPref();

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get emailController => _registerEmailController;

  TextEditingController get passwordController => _registerPasswordController;

  void registerUserMethod(var email, pass) {
    var data = {'email': email, 'password': pass};
    registerRepository.registerUserApi(data).then((value) {
      Get.back();
      userPref.saveUserToken(LoginModel.fromJson(value)).then((value) {
        Get.offAllNamed(RouteName.dashboardScreen);
        Utils.toastMessage('Register Successfully');
      }).onError((error, stackTrace) {
        debugPrint('error while saving token ---> $error'  );
      });

      /*userPref.saveUserToken(LoginModel.fromJson(value)).then((value) {
        Get.offAllNamed(RouteName.dashboardScreen);
      }).onError((error, stackTrace) {
        debugPrint('error while saving token ---> $error'  );
      });*/
     if (kDebugMode) {
       print(' register ------> $value');
     }
    }).onError((error, stackTrace) {
      Get.back();
      debugPrint('error while register the user ---> $error'  );
    });
  }

  @override
  void onClose() {
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    super.onClose();
  }
}
