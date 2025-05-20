import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../controller/sentence_correction_controller.dart';

class SentenceCorrectionScreen extends StatelessWidget {
  final SentenceCorrectionController controller = Get.put(SentenceCorrectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sentence Correction",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor, // Changed color to white
          ),
        ),
        backgroundColor: AppColor.buttonColor,
        elevation: 0,
      ),
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Logo or Header
            const Text(
              "LearnMate AI",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: AppColor.buttonColor,
              ),
            ),
            const SizedBox(height: 30),

            // User Input Area
            Container(
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                controller: controller.inputController,
                maxLines: 5,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: "Type your sentence here...",
                  hintStyle: const TextStyle(
                    color: AppColor.messageHintTextColor,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(15),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Send Button
            ElevatedButton(
              onPressed: () {
                controller.sendSentenceForCorrection();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.buttonColor,
                foregroundColor: AppColor.buttonTextColor,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Correct Sentence",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 30),

            // Response Area
            Expanded(
              child: Obx(() {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    controller.correctedSentence.value.isEmpty
                        ? "Your corrected sentence will appear here."
                        : controller.correctedSentence.value,
                    style: const TextStyle(fontSize: 18, color: AppColor.textColor),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
