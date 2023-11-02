import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> addUserToFirebase() async {
    String name = nameController.text;
    String email = emailController.text;

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference users = firestore.collection('users');

      await users.doc(email).set({
        'name': name,
        'email': email,
      });

      print('User added to Firebase collection');
    } catch (e) {
      print('Error adding user to Firebase: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User to Firebase'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addUserToFirebase();
              },
              child: Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}
