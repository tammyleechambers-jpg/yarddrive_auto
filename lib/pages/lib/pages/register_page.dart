import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'dashboard_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  bool loading = false;

  // 🔹 Firebase registration function
  void register() async {

    if (password.text != confirmPassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match"))
      );
      return;
    }

    setState(() {
      loading = true;
    });

    final user = await AuthService().register(
      email.text.trim(),
      password.text.trim(),
    );

    setState(() {
      loading = false;
    });

    if (user != null) {
      // Navigate to Dashboard after registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => DashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
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

            TextField(
              controller: confirmPassword,
              decoration: InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
            ),

            SizedBox(height: 20),

            loading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: register,
                  child: Text("Register"),
                ),

            SizedBox(height: 10),

            TextButton(
              onPressed: () {
                Navigator.pop(context); // Go back to login page
              },
              child: Text("Already have an account? Login"),
            ),

          ],
        ),
      ),
    );
  }
}
