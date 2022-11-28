import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_args.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';

class HadethWidget extends StatelessWidget {
String title;
int index;
String content;

HadethWidget(this.title,this.index,this.content);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetails.routeName,
        arguments: HadethArgs(title, index,content),
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
