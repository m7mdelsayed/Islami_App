import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../hadeth/hadeth_details/hadeth_model.dart';

class HadethDetailsProvider extends ChangeNotifier {
  List<HadethModel> allHadeth = [];
  void readHadeth() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadethContent = fileContent.trim().split('#');
    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadeth = allHadethContent[i];
      List<String> singleHadethLines = singleHadeth.trim().split('\n');
      String title = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      String content = singleHadethLines.join('\n');
      HadethModel hadeth =
          HadethModel(title: title, content: content, index: i);
      allHadeth.add(hadeth);
    }
    notifyListeners();
  }
}
