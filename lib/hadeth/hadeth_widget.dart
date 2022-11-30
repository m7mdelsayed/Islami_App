import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_details/hadeth_details.dart';

import 'hadeth_details/hadeth_model.dart';

class HadethWidget extends StatelessWidget {
HadethModel hadeth;

HadethWidget(this.hadeth);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetails.routeName,
        arguments: hadeth,
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          hadeth.title,
          style: Theme.of(context).textTheme.headline6,

        ),
      ),
    );
  }
}
