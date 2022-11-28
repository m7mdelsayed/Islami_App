import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
String content;
int index;
VerseWidget(this.content,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 25),
      alignment: Alignment.center,
      child: Text(
        '$content [${index+1}]',
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
