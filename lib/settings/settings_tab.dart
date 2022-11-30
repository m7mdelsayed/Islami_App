import 'package:flutter/material.dart';
import 'package:islami_app/settings/language_bottom_sheet.dart';
import 'package:islami_app/settings/theme_bottom_sheet.dart';

class SettingTab extends StatefulWidget {
static const String routeName='settings-tab';

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Theme',style: Theme.of(context).textTheme.subtitle2,),
          const SizedBox(height: 8,),
          InkWell(
            onTap: (){
                showThemeBottomSheet();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                  width: 1,
                ),
              ),
              child: Text('Light',style: Theme.of(context).textTheme.headline6,),
            ),
          ),
          const SizedBox(height: 24,),
          Text('Language',style: Theme.of(context).textTheme.subtitle2,),
          const SizedBox(height: 8,),
          InkWell(
            onTap: (){
                showLanguageBottomSheet();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Theme.of(context).accentColor,
                  width: 1,
                ),
              ),
              child: Text('English',style: Theme.of(context).textTheme.headline6,),
            ),
          ),

        ],
      ),

    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (buildContext ){
      return ThemeBottomSheet();
    });
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (buildContext ){
      return LanguageBottomSheet();
    });
  }
}
