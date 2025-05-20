import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../routing/app_routes.dart';
import '../../../utils/utils.dart';
import '../../../widgets/progress_dialog.dart';

class AuthenticationController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RxBool obscureText = true.obs;
  RxBool hasInternetConnection = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> fieldsValidation(fromLogin) async {
    if (emailController.value.text.trim().isEmpty) {
      showToast(message: "Email is empty");
    } else if (!isValidEmail(emailController.value.text.trim())) {
      showToast(message: "Email is invalid");
    } else if (passwordController.value.text.trim().isEmpty) {
      showToast(message: "Password is empty");
    } else if (!isValidPassword(passwordController.value.text.trim())) {
      showToast(message: "Password must be at least 8 characters long");
    } else {
      if (fromLogin) {
        loginWithEmailAndPassword();
      } else {
        signUpWithEmailAndPassword();
      }
    }
  }

  //Create User Account
  Future<void> signUpWithEmailAndPassword() async {
    bool hasInternet = await checkInternetConnection();
    if (hasInternet) {
      showProgressDialog(Strings.pleaseWait, Strings.signUpLoaderMessage);
      try {
        // Create user with email and password
        UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text.trim().toLowerCase(),
          password: passwordController.text.trim(),
        );
        // User successfully created
        User? user = userCredential.user;
        if (user != null) {
          hideProgressDialog();
          goToLogin();
        }
      } on FirebaseAuthException catch (e) {
        hideProgressDialog();
        clearControllerFields();
        if (e.code == 'email-already-in-use') {
          showToast(message: "This email is already in use.");
        } else if (e.code == 'invalid-email') {
          showToast(message: "The email address is invalid.");
        } else if (e.code == 'weak-password') {
          showToast(message: "The password is too weak.");
        } else {
          showToast(message: e.message ?? "An unknown error occurred.");
        }
      } catch (e) {
        hideProgressDialog();
        clearControllerFields();
        showToast(message: "An error occurred. Please try again.");
      }
    } else {
      showNoInternetDialog();
    }
  }

  //Login User with Email and Password
  Future<void> loginWithEmailAndPassword() async {
    bool hasInternet = await checkInternetConnection();
    if (hasInternet) {
      showProgressDialog(Strings.pleaseWait, Strings.signInDialogDesc);
      try {
        UserCredential userCredential =
            await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text.trim().toLowerCase(),
          password: passwordController.text..trim(),
        );

        // User successfully logged in
        User? user = userCredential.user;
        if (user != null) {
          hideProgressDialog();
          goToSelectCategory();
        }
      } on FirebaseAuthException catch (e) {
        hideProgressDialog();
        clearControllerFields();
        switch (e.code) {
          case 'user-not-found':
            showToast(
                message:
                    "No account found with this email. Please sign up first.");
            break;
          case 'wrong-password':
            showToast(message: "Invalid password. Please try again.");
            break;
          case 'invalid-email':
            showToast(message: "The email address is invalid.");
            break;
          case 'invalid-credential':
            showToast(message: "The email and password are invalid.");
            break;
          default:
            showToast(message: e.message ?? "An unknown error occurred.");
        }
      } catch (e) {
        hideProgressDialog();
        clearControllerFields();
        showToast(message: "An error occurred. Please try again.");
      }
    } else {
      showNoInternetDialog();
    }
  }

  //Method to send password reset email
  Future<void> forgotPassword() async {
    bool hasInternet = await checkInternetConnection();
    if (hasInternet) {
      showProgressDialog(Strings.pleaseWait, Strings.forgotLoaderMessage);
      try {
        final email = emailController.text.trim().toLowerCase();
        await firebaseAuth
            .sendPasswordResetEmail(email: email)
            .then((_) {})
            .catchError((error) {
          print("Error during sendPasswordResetEmail: $error");
          throw error; // Rethrow to trigger the exception handler
        });

        hideProgressDialog();
        showDialog(PanaraDialogType.custom,
            "Password reset email sent. Please check your inbox.");
      } on FirebaseAuthException catch (e) {
        hideProgressDialog();
        clearControllerFields();
        if (e.code == 'user-not-found') {
          showToast(message: "No user found with this email.");
        } else if (e.code == 'invalid-email') {
          showToast(message: "The email address is invalid.");
        } else {
          showToast(message: e.message ?? "An unknown error occurred.");
        }
      } catch (e) {
        hideProgressDialog();
        clearControllerFields();
        showToast(message: "An error occurred. Please try again.");
      }
    } else {
      showNoInternetDialog();
    }
  }

  //Check Internet Connection
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  //No Internet Dialog
  void showNoInternetDialog() async {
    PanaraInfoDialog.showAnimatedGrow(
      Get.context!,
      title: Strings.noInternet,
      message: Strings.noInternetMessage,
      buttonText: Strings.ok,
      color: AppColor.buttonColor,
      buttonTextColor: AppColor.buttonTextColor,
      onTapDismiss: () async {
        Get.back();
      },
      panaraDialogType: PanaraDialogType.custom,
      barrierDismissible: false, // optional parameter (default is true)
    );
  }

  //Show Dialog
  void showDialog(panaraDialogType, message) async {
    PanaraInfoDialog.showAnimatedGrow(
      Get.context!,
      message: message,
      buttonText: Strings.ok,
      color: AppColor.buttonColor,
      buttonTextColor: AppColor.buttonTextColor,
      onTapDismiss: () async {
        Get.back();
        goToLogin();
      },
      panaraDialogType: panaraDialogType,
      barrierDismissible: false, // optional parameter (default is true)
    );
  }

  //SignIn Button Click
  void goToLogin() async {
    Get.offAllNamed(AppRoute.LOGIN);
  }

  //SignIn Button Click
  void goToSelectCategory() async {
    Get.offAllNamed(AppRoute.SELECT_CATEGORY);
  }

  //SignUp Button Click
  void goToSignUp() async {
    Get.toNamed(AppRoute.SIGN_UP);
  }

  //SignIn Button Click
  void goToForgotPassword() async {
    Get.toNamed(AppRoute.FORGOT_PASSWORD);
  }

  //Clear Controller Data
  void clearControllerFields() {
    emailController.text = "";
    passwordController.text = "";
  }
}
