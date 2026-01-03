import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC7rxWP0_v4aY63sAHvA5IRx0w5P95nWY8",
            authDomain: "alan-af578.firebaseapp.com",
            projectId: "alan-af578",
            storageBucket: "alan-af578.firebasestorage.app",
            messagingSenderId: "764241960284",
            appId: "1:764241960284:web:0b6163db7b804fc71bb599",
            measurementId: "G-VLCY0NSL1P"));
  } else {
    await Firebase.initializeApp();
  }
}
