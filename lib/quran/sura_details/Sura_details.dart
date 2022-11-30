import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/quran/sura_details/sura_name_args.dart';
import 'package:islami_app/quran/sura_details/verse_widget.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const routeName = 'sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String>verses=[];

  @override
  Widget build(BuildContext context) {
    SuraNameArgs args =ModalRoute.of(context)?.settings.arguments as SuraNameArgs;
    if(verses.isEmpty) {
      readFile(args.index+1);
    }
    var settingsProvider=Provider.of<SettingsProvider>(context);
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingsProvider.getMainBackgroundImage()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text('سورة ${args.title}'),
        ),
        body: Column(
          children: [
             Center(
              child: Text('بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(
              child: Card(
                elevation: 10,
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.separated(itemBuilder: (_, index) {
                    return VerseWidget(verses[index],index);
                  }, separatorBuilder: (_, __) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Theme.of(context).accentColor,
                    );
                  }, itemCount: verses.length)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> readFile(int fileIndex) async {
    String fileContent = await rootBundle.loadString('assets/files/$fileIndex.txt');
    List<String>lines=fileContent.trim().split('\n');
    setState(() {
      verses=lines;
    });
  }
}
