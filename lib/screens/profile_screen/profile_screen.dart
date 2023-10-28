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
            onPressed: () {
              print('camera opened');
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushNamed(context, '/login_screen');
            },
          ),
        ],
      ),

      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Row(
            children: <Widget> [
              Icon(Icons.person),
              Text('Name'),
            ],
          ),
        ),
        Container(
          child: Text('location'),
        ),
        SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.width,
            child: DecoratedBox(
              child: Text('John Doe'),
              decoration: BoxDecoration(
                color: Colors.red,
                // borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            )),
      ]
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
