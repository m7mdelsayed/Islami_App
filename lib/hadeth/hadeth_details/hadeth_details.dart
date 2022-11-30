import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_details/hadeth_model.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'hadeth_content_widget.dart';

class HadethDetails extends StatefulWidget {
  static const routeName = 'hadeth-details';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    HadethModel args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    var settingsProvider=Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingsProvider.getMainBackgroundImage()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Card(
            elevation: 10,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(
                color: Theme.of(context).accentColor,
                width: 2,
              ),
            ),
            child: SingleChildScrollView(child: HadethContentWidget(args.content)),
          ),
        ),
      ),
    );
  }
}
