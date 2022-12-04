import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  static const String routeName = 'tasbeh-tab';

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  int currentIndex = 0;
  double angle = 0;
  String azkar = "";

  @override
  Widget build(BuildContext context) {
    List<String> dropDownItems = [
      AppLocalizations.of(context)!.subhan_allah,
      AppLocalizations.of(context)!.alhamd_le_allah,
      AppLocalizations.of(context)!.la_elah_ela_allah,
      AppLocalizations.of(context)!.allah_akbar,
      AppLocalizations.of(context)!.la_hawl_wla_kwa,
    ];
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.48,
            child: Stack(
              children: [
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset('assets/images/sebha_header_light.png'),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        counter++;
                        angle--;
                        if (counter == 5) {
                          counter = 0;
                          currentIndex++;
                          if (currentIndex >= dropDownItems.length) {
                            currentIndex = 0;
                          }
                        }
                      });
                    },
                    child: Transform.rotate(
                        angle: angle,
                        child: Image.asset('assets/images/sebha_body_light.png')),
                  ),
                ),
              ],
            ),
          ),
          Text(
            AppLocalizations.of(context)!.num_of_tasbehat,
            style: Theme.of(context).textTheme.headline4,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Theme.of(context).accentColor),
            ),
            child: Text(
              '$counter',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Theme.of(context).accentColor)),
            child: DropdownButton(
              dropdownColor: Theme.of(context).primaryColor,
              underline: const SizedBox(),
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.white,
                  ),
              value: azkar.isNotEmpty ? azkar : dropDownItems[currentIndex],
              icon: Icon(Icons.keyboard_arrow_down,
                  color: settingsProvider.isDarkMode()
                      ? Theme.of(context).accentColor
                      : Colors.black),
              items: dropDownItems.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  azkar = newValue!;
                  // dropDownItems[currentIndex] = newValue!;
                  counter = 0;
                });
              },

            ),
          ),
        ],
      ),
    );
  }
}
