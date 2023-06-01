
import 'package:enoughgrocery/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:enoughgrocery/firebase_helper/firebase_option/firebase_option.dart';
import 'package:enoughgrocery/home/homepage.dart';
import 'package:enoughgrocery/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

import 'screens/auth/login.dart';
// int? iniScreen;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions,);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.light(),
          home: SplashScreen()
        );
      },
    );
  }
}

