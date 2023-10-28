import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/img1.png', width: 160, height: 160),
              SizedBox(height: 25),
              // Row(
              //   children: <Widget> [
              //     SizedBox(
              //       width: 40,
              //       child: TextField(),
              //     ),
              //     SizedBox(width: 10),
              //     Expanded(
              //       child: TextField(),
              //     ),
              //     TextField(),
              //   ],
              // ),
              Text(
                'Phone Verification',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Register your phone number!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Send code',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow.shade800)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
