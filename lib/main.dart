import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'services/auth_service.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(YardDriveApp());
}

class YardDriveApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = AuthService().currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "YardDrive Auto",

      home: user == null ? LoginPage() : DashboardPage(),
    );
  }
}
