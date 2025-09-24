import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCIEe_lnOA1qjbhFaKaiQYtNohxKuLT0VY",
            authDomain: "fala-comigo-831e8.firebaseapp.com",
            projectId: "fala-comigo-831e8",
            storageBucket: "fala-comigo-831e8.firebasestorage.app",
            messagingSenderId: "843785456064",
            appId: "1:843785456064:web:3f8a241e3df0a5bb9f6025",
            measurementId: "G-LW1NBGYLYF"));
  } else {
    await Firebase.initializeApp();
  }
}
