import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../otp_screen/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

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
                'assets/images/img3.png',
                width: 160,
                height: 160,
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
                "Let's get you registered!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      textAlign: TextAlign.center,
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "+91 6845684142",
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                    verificationCompleted: (_) {},
                    verificationFailed: (FirebaseAuthException e) {
                      setState(() {
                        isLoading = false;
                      });
                      if (e.code == 'invalid-phone-number') {
                        print('The provided phone number is not valid.');
                      }
                    },
                    codeSent: (String verificationId, int? token) {
                      setState(() {
                        isLoading = true;
                      });
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
                child: isLoading
                    ? SizedBox(
                        child: CircularProgressIndicator(),
                        height: 20,
                        width: 20,
                      )
                    : Text("Send code"),
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
