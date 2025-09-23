import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC5a9YfYvRoz3pYV9CFrMYuitPpgpCXf9Y",
            authDomain: "collabflo-database.firebaseapp.com",
            projectId: "collabflo-database",
            storageBucket: "collabflo-database.firebasestorage.app",
            messagingSenderId: "921716222185",
            appId: "1:921716222185:web:609365b9f16186b9a56878",
            measurementId: "G-E4ZBCPX5SL"));
  } else {
    await Firebase.initializeApp();
  }
}
