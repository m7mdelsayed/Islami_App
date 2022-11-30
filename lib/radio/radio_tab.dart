import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  static const routeName = 'quran-tab';

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(settingsProvider.getRadioImage()),
          const SizedBox(height: 15,),
          Text(
            'إذاعة القرآن الكريم',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.skip_previous,
                color: Theme.of(context).accentColor,
                size: 50,
              ),
              Icon(
                Icons.play_arrow,
                color: Theme.of(context).accentColor,
                size: 50,
              ),
              Icon(
                Icons.skip_next,
                color: Theme.of(context).accentColor,
                size: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
