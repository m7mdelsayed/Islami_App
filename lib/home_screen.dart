import 'package:flutter/material.dart';
import 'package:islami_app/quran/quran_tab.dart';
import 'package:islami_app/radio/radio_tab.dart';
import 'package:islami_app/tasbeh/tasbeh_tab.dart';
import 'hadeth/hadeth_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  List<Widget>tabs=[QuranTab(),HadethTab(),TasbehTab(),RadioTab()];
  List<String>titles=['القرآن الكريم','الحديث الشريف','السبحة','الراديو'];


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(titles[selectedIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
         currentIndex: selectedIndex,
          onTap: (newIndex){
           setState(() {
             selectedIndex=newIndex;
           });
          },
          items:  [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Quran',
              icon: const ImageIcon(
                AssetImage('assets/images/ic_quran.png'),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Hadeth',
              icon: const ImageIcon(
                AssetImage('assets/images/ic_hadeth.png'),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Tasbeh',
              icon: const ImageIcon(
                AssetImage('assets/images/ic_sebha.png'),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Radio',
              icon: const ImageIcon(
                AssetImage('assets/images/ic_radio.png'),
              ),
            ),
          ],
        ),
        body:tabs[selectedIndex] ,
      ),
    );
  }

}
