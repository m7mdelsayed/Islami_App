import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier{
  List<String>verses=[];

  void readFile(int fileIndex) async {
    String fileContent = await rootBundle.loadString('assets/files/$fileIndex.txt');
    List<String>lines=fileContent.trim().split('\n');
      verses=lines;
      notifyListeners();
  }
}