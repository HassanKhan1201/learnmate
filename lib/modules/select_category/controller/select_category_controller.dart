import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routing/app_routes.dart';

class SelectCategoryController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RxBool rememberMe = false.obs;

  //Logout the current user
  Future<void> userLogout() async {
    firebaseAuth.signOut();
    Get.offAllNamed(AppRoute.LOGIN);
  }

  //SignUp Button Click
  void goToBeginner() async {
    Get.toNamed(AppRoute.BEGINNER);
  }

  //SignIn Button Click
  void goToProfessional() async {
    Get.toNamed(AppRoute.PROFESSIONAL);
  }
}
