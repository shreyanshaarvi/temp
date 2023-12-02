import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDtid6yYbaqtxQUS5jln66PNmu2tXuIo6U",
            authDomain: "sign-51662.firebaseapp.com",
            projectId: "sign-51662",
            storageBucket: "sign-51662.appspot.com",
            messagingSenderId: "322522173083",
            appId: "1:322522173083:web:c275979e2fcd56afbf403e"));
  } else {
    await Firebase.initializeApp();
  }
}
