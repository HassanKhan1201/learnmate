import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../widgets/button.dart';
import '../../../utils/utils.dart';
import '../../../widgets/toolbar.dart';
import '../controller/authentication_controller.dart';

class ForgotPassword extends GetView<AuthenticationController> {
  AuthenticationController loginController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: Toolbar(
          text: Strings.resetPassword,
          backgroundColor: AppColor.whiteColor,
          voidCallback: () {
            Get.back();
          }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  Strings.resetPasswordText,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: loginController.emailController,
                  cursorColor: AppColor.buttonColor,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: AppColor.textColor),
                  decoration: InputDecoration(
                    filled: true,
                    isCollapsed: true,
                    hintText: Strings.enterEmailHint,
                    fillColor: AppColor.hintColor,
                    hintStyle:
                        const TextStyle(color: AppColor.messageHintTextColor),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    prefixIcon:
                        const Icon(Icons.email, color: AppColor.hintIconColor),
                  ),
                ),
                const SizedBox(height: 30),
                continueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  continueButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Button(
          text: Strings.resetButton,
          onPressed: () {
            if (controller.emailController.text.trim().isEmpty) {
              showToast(message: "Email is empty");
            } else if (!isValidEmail(controller.emailController.text.trim())) {
              showToast(message: "Email is invalid");
            } else {
              FocusScope.of(Get.context!).requestFocus(FocusNode());
              loginController.forgotPassword();
            }
          },
        ),
      ],
    );
  }
}
