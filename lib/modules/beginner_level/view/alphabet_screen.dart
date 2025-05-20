import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_buddy/constants/colors.dart';
import 'package:learning_buddy/constants/strings.dart';

import '../controller/beginner_controller.dart';

class AlphabetScreen extends StatelessWidget {
  final BeginnerController controller = Get.put(BeginnerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: const Text(Strings.alphabets),
      ),
      body: Obx(() {
        if (controller.alphabetItems.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: controller.alphabetsCurrentIndex.value > 0
                      ? controller.previousAlphabet
                      : null,
                  icon: const Icon(size: 40, Icons.arrow_circle_left_outlined),
                  color: controller.alphabetsCurrentIndex.value > 0
                      ? Colors.blue
                      : Colors.grey,
                ),
                Obx(() {
                  final item = controller
                      .alphabetItems[controller.alphabetsCurrentIndex.value];
                  return Column(
                    children: [
                      Text(item['capital'],
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w700)),
                      Text(item['small'],
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          item['image_url'],
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return const Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(item['word'],
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w700)),
                    ],
                  );
                }),
                IconButton(
                  onPressed: controller.alphabetsCurrentIndex.value <
                          controller.alphabetItems.length - 1
                      ? controller.nextAlphabet
                      : null,
                  icon: const Icon(size: 40, Icons.arrow_circle_right_outlined),
                  color: controller.alphabetsCurrentIndex.value <
                          controller.alphabetItems.length - 1
                      ? Colors.blue
                      : Colors.grey,
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
