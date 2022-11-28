import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_args.dart';
import 'hadeth_content_widget.dart';

class HadethDetails extends StatefulWidget {
  static const routeName = 'hadeth-details';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    HadethArgs args = ModalRoute.of(context)?.settings.arguments as HadethArgs;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Card(
          color: Colors.white,
          elevation: 10,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return HadethContentWidget(args.content);
            },
            itemCount: 1,
          ),
        ),
      ),
    );
  }
}
