import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadeth/hadeth_details/hadeth_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'hadeth_widget.dart';

class HadethTab extends StatefulWidget {
  static const routeName = 'hadeth-tab';

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> allHadethItems = [];

  @override
  Widget build(BuildContext context) {
    if(allHadethItems.isEmpty) {
      readHadeth();
    }
    return Scaffold(
      body: allHadethItems.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Image.asset('assets/images/background_header2.png')),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  color: Theme.of(context).accentColor,
                ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 10),
                   child: Text(
                     AppLocalizations.of(context)!.alahadeth,
                    style: Theme.of(context).textTheme.headline4,
                ),
                 ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  color: Theme.of(context).accentColor,
                ),
                Expanded(
                  flex: 5,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return HadethWidget(allHadethItems[index],index);
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Theme.of(context).accentColor,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                        );
                      },
                      itemCount: allHadethItems.length),
                ),
              ],
            ),
    );
  }
  List<HadethModel> allHadeth = [];
  void readHadeth() async {
    String fileContent = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadethContent = fileContent.trim().split('#');
    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadeth = allHadethContent[i];
      List<String> singleHadethLines = singleHadeth.trim().split('\n');
      String title = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      String content = singleHadethLines.join('\n');
      HadethModel hadeth = HadethModel(title: title, content: content,index: i);
      allHadeth.add(hadeth);
    }
    setState(() {
      allHadeth = allHadethItems;
    });
  }
}
