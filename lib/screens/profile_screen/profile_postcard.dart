import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String imageUrl;

  PostCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Display the image using the provided URL
          Image.network(
            'https://firebasestorage.googleapis.com/v0/b/flutter-reels-47ce4.appspot.com/o/images%2F1698931401667?alt=media&token=687888d0-2c5a-4c2e-9893-a7939a55e688',
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ],
      ),
    );
  }
}
