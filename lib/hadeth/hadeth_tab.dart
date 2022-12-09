import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/hadeth_details_provider.dart';
import 'hadeth_widget.dart';

class HadethTab extends StatefulWidget {
  static const routeName = 'hadeth-tab';

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HadethDetailsProvider()..readHadeth(),
      builder: (context, child) {
        var provider = Provider.of<HadethDetailsProvider>(context);
        return Scaffold(
          body: provider.allHadeth.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Image.asset(
                            'assets/images/background_header2.png'),),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        AppLocalizations.of(context)!.alahadeth,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    Expanded(
                      flex: 5,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return HadethWidget(
                                provider.allHadeth[index], index);
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: Theme.of(context).colorScheme.secondary,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 25),
                            );
                          },
                          itemCount: provider.allHadeth.length),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
