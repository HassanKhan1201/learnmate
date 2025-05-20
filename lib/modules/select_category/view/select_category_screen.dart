import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../widgets/category_options.dart';
import '../../../widgets/toolbar.dart';
import '../controller/select_category_controller.dart';

class SelectCategoryScreen extends GetView<SelectCategoryController> {
  SelectCategoryController selectCategoryController =
      Get.put(SelectCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: Toolbar(
        text: Strings.chooseLevel,
        backgroundColor: AppColor.whiteColor,
        voidCallback: () {
          Get.back();
        },
        showLogoutIcon: true,
        onLogout: () {
          controller.userLogout();
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
                const Text(
                  Strings.chooseYourLevel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                ),
                const SizedBox(height: 10),
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
        LearningOptionCard(
          icon: Icons.face,
          title: Strings.beginners,
          subtitle: 'Perfect for school kids and new learners',
          onTap: () {
            controller.goToBeginner();
          },
        ),
        const SizedBox(height: 10),
        LearningOptionCard(
          icon: Icons.school,
          title: Strings.professionals,
          subtitle: 'Perfect for senior students and teachers',
          onTap: () {
            controller.goToProfessional();
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Obx(() => Checkbox(
                  value: controller.rememberMe.value,
                  activeColor: AppColor.buttonColor,
                  visualDensity: VisualDensity.compact,
                  side: const BorderSide(color: AppColor.buttonColor, width: 2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) {
                    controller.rememberMe.value = value!;
                  },
                )),
            const SizedBox(width: 10),
            const Text(
              Strings.rememberChoice,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: AppColor.textColor),
            ),
          ]),
        )
      ],
    );
  }
}
