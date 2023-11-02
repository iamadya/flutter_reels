import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  String imageUrl = '';
  File? _imageFile; // Variable to hold the captured image
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload video'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () async {
                  // pick image using image picker
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  print('Path: ${file?.path}');

                  if (file == null) return;
                  setState(() {
                    _imageFile = File(file.path); // Update the captured image
                  });
                  // unique name
                  String uniqueFileName =
                      DateTime.now().millisecondsSinceEpoch.toString();
                  //upload the file on firebase storage

                  // get the reference to file or folder
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImage = referenceRoot.child('images');

                  // Create a reference for the image to be stored
                  Reference referenceImageToUpload =
                      referenceDirImage.child(uniqueFileName);

                  // Handle errors/success
                  try {
                    // Store the file
                    await referenceImageToUpload.putFile(File(file!.path));
                    // Success: get the download URL
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  } catch (error) {
                    print(error);
                  }
                },
                icon: Icon(Icons.camera_alt),
                label: Text('camera')),
            ElevatedButton(onPressed: (){}, child: Text('upload')),
          ],
        ),
      ),
    );
  }
}
