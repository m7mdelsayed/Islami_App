import 'package:flutter/material.dart';
import 'package:islami_app/quran/sura_details/Sura_details.dart';
import 'package:islami_app/quran/sura_details/sura_name_args.dart';

class SuraNameWidget extends StatelessWidget {
  String title;
  int index;
  SuraNameWidget(this.title,this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetails.routeName,
        arguments: SuraNameArgs(title: title,index: index),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.center,
        width: 80,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6
        ),
      ),
    );
  }
}
