import 'package:flutter/material.dart';

void main() {
  runApp(YardDriveApp());
}

class YardDriveApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "YardDrive Auto",

      home: Scaffold(
        appBar: AppBar(title: Text("YardDrive Auto")),
        body: Center(
          child: Text(
            "Auto Parts Service App",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );

  }
}
