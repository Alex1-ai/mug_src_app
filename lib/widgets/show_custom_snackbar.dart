import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/utils/dimensions.dart';

import '../widgets/big_text.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error", int duration = 2}) {
  Get.snackbar(title, message,
      titleText: BigText(
        text: title,
        color: Colors.white,
        size: Dimensions.font20,
      ),
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Colors.redAccent : AppColors.messageColor,
      duration:
          duration != 2 ? Duration(seconds: duration) : Duration(seconds: 2));
}
