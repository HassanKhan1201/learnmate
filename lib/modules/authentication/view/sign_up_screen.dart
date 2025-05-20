import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../widgets/button.dart';
import '../controller/authentication_controller.dart';

class SignUp extends GetView<AuthenticationController> {
  AuthenticationController loginController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    Strings.appName,
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      color: AppColor.textColor,
                    ),
                  ),
                  const Text(
                    Strings.loginSubTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColor.textColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    Strings.createAccount,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: AppColor.textColor,
                    ),
                  ),
                  const Text(
                    Strings.enterDetailsToCreateAccount,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: AppColor.textColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  loginAndPasswordField(),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        Strings.dontHaveAccount,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColor.textColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          loginController.goToLogin();
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          Strings.login,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Login and password field
  loginAndPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
            hintText: Strings.email,
            fillColor: AppColor.hintColor,
            hintStyle: const TextStyle(color: AppColor.messageHintTextColor),
            contentPadding: const EdgeInsets.all(18),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            prefixIcon: const Icon(Icons.email, color: AppColor.hintIconColor),
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => TextField(
            controller: loginController.passwordController,
            cursorColor: AppColor.buttonColor,
            style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: AppColor.textColor),
            decoration: InputDecoration(
              hintText: Strings.password,
              hintStyle: const TextStyle(color: AppColor.messageHintTextColor),
              isCollapsed: true,
              contentPadding: const EdgeInsets.all(18),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              fillColor: AppColor.hintColor,
              filled: true,
              prefixIcon: const Icon(Icons.lock, color: AppColor.hintIconColor),
              suffixIcon: GestureDetector(
                onTap: () {
                  loginController.obscureText.value =
                      !loginController.obscureText.value;
                },
                child: Icon(
                  loginController.obscureText.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColor.hintIconColor,
                ),
              ),
            ),
            obscureText: loginController.obscureText.value,
          ),
        ),
        const SizedBox(height: 30),
        Button(
          text: Strings.signUp,
          onPressed: () {
            controller.fieldsValidation(false);
          },
        ),
      ],
    );
  }
}
