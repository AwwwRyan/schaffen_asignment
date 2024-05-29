import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class albums extends StatelessWidget {
  final albumimage;
  const albums({super.key, this.albumimage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      color: Colors.blue, // Example color, you can customize as needed
      margin: EdgeInsets.all(5.0),
      child: Image.asset(
        albumimage, // Local image path
        fit: BoxFit.cover, // Adjust the fit as needed
      ),
    );
  }
}
