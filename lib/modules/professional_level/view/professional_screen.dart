import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../routing/app_routes.dart';
import '../../../widgets/section_item.dart';
import '../../../widgets/toolbar.dart';
import '../controller/professional_controller.dart';

class ProfessionalScreen extends GetView<ProfessionalController> {
  final ProfessionalController professionalController = Get.put(ProfessionalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: Toolbar(
        text: Strings.professionals,
        backgroundColor: AppColor.whiteColor,
        voidCallback: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionItem(
                  icon: Icons.message_rounded,
                  title: "Sentence Correction",
                  onTap: () {
                    professionalController.goToSentenceCorrectionScreen();
                  },
                ),
                const SizedBox(height: 10),
                SectionItem(
                  icon: Icons.record_voice_over,
                  title: "Pronunciation",
                  onTap: () {
                    // Placeholder route for Pronunciation Correction
                    Get.toNamed(AppRoute.PRONUNCIATION_CORRECTION);
                  },
                ),
                const SizedBox(height: 10),
                SectionItem(
                  icon: Icons.quiz,
                  title: "Quiz",
                  onTap: () {
                    // Placeholder route for Quiz
                    Get.toNamed(AppRoute.QUIZ);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
