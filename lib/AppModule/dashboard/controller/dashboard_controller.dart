import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rop_stam_assignment/AppModule/login/controller/user_pref/user_pref.dart';
import 'package:rop_stam_assignment/AppModule/res/routes/route_name.dart';

import '../../utils/app_images.dart';
import '../../utils/utils.dart';
import '../model/car_model.dart';

class DashboardController extends GetxController {
  UserPref userPref = UserPref();
  Random random = Random();
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var regController = TextEditingController();

  /* void getToken(){
     userPref.getUserToken().then((value) {
       debugPrint('token wala ---> ${value.token}'  );
     }).onError((error, stackTrace) {
        debugPrint('error while getting token ---> $error'  );
     });
  }*/
  List<CarModel> cars = [
    CarModel(
        image: Image.asset(
          AppImages.CAR_ONE,
          width: 150.0,
        ),
        name: "Car 1",
        reg: '2013'),
    CarModel(
        image: Image.asset(
          AppImages.CAR_ONE2,
          width: 150.0,
        ),
        name: "Car 2",
        reg: '2014'),
    CarModel(
        image: Image.asset(
          AppImages.CAR_ONE4,
          width: 150.0,
        ),
        name: "Car 3",
        reg: '2015'),
    CarModel(
        image: Image.asset(
          AppImages.CAR_ONE5,
          width: 150.0,
        ),
        name: "Car 4",
        reg: '2016'),
    CarModel(
        image: Image.asset(
          AppImages.CAR_ONE6,
          width: 150.0,
        ),
        name: "Car 5",
        reg: '2017'),
    CarModel(
        image: Image.asset(
          AppImages.CAR_ONE7,
          width: 150.0,
        ),
        name: "Car 6",
        reg: '2018'),
  ].obs;
  //color list
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
  ];

  void addNewCars() {
    cars.add(CarModel(
        image: Image.asset(
          random.nextInt(4) == 0 ? AppImages.CAR_ONE : AppImages.CAR_ONE6,
          width: 110.w,
          height: 110.w,
        ),
        name: "Car ${cars.length + 1}",
        reg: '${random.nextInt(2022)}'));
  }

  void updateCars({
    var name,
    var reg,
    var index,
    required BuildContext context,
  }) {
    Navigator.of(context).pop();
    cars[index].name = name;
    cars[index].reg = reg;
    update();
    nameController.clear();
    regController.clear();
    Utils.toastMessage('Updated Successfully');
  }
  void logout(){
    userPref.clearUserToken().then((value) {
      Get.offAllNamed(RouteName.loginScreen);
    }).onError((error, stackTrace) {
      debugPrint('error while logout ---> $error'  );
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    regController.dispose();
    super.onClose();
  }
}
