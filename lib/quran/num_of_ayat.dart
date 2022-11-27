import 'package:flutter/material.dart';

class NumOfAyat extends StatelessWidget {
  String title;
  NumOfAyat(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
