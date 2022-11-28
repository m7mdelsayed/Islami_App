import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadeth/hadeth_model.dart';

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
                  color: Theme.of(context).primaryColor,
                ),
                const Text(
                  'الأحاديث',
                  style: TextStyle(fontSize: 24),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(
                  flex: 5,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return HadethWidget(allHadethItems[index].title,index,allHadethItems[index].content);
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Theme.of(context).primaryColor,
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
  Future<void> readHadeth() async {
    var fileContent = await rootBundle.loadString('assets/files/ahadeth.txt');
    var allHadethContent = fileContent.trim().split('#');
    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadethContent = allHadethContent[i];
      var singleHadethLines = singleHadethContent.trim().split('\n');
      String title = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      String content = singleHadethLines.join('\n');
      HadethModel hadeth = HadethModel(title: title, content: content);
      allHadeth.add(hadeth);
    }
    setState(() {
      allHadeth = allHadethItems;
    });
  }
}
