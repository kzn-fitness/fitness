import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/fitness/model/UserManager.dart';
import 'package:fitness_app/fitness/repository/user_repository.dart';
import 'package:fitness_app/fitness/service/firestore_service.dart';
import 'package:fitness_app/fitness/utils/routes.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({
    required this.userRepository,
  }) : super(const UserState()) {
    on<SubscribeUsermanager>(_onSubscribeUsermanager);
    on<SignInGoogle>(_onGoogleSignIn);
  }
  FutureOr<void> _onSubscribeUsermanager(
      SubscribeUsermanager event, Emitter<UserState> emit) async {
    await emit.onEach(
      userRepository.usermanager,
      onData: (usermanager) {
        emit(state.copyWith(usermanager: usermanager));
      },
    );
  }

  FutureOr<void> _onGoogleSignIn(
      SignInGoogle event, Emitter<UserState> emit) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      SmartDialog.showLoading(msg: "");
      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;
      //check user exist
      final userDoc = await firestore.collection("users").doc(user?.uid).get();
      final userManager = event.usermanager.copyWith(
        userId: user?.uid,
        fullName: user?.displayName,
        email: user?.email,
        image: user?.photoURL,
      );
      if (!userDoc.exists) {
        //we store it
        await firestore
            .collection("users")
            .doc(user?.uid)
            .set(userManager.toMap());
        //go to home
      }
      SmartDialog.dismiss();
      Navigator.pushNamed(navigatorKey.currentContext!, Routes.fitnesshomepage);
    } catch (e) {
      //hide loading
      SmartDialog.dismiss();
    }
  }
}
