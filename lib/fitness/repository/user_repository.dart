import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/fitness/model/UserManager.dart';
import 'package:fitness_app/fitness/service/firestore_service.dart';

class UserRepository {
  final _controller = StreamController<Usermanager>();
  StreamSubscription? streamSubscription;

  Stream<Usermanager> get usermanager async* {
    yield* _controller.stream;
  }

  void listenAuthStateChange() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        streamSubscription?.cancel();
        streamSubscription = firestore
            .collection("users")
            .doc(user.uid)
            .snapshots()
            .listen((usermanager) {
          final data = usermanager.data();
          if (data != null) {
            _controller.add(Usermanager.fromMap(data));
          }
        });
      } else {
        streamSubscription?.cancel();
      }
    });
  }
}
