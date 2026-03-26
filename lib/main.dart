import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(YardDriveApp());
}

class YardDriveApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "YardDrive Auto",

      // 🔹 Start app with Splash Page
      home: SplashPage(),

      // 🔹 Add global theme (can be toggled later)
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
