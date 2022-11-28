import 'package:flutter/material.dart';

class HadethContentWidget extends StatelessWidget {
String content;
HadethContentWidget(this.content);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 25),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
