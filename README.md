import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // import login screen

void main() {
  runApp(YardDriveApp());
}

class YardDriveApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "YardDrive Auto",

      home: LoginPage(), // app starts at login screen
    );

  }
}
