import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SentenceCorrectionController extends GetxController {
  var inputController = TextEditingController();
  var correctedSentence = "".obs;

  // Load Model API Call
  Future<void> loadModel() async {
    try {
      final response = await http.get(
        Uri.parse("https://807c-223-123-91-25.ngrok-free.app/load_model"),
      );

      if (response.statusCode == 200) {
        print("Model loaded successfully!");
      } else {
        print("Failed to load model: ${response.body}");
      }
    } catch (e) {
      print("Error while loading model: $e");
    }
  }

  // Send Sentence for Correction
  Future<void> sendSentenceForCorrection() async {
    final sentence = inputController.text.trim();
    if (sentence.isEmpty) {
      correctedSentence.value = "Please enter a sentence.";
      return;
    }

    try {
      final response = await http.post(
        Uri.parse("https://807c-223-123-91-25.ngrok-free.app/predict"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"text": sentence}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        correctedSentence.value = data["output"];
      } else {
        correctedSentence.value = "Error: Unable to process your request.";
      }
    } catch (e) {
      correctedSentence.value = "Error: Check your internet connection.";
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadModel(); // Automatically load the model on screen initialization
  }
}
