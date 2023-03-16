import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class Utils {
  static toastMessage(String message) {
    return BotToast.showText(
      text: message,
    );
  }

  static appSnackBar(
      {String? title,
      subtitle,
      Color? bgColor,
      txtColor,
      SnackPosition? snackPosition}) {
    return Get.snackbar(
      title ?? 'Alert',
      subtitle ?? 'Please Select Type',
      snackPosition: snackPosition ?? SnackPosition.TOP,
      backgroundColor: bgColor ?? Constants.RED_COLOR,
      colorText: txtColor ?? Colors.white,
    );
  }
}
