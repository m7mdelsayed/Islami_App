import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/quran/sura_name_args.dart';
import 'package:islami_app/quran/verse_widget.dart';

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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text('سورة ${args.title}'),
        ),
        body: Column(
          children: [
            const Center(
              child: Text('بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.white,
                elevation: 10,
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                shape: RoundedRectangleBorder(
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
                      color: Theme.of(context).primaryColor,
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
