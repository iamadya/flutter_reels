import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: SafeArea(
        child: Column(
            children: <Widget> [
              // Text('Profile Screen'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login_screen');
                },
                child: Text('signout'),
              ),
            ]
        ),
      ),
    );
  }
}