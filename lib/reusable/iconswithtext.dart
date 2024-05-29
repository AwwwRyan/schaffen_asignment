import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color iconColor;
  final double iconSize;
  final TextStyle textStyle;

  IconWithText({
    required this.iconData,
    required this.text,
    this.iconColor = Colors.black,
    this.iconSize = 24.0,
    this.textStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
      ),
      onPressed: () {  },
      child: Row(
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: iconSize,
          ),
          SizedBox(width: 8.0), // Add some space between the icon and the text
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
