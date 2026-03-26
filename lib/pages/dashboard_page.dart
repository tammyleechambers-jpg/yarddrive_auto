import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_page.dart';
import 'parts_page.dart';
import 'orders_page.dart';
import 'vehicle_page.dart';

class DashboardPage extends StatelessWidget {

  void logout(BuildContext context) async {
    await AuthService().logout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {

    final user = AuthService().currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => logout(context),
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Welcome ${user?.email ?? ""}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 30),

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
