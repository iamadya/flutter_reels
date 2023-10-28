import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

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
                fit: BoxFit.cover),
            decoration: BoxDecoration(
              // color: Colors.red,
              // borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          )),
      Container(
        margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
        alignment: Alignment.centerLeft,
        child: Text(
          'dummy caption....',
        ),
      ),
    ]);
  }
}