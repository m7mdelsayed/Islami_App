import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_details/hadeth_model.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'hadeth_content_widget.dart';


class HadethDetails extends StatefulWidget {
  static const routeName = 'hadeth-details';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
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
    HadethModel args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    var settingsProvider=Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingsProvider.getMainBackgroundImage()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              settingsProvider.isArabic()
              ? args.title
              : hadethName[args.index]),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Card(
            elevation: 10,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(
                color: Theme.of(context).accentColor,
                width: 2,
              ),
            ),
            child: SingleChildScrollView(child: HadethContentWidget(args.content)),
          ),
        ),
      ),
    );
  }
}
