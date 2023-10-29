// Importing necessary packages
import 'package:flutter/material.dart'; // Flutter Material package
import 'dart:io'; // Input-output operations
import 'package:image_picker/image_picker.dart'; // Image picker package

// MyApp StatefulWidget class
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key); // Constructor for MyApp

  @override
  State<MyApp> createState() => _MyAppState(); // Creating the state for MyApp
}

// State class for MyApp
class _MyAppState extends State<MyApp> {
  File? _image; // Variable to hold the selected image file

  // Method to get an image from the camera or gallery
  Future getImage(bool isCamera) async {
    File image; // Variable to store the selected image
    if (isCamera) {
      // If user chooses to take a picture from the camera
      print('Camera is present');
      image =
          (await ImagePicker().pickImage(source: ImageSource.camera)) as File;
      print('this is image ${image}');
    } else {
      // If user chooses to select an image from the gallery
      print('Camera is in else');

      image =
          (await ImagePicker().pickImage(source: ImageSource.gallery)) as File;
    }

  // Future getImage2(bool isCamera) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image;
  //   // File image; // Variable to store the selected image
  //   if (isCamera) {
  //     // If user chooses to take a picture from the camera
  //     image = await picker.pickImage(source: ImageSource.camera);
  //     print('Camera is present');
  //     print('before setState ${image?.lastModified()}');
  //   } else {
  //     // If user chooses to select an image from the gallery
  //     print('Camera is in else');
  //
  //     image = await picker.pickImage(source: ImageSource.gallery);
  //   }
  //
  //   print('function done');
  //
  //   setState(() {
  //     _image = image as File?;
  //     // Setting the selected image to the _image variable
  //   });
  //   print('after setState ${_image}');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Demo'), // App bar title
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // Button to pick an image from the gallery
            IconButton(
              icon: Icon(Icons.insert_drive_file),
              onPressed: () {
                getImage2(false);
              },
            ),
            SizedBox(height: 10), // Spacer
            // Button to capture an image from the camera
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                getImage2(true);
              },
            ),
            _image == null
                ? Container() // Placeholder when no image is selected
                : Image.file(_image! as File,
                    height: 300, width: 300), // Display selected image
          ],
        ),
      ),
    );
  }
}
