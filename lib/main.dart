import 'package:flutter/material.dart';
import 'package:flutter_reels/screens/camera_screen/camera2_screen.dart';
import 'package:flutter_reels/screens/login_screen/login_screen.dart';
import 'package:flutter_reels/screens/otp_screen/otp_screen.dart';
import 'package:flutter_reels/screens/profile_screen/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

<<<<<<< Updated upstream
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/login_screen',
      routes: {
        // '/': (context) => LoginScreen(),
        // '/': (context) => OtpScreen(),
        // '/': (context) => ProfileScreen(),
        '/': (context) => MyApp(),
=======

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FireBa
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // initialRoute: '/login_screen',
    routes: {
      // '/': (context) => LoginScreen(),
      // '/': (context) => OtpScreen(),
      '/': (context) => ProfileScreen(),

      '/profile_screen': (context) => ProfileScreen(),
      // '/login_screen': (context) => LoginScreen(),
      '/otp_screen': (context) => OtpScreen(),
    },
  ));
}
>>>>>>> Stashed changes

        '/profile_screen': (context) => ProfileScreen(),
        // '/login_screen': (context) => LoginScreen(),
        '/otp_screen': (context) => OtpScreen(),
      },
    ));
