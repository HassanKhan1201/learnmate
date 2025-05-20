import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../routing/app_routes.dart';

class BeginnerController extends GetxController {
  //For English Alphabets
  final alphabetsCurrentIndex = 0.obs;
  RxList<Map<String, dynamic>> alphabetItems = <Map<String, dynamic>>[].obs;

  //For Fruits
  final fruitCurrentIndex = 0.obs;
  RxList<Map<String, dynamic>> fruitItems = <Map<String, dynamic>>[].obs;

  //For Animals
  final animalCurrentIndex = 0.obs;
  RxList<Map<String, dynamic>> animalItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAlphabetsData();
    loadFruitData();
    loadAnimalData();
  }

  //English Alphabet Section
  Future<void> loadAlphabetsData() async {
    try {
      final String response = await rootBundle.loadString('assets/alphabets.json');
      final Map<String, dynamic> data = json.decode(response);
      alphabetItems.value = List<Map<String, dynamic>>.from(data['items']);
    } catch (e) {
      print("Error loading alphabet data: $e");
    }
  }

  void nextAlphabet() {
    if (alphabetsCurrentIndex.value < alphabetItems.length - 1) {
      alphabetsCurrentIndex.value++;
    }
  }

  void previousAlphabet() {
    if (alphabetsCurrentIndex.value > 0) {
      alphabetsCurrentIndex.value--;
    }
  }

  //Fruits Section
  Future<void> loadFruitData() async {
    try {
      final String response = await rootBundle.loadString('assets/fruits.json');
      final Map<String, dynamic> data = json.decode(response);
      fruitItems.value = List<Map<String, dynamic>>.from(data['items']);
    } catch (e) {
      print("Error loading fruit data: $e");
    }
  }

  void nextFruit() {
    if (fruitCurrentIndex.value < fruitItems.length - 1) {
      fruitCurrentIndex.value++;
    }
  }

  void previousFruit() {
    if (fruitCurrentIndex.value > 0) {
      fruitCurrentIndex.value--;
    }
  }

  //Animals Section
  Future<void> loadAnimalData() async {
    try {
      final String response = await rootBundle.loadString('assets/animals.json');
      final Map<String, dynamic> data = json.decode(response);
      animalItems.value = List<Map<String, dynamic>>.from(data['items']);
    } catch (e) {
      print("Error loading fruit data: $e");
    }
  }

  void nextAnimal() {
    if (animalCurrentIndex.value < animalItems.length - 1) {
      animalCurrentIndex.value++;
    }
  }

  void previousAnimal() {
    if (animalCurrentIndex.value > 0) {
      animalCurrentIndex.value--;
    }
  }

  //Go to Alphabets Screen
  void goToAlphabetScreen() async {
    Get.toNamed(AppRoute.ALPHABETSCREEN);
  }

  //Go to Fruits Screen
  void goToFruitScreen() async {
    Get.toNamed(AppRoute.FRUITSCREEN);
  }

  //Go to Animals Screen
  void goToAnimalScreen() async {
    Get.toNamed(AppRoute.ANIMALSCREEN);
  }
  // Go to Sentence Correction Screen
  void goToSentenceCorrectionScreen() async {
    Get.toNamed(AppRoute.SENTENCE_CORRECTION);
  }
}


