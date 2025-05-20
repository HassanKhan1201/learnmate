import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_buddy/constants/colors.dart';

import '../../../constants/strings.dart';
import '../controller/beginner_controller.dart';

class FruitsScreen extends StatelessWidget {
  final BeginnerController controller = Get.put(BeginnerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: const Text(Strings.fruits),
      ),
      body: Obx(() {
        if (controller.fruitItems.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: controller.fruitCurrentIndex.value > 0
                      ? controller.previousFruit
                      : null,
                  icon: const Icon(size: 40, Icons.arrow_circle_left_outlined),
                  color: controller.fruitCurrentIndex.value > 0
                      ? Colors.blue
                      : Colors.grey,
                ),
                Obx(() {
                  final item = controller
                      .fruitItems[controller.fruitCurrentIndex.value];
                  return Column(
                    children: [
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
                      Text(item['name'],
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w700)),
                    ],
                  );
                }),
                IconButton(
                  onPressed: controller.fruitCurrentIndex.value <
                      controller.fruitItems.length - 1
                      ? controller.nextFruit
                      : null,
                  icon: const Icon(size: 40, Icons.arrow_circle_right_outlined),
                  color: controller.fruitCurrentIndex.value <
                      controller.fruitItems.length - 1
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