import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../routing/app_routes.dart';
import '../../../widgets/section_item.dart';
import '../../../widgets/toolbar.dart';
import '../controller/beginner_controller.dart';

class BeginnerScreen extends GetView<BeginnerController> {
  final BeginnerController beginnerController = Get.put(BeginnerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor, // Consistent background color
      appBar: Toolbar(
        text: Strings.beginnerMode,
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
                  icon: Icons.abc,
                  title: Strings.alphabets,
                  onTap: () {
                    beginnerController.goToAlphabetScreen();
                  },
                ),
                const SizedBox(height: 10),
                SectionItem(
                  icon: Icons.apple,
                  title: Strings.fruits,
                  onTap: () {
                    beginnerController.goToFruitScreen();
                  },
                ),
                const SizedBox(height: 10),
                SectionItem(
                  icon: Icons.pets,
                  title: Strings.animals,
                  onTap: () {
                    beginnerController.goToAnimalScreen();
                  },
                ),
                const SizedBox(height: 10),
                SectionItem(
                  icon: Icons.message_rounded,
                  title: "Sentence Correction",
                  onTap: () {
                    beginnerController.goToSentenceCorrectionScreen();
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
                const SizedBox(height: 40),
                SectionItem(
                  icon: Icons.videogame_asset,
                  title: "Game",
                  onTap: () {
                    // Placeholder route for Game
                    Get.toNamed(AppRoute.GAME);
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
