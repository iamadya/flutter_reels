import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reels/screens/profile_screen/profile_postcard.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Post {
  String username;
  String imageUrl;

  Post({
    required this.username,
    required this.imageUrl,
  });
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Post> posts = [
    Post(username: 'User1', imageUrl: 'url_for_user1_image'),
    // Post(username: 'User2', imageUrl: 'url_for_user2_image'),
    // Add more Post objects with respective usernames and image URLs
  ];

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, '/login_screen');
      Fluttertoast.showToast(
        msg: "Signed out",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
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
            onPressed: () {
              Navigator.pushNamed(context, '/camera_screen2');
            },
          ),
          IconButton(icon: const Icon(Icons.exit_to_app), onPressed: _signOut
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(imageUrl: posts[index].imageUrl);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
