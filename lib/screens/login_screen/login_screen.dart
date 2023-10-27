import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Column(
          children: <Widget> [
            // Text('login Screen'),
            TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/profile');
                Navigator.pushNamed(context, '/profile_screen');
              },
              child: Text('go to profile'),
            ),
          ]
        ),
      );
  }
}