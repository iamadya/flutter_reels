import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class VideoCamera extends StatefulWidget {
  const VideoCamera({Key? key}) : super(key: key);

  @override
  State<VideoCamera> createState() => _VideoCameraState();
}

class _VideoCameraState extends State<VideoCamera> {
  String videoUrl = '';
  File? _videoFile; // Variable to hold the captured video
  VideoPlayerController? _videoPlayerController;
  double _uploadProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = _videoFile != null ? VideoPlayerController.file(_videoFile!) : null;
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Video'),
      ),
      body: Center(
        child: Column(
          children: [
            if (_videoFile != null && _videoPlayerController != null)
              AspectRatio(
                aspectRatio: _videoPlayerController!.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController!),
              ),
            ElevatedButton.icon(
              onPressed: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? file = await imagePicker.pickVideo(source: ImageSource.camera);
                print('Path: ${file?.path}');

                if (file == null) return;
                setState(() {
                  _videoFile = File(file.path);
                  _videoPlayerController = VideoPlayerController.file(_videoFile!);
                  _videoPlayerController!.initialize().then((_) {
                    setState(() {
                      _videoPlayerController!.play();
                    });
                  });
                });
              },
              icon: Icon(Icons.videocam),
              label: Text('Record Video'),
            ),
            ElevatedButton(
              onPressed: _videoFile != null ? _startUpload : null,
              child: Text('Upload'),
            ),
            SizedBox(height: 50),
            if (_uploadProgress > 0 && _uploadProgress < 1)
              LinearProgressIndicator(value: _uploadProgress),
          ],
        ),
      ),
    );
  }

  void _startUpload() async {
    if (_videoFile == null) return;

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirVideo = referenceRoot.child('videos');
    Reference referenceVideoToUpload = referenceDirVideo.child('$uniqueFileName.mp4');

    try {
      referenceVideoToUpload.putFile(_videoFile!).snapshotEvents.listen((TaskSnapshot snapshot) {
        setState(() {
          _uploadProgress = snapshot.bytesTransferred / snapshot.totalBytes;
        });
      });

      await referenceVideoToUpload.putFile(_videoFile!);

      videoUrl = await referenceVideoToUpload.getDownloadURL();
      _showSuccessMessage();

      print('Video URL: $videoUrl');
    } catch (error) {
      print(error);
      _uploadProgress = 0.0;
    }
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Video uploaded successfully!'),
    ));
    setState(() {
      _uploadProgress = 0.0;
    });
  }
}
