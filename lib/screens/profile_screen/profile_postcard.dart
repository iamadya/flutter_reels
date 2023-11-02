import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  // TextEditingController _controllerTitle = TextEditingController();
  // TextEditingController _controllerDescription = TextEditingController();
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('Reels');

  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Row(
          children: <Widget>[
            Icon(Icons.person),
            SizedBox(width: 8),
            Text('Name'),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
        alignment: Alignment.centerLeft,
        child: Text('location'),
      ),
      SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/900px-Instagram_logo_2022.svg.png',
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
                // color: Colors.red,
                // borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
          )),
      Container(
        margin: EdgeInsets.fromLTRB(10, 5, 20, 5),
        alignment: Alignment.centerLeft,
        child: Column(children: <Widget>[
          ElevatedButton(
              onPressed: () {
                print('data uploaded');
              },
              child: Text('upload')),
        ]),
      ),
    ]);
  }
}
