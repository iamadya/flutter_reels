import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reels/screens/otp_screen/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countryController = TextEditingController();

  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img1.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "+91 6845 684 142",
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                    verificationCompleted: (_) {},
                    verificationFailed: (FirebaseAuthException e) {
                      if (e.code == 'invalid-phone-number') {
                        print('The provided phone number is not valid.');
                      }
                    },
                    codeSent: (String verificationId, int? token) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OtpScreen(verificationId: verificationId)));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                      // Auto-resolution timed out...
                    },
                  );

                  print('code has been sent!');
                },
                child: Text("Send the code"),
              ),

              // SizedBox(
              //   width: double.infinity,
              //   height: 45,
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           primary: Colors.green.shade600,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10))),
              //       onPressed: () {
              //         auth.verifyPhoneNumber(
              //           phoneNumber: phoneNumberController.text,
              //           verificationCompleted: (_) {},
              //           verificationFailed: (FirebaseAuthException e) {
              //             if (e.code == 'invalid-phone-number') {
              //               print('The provided phone number is not valid.');
              //             }
              //           },
              //           codeSent: (String verificationId, int? token) {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => OtpScreen(
              //                         verificationId: verificationId)));
              //           },
              //           codeAutoRetrievalTimeout: (String verificationId) {
              //             // Auto-resolution timed out...
              //           },
              //         );
              //       },
              //       child: ElevatedButton(
              //         onPressed: () {
              //           print('code has been sent!');
              //         },
              //         child: Text("Send the code"),
              //       )),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
