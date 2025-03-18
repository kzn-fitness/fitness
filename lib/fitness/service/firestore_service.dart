import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

final firestore = FirebaseFirestore.instance;

//store data to firestore
Future<void> storeFitterBeginner() async {
  String jsonString =
      await rootBundle.loadString("assets/get_fitter_beginner_exercise.json");
  var jsonData = json.decode(jsonString) as List<dynamic>;
  //loop and store
  for (var element in jsonData) {
    await firestore.collection("exercises").doc().set(element);
  }
}
