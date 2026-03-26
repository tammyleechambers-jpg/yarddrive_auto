import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController(); // email input
  final password = TextEditingController(); // password input

  bool loading = false;

  void login() {

    setState(() {
      loading = true;
    });

    // TODO: connect Firebase login

    Future.delayed(Duration(seconds: 2), (){
      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Demo Success"))
      );
    });

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
                )

          ],
        ),
      ),
    );
  }
}
