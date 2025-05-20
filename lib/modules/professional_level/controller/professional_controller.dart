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

class ProfessionalController extends GetxController {
  void goToSentenceCorrectionScreen() {
    Get.toNamed(AppRoute.SENTENCE_CORRECTION);
  }
}
