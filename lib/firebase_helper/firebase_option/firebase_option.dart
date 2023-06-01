import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig{
  static FirebaseOptions get platformOptions{
    if(Platform.isIOS){
      return FirebaseOptions(apiKey: "AIzaSyB06-yAmESbORcQnIfpacbZVfweFa9ZsPg", appId: "1:1083423471437:ios:3c7a59ee1bb191e54e6904", messagingSenderId: "1083423471437", projectId: "enoughgrocery");
    }
    else{
      return FirebaseOptions(apiKey: "AIzaSyAkcK8JIGfxMck3pHP1enoDsPm2rUCrWfk", appId: "1:1083423471437:android:057ae41b7d9acf6d4e6904", messagingSenderId: "1083423471437", projectId: "enoughgrocery");
    }
  }
}