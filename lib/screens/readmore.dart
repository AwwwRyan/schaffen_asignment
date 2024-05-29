import 'package:flutter/material.dart';

class readmore extends StatefulWidget {
  final String text;
  const readmore({required this.text, Key? key}) : super(key: key);

  @override
  _readmoreState createState() => _readmoreState();
}

class _readmoreState extends State<readmore> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final displayText =
        _isExpanded ? widget.text : widget.text.substring(0, 250);
    final isLongText = widget.text.length > 50;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
        ),
        if (isLongText)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'Read Less' : '...Read More',
              style: TextStyle(color: Color(0xFFEF456F)),
            ),
          ),
      ],
    );
  }
}
