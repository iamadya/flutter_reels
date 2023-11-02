import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraScreen2 extends StatefulWidget {
  const CameraScreen2({Key? key}) : super(key: key);

  @override
  State<CameraScreen2> createState() => _CameraScreen2State();
}

class _CameraScreen2State extends State<CameraScreen2> {
  String imageUrl = '';
  File? _imageFile; // Variable to hold the captured image
  double _uploadProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageFile != null) // Display the captured image if available
              Image.file(_imageFile!),
            ElevatedButton.icon(
              onPressed: () async {
                // pick image using image picker
                ImagePicker imagePicker = ImagePicker();
                XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
                print('Path: ${file?.path}');

                if (file == null) return;
                setState(() {
                  _imageFile = File(file.path); // Update the captured image
                });
              },
              icon: Icon(Icons.camera_alt),
              label: Text('Camera'),
            ),
            ElevatedButton(
              onPressed: _imageFile == null ? null : _startUpload,
              child: Text('Upload'),
            ),
            if (_uploadProgress > 0 && _uploadProgress < 1)
              LinearProgressIndicator(value: _uploadProgress),
          ],
        ),
      ),
    );
  }

  void _startUpload() async {
    if (_imageFile == null) return;

    // unique name
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    //upload the file on firebase storage
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('images');
    Reference referenceImageToUpload = referenceDirImage.child(uniqueFileName);

    try {
      // Update state to show progress indicator
      referenceImageToUpload.putFile(_imageFile!).snapshotEvents.listen((TaskSnapshot snapshot) {
        setState(() {
          _uploadProgress = snapshot.bytesTransferred / snapshot.totalBytes;
        });
      });

      // Store the file
      await referenceImageToUpload.putFile(_imageFile!);

      // Success: get the download URL
      imageUrl = await referenceImageToUpload.getDownloadURL();
      _showSuccessMessage();
    } catch (error) {
      print(error);
      _uploadProgress = 0.0; // Reset the progress if there's an error
    }
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Image uploaded successfully!'),
    ));
    setState(() {
      _uploadProgress = 0.0; // Reset the progress after success
    });
  }
}