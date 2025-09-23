// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkUsernameUnique(String username) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username.trim())
        .limit(1)
        .get();

    // If no docs found => username is unique
    return querySnapshot.docs.isEmpty;
  } catch (e) {
    if (kDebugMode) {
      print("Error checking username uniqueness: $e");
    }
    // On error, return false (not unique) to be safe
    return false;
  }
}
