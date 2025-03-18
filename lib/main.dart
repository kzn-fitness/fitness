import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/fitness/fitnessmain.dart';
import 'package:fitness_app/fitness/repository/user_repository.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final UserRepository userRepository = UserRepository();
  userRepository.listenAuthStateChange();
  runApp(Fitnessmain(
    userRepository: userRepository,
  ));
}
