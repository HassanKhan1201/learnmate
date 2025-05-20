import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../utils/utils.dart';

void showProgressDialog(String title, String description) {
  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(title,
              style: normalTextStyle(22, FontWeight.w600, AppColor.blackColor)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(width: 25),
                  Expanded(
                    child: Text(
                      description,
                      softWrap: true,
                      style: normalTextStyle(
                        18,
                        FontWeight.w400,
                        AppColor.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

void hideProgressDialog() {
  Get.back();
}
