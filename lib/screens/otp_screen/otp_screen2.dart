import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen2 extends StatelessWidget {
  const OtpScreen2({super.key, required String verificationId});

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
                'assets/images/img2.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Verification OTP",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "OTP has been sent to your phone",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.black,
                fieldWidth: 40,
                borderRadius: BorderRadius.all(Radius.circular(11)),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  Navigator.pushNamed(context, '/profile_screen');
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              SizedBox(
                height: 20,
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
