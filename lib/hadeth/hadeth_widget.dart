import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_details/hadeth_details.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import 'hadeth_details/hadeth_model.dart';

class HadethWidget extends StatelessWidget {
HadethModel hadeth;
int index;

HadethWidget(this.hadeth,this.index);
  @override
  Widget build(BuildContext context) {
    var settingsProvider =Provider.of<SettingsProvider>(context);
    List<String>hadethName=[
      "First Hadith","Second Hadith","Third Hadith","Fourth Hadith","Fifth Hadith",
      "Sixth Hadith","Seventh Hadith","Eighth Hadith","Ninth Hadith","Tenth Hadith",
      "Eleventh Hadith","Twelfth Hadith","Thirteenth Hadith","Fourteenth Hadith",
      "Fifteenth Hadith","Sixteenth Hadith","Seventeenth Hadith","Eighteenth Hadith",
      "Nineteenth Hadith","Twentieth Hadith","Twenty-First Hadith","Twenty-Second Hadith",
      "Twenty-Third Hadith","Twenty-Fourth Hadith","Twenty-Fifth Hadith","Twenty-Sixth Hadith",
      "Twenty-Seventh Hadith","Twenty-Eighth Hadith","Twenty-Ninth Hadith","Thirtieth Hadith",
      "Thirty-First Hadith","Thirty-Second Hadith","Thirty-Third Hadith","Thirty-Fourth Hadith",
      "Thirty-Fifth Hadith","Thirty-Sixth Hadith","Thirty-Seventh Hadith","Thirty-Eighth Hadith",
      "Thirty-Ninth Hadith"," Fortieth Hadith","Forty-First Hadith","Forty-Second Hadith",
      "Forty-Third Hadith","Forty-Fourth Hadith","Forty-Fifth Hadith","Forty-Sixth Hadith",
      "Forty-Seventh Hadith","Forty-Eighth Hadith","Forty-Ninth Hadith","Fiftieth Hadith"
    ];
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetails.routeName,
        arguments: hadeth,
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          settingsProvider.isArabic()
              ? hadeth.title
              : hadethName[index]
          ,
          style: Theme.of(context).textTheme.headline6,

        ),
      ),
    );
  }
}
