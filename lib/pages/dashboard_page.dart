import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Welcome to YardDrive Auto",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: Text("Browse Parts"),
            ),

            ElevatedButton(
              onPressed: () {},
              child: Text("My Orders"),
            ),

            ElevatedButton(
              onPressed: () {},
              child: Text("My Vehicle"),
            ),

          ],
        ),
      ),
    );
  }
}
