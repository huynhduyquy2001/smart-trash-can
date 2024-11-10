import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAUJSawNCzlthZ6ezxwIzWjI5YZfSGK9B8",
            authDomain: "pikachu-uq2hjp.firebaseapp.com",
            projectId: "pikachu-uq2hjp",
            storageBucket: "pikachu-uq2hjp.appspot.com",
            messagingSenderId: "775261553784",
            appId: "1:775261553784:web:6721e4645244ba224b998d"));
  } else {
    await Firebase.initializeApp();
  }
}
