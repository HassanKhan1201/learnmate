import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/colors.dart';

bool isValidEmail(String email) {
return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
    .hasMatch(email);
}

bool isValidPassword(String password) {
return password.length >= 8;
}

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

Text noDataFound({required String message}) {
  return Text(
    message,
    textAlign: TextAlign.center,
    style: const TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: AppColor.hintColor),
  );
}

TextStyle normalTextStyle(
    double fontSize, FontWeight fontWeight, Color textColor) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: 'Poppins',
      fontWeight: fontWeight,
      color: textColor);
}