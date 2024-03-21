import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA_xA4Ir9QOEMxxP8uMbHl0zPkHWjmrbU0",
            authDomain: "pequeninos-app-1woiln.firebaseapp.com",
            projectId: "pequeninos-app-1woiln",
            storageBucket: "pequeninos-app-1woiln.appspot.com",
            messagingSenderId: "477116345462",
            appId: "1:477116345462:web:83581ad791227009018357"));
  } else {
    await Firebase.initializeApp();
  }
}
