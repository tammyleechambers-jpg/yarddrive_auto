import 'package:flutter/material.dart';
import 'parts_page.dart';
import 'orders_page.dart';
import 'vehicle_page.dart';

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

            // Navigate to Parts Page
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PartsPage()),
                );
              },
              child: Text("Browse Parts"),
            ),

            SizedBox(height: 10),

            // Navigate to Orders Page
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => OrdersPage()),
                );
              },
              child: Text("My Orders"),
            ),

            SizedBox(height: 10),

            // Navigate to Vehicle Page
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VehiclePage()),
                );
              },
              child: Text("My Vehicle"),
            ),

          ],
        ),
      ),
    );
  }
}
