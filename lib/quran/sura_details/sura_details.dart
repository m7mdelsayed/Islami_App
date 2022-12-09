import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/providers/sura_details_provider.dart';
import 'package:islami_app/quran/sura_details/sura_name_args.dart';
import 'package:islami_app/quran/sura_details/verse_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuraDetails extends StatefulWidget {
  static const routeName = 'sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    SuraNameArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraNameArgs;
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..readFile(args.index + 1),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBackgroundImage()),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title:
                  Text('${AppLocalizations.of(context)!.sura} ${args.title}'),
            ),
            body: provider.verses.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Center(
                        child: Text(
                          'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: Theme.of(context).colorScheme.surface,
                          elevation: 10,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 30),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: ListView.separated(
                                itemBuilder: (_, index) {
                                  return VerseWidget(
                                      provider.verses[index], index);
                                },
                                separatorBuilder: (_, __) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    width: MediaQuery.of(context).size.width,
                                    height: 1,
                                    color: Theme.of(context).colorScheme.secondary,
                                  );
                                },
                                itemCount: provider.verses.length),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
