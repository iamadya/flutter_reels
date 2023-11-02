import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                width: 160,
                height: 160,
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
                          title: Text("Successfully Signed in",
                              style: TextStyle(fontSize: 22)),
                        );
                      });
                }, // end onSubmit
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
