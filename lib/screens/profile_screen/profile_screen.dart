import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reels/screens/profile_screen/profile_postcard.dart';
import 'package:image_picker/image_picker.dart';

class Post {
  String username;

  Post({
    required this.username,
  });
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, '/login_screen');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '+91xxxxx8914',
          style: TextStyle(
            fontSize: 19,
          ),
        ),
        leading: Icon(
          Icons.lock,
          size: 20,
        ),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: false,
        leadingWidth: 50,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: () async {
              ImagePicker imagePicker = ImagePicker();
              XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
              print('${file?.path}');
            },
          ),
          IconButton(icon: const Icon(Icons.exit_to_app), onPressed: _signOut),
        ],
      ),
      body: ListView.separated(
        // padding: const EdgeInsets.all(0),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(
              // color: Colors.amber[colorCodes[index]],
              // child: Center(child: Text('Entry ${entries[index]}')),
              );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('open camera');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
