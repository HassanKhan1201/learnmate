import 'package:learning_buddy/modules/beginner_level/view/alphabet_screen.dart';
import 'package:learning_buddy/modules/beginner_level/view/animals_screen.dart';
import 'package:learning_buddy/modules/beginner_level/view/fruits_screen.dart';

import '../modules/professional_level/view/professional_screen.dart';
import '../modules/sentence_correction/view/sentence_correction_screen.dart';
import '../modules/updates/feature_placeholders.dart';
import 'app_routes.dart';
import 'package:get/route_manager.dart';
import '../modules/authentication/view/forgot_password_screen.dart';
import '../modules/authentication/view/login_screen.dart';
import '../modules/authentication/view/sign_up_screen.dart';
import '../modules/beginner_level/view/beginner_screen.dart';
import '../modules/select_category/view/select_category_screen.dart';
import '../modules/beginner_level/view/beginner_screen.dart';



var getRoutes = [
  GetPage(name: AppRoute.SPLASH, page: () => Login()),
  GetPage(name: AppRoute.LOGIN, page: () => Login()),
  GetPage(name: AppRoute.SIGN_UP, page: () => SignUp()),
  GetPage(name: AppRoute.FORGOT_PASSWORD, page: () => ForgotPassword()),
  GetPage(name: AppRoute.SELECT_CATEGORY, page: () => SelectCategoryScreen()),
  GetPage(name: AppRoute.BEGINNER, page: () => BeginnerScreen()),
  GetPage(name: AppRoute.ALPHABETSCREEN, page: () => AlphabetScreen()),
  GetPage(name: AppRoute.FRUITSCREEN, page: () => FruitsScreen()),
  GetPage(name: AppRoute.ANIMALSCREEN, page: () => AnimalsScreen()),
  GetPage(name: AppRoute.SENTENCE_CORRECTION, page: () => SentenceCorrectionScreen()),
  GetPage(name: AppRoute.PROFESSIONAL, page: () => ProfessionalScreen()),

  // New Routes
  GetPage(name: AppRoute.PRONUNCIATION_CORRECTION, page: () => PronunciationCorrectionScreen()),
  GetPage(name: AppRoute.GAME, page: () => GameScreen()),
  GetPage(name: AppRoute.QUIZ, page: () => QuizScreen()),
];