import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAN5mypE_N4XVJiWOV5hx3Xoid1Ccl9XBg",
            authDomain: "foodfit-qxo0cp.firebaseapp.com",
            projectId: "foodfit-qxo0cp",
            storageBucket: "foodfit-qxo0cp.appspot.com",
            messagingSenderId: "864412004526",
            appId: "1:864412004526:web:88f8899da095b0d960bd3f"));
  } else {
    await Firebase.initializeApp();
  }
}
