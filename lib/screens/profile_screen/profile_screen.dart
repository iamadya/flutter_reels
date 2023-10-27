import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: Column(children: <Widget>[
        
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('open camera');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
