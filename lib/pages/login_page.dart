import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'dashboard_page.dart';
import 'register_page.dart'; // 🔹 Import Registration Page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();
  final password = TextEditingController();

  bool loading = false;

  // 🔹 Firebase login function
  void login() async {
    setState(() {
      loading = true;
    });

    final user = await AuthService().login(
      email.text.trim(),
      password.text.trim(),
    );

    setState(() {
      loading = false;
    });

    if (user != null) {
      // Navigate to Dashboard after login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => DashboardPage()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed. Check credentials."))
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Login")),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: password,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),

            SizedBox(height: 20),

            loading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: login,
                  child: Text("Login"),
                ),

            SizedBox(height: 10),

            // 🔹 Updated button to open Registration Page
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterPage()),
                );
              },
              child: Text("Don't have an account? Register"),
            ),

          ],
        ),
      ),
    );
  }
}
