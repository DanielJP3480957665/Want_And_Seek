import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddWantDiary extends ChangeNotifier {
  String? seek;
  String? want;
  String? challenge;
  String? diary;

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future addWantDiary() async {
    final doc = FirebaseFirestore.instance.collection('want_diary').doc();

    //firestoreに追加
    await doc.set(
        {'seek': seek, 'want': want, 'challenge': challenge, 'diary': diary});
  }
}
