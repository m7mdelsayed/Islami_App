import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
          const SizedBox(
            height: 15,
          ),
          Text(
            AppLocalizations.of(context)!.radio_text,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous,
                  color: Theme.of(context).accentColor,
                  size: 50,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  color: Theme.of(context).accentColor,
                  size: 50,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_next,
                  color: Theme.of(context).accentColor,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
