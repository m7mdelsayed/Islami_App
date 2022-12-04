import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/quran/quran_tab.dart';
import 'package:islami_app/radio/radio_tab.dart';
import 'package:islami_app/settings/settings_tab.dart';
import 'package:islami_app/tasbeh/tasbeh_tab.dart';
import 'package:provider/provider.dart';
import 'hadeth/hadeth_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      QuranTab(),
      HadethTab(),
      TasbehTab(),
      RadioTab(),
      SettingTab()
    ];
    List<String> titles = [
      AppLocalizations.of(context)!.quran,
      AppLocalizations.of(context)!.hadeth,
      AppLocalizations.of(context)!.tasbeh,
      AppLocalizations.of(context)!.radio,
      AppLocalizations.of(context)!.settings
    ];
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingsProvider.getMainBackgroundImage()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(titles[selectedIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: AppLocalizations.of(context)!.quran_single,
              icon: const ImageIcon(
                AssetImage('assets/images/ic_quran.png'),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: AppLocalizations.of(context)!.hadeth_single,
              icon: const ImageIcon(
                AssetImage('assets/images/ic_hadeth.png'),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: AppLocalizations.of(context)!.tasbeh,
              icon: const ImageIcon(
                AssetImage('assets/images/ic_sebha.png'),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: AppLocalizations.of(context)!.radio,
              icon: const ImageIcon(
                AssetImage('assets/images/ic_radio.png'),
              ),
            ),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                label: AppLocalizations.of(context)!.settings,
                icon: const Icon(
                  Icons.settings,
                  size: 25,
                )),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
}
