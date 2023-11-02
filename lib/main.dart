import 'package:flutter/material.dart';
import 'package:flutter_reels/other/other_screen.dart';
import 'package:flutter_reels/screens/camera_screen/camera2_screen.dart';
import 'package:flutter_reels/screens/camera_screen/camera_screen.dart';
import 'package:flutter_reels/screens/login_screen/login_screen.dart';
import 'package:flutter_reels/screens/otp_screen/otp_screen.dart';
import 'package:flutter_reels/screens/otp_screen/otp_screen2.dart';
import 'package:flutter_reels/screens/profile_screen/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // initialRoute: '/login_screen',
    routes: {
      '/': (context) => LoginScreen(),
      // '/': (context) => OtpScreen(verificationId: '',),
      // '/': (context) => OtpScreen2(verificationId: '',),


      // '/': (context) => ProfileScreen(),
      // '/': (context) => MyApp(),
      // '/': (context) => CameraScreen(),
      // '/': (context) => AddUserPage(),



      '/login_screen': (context) => LoginScreen(),
      '/otp_screen2': (context) => OtpScreen2(verificationId: '',),

      // '/otp_screen': (context) => OtpScreen(
      //       verificationId: '',
      //     ),
      '/camera_screen': (context) => CameraScreen(),
      '/profile_screen': (context) => ProfileScreen(),
    },
  ));
}
