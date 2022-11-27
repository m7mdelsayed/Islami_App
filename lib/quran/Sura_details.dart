import 'package:flutter/material.dart';
import 'package:islami_app/quran/sura_name_args.dart';

class SuraDetails extends StatelessWidget {
  static const routeName = 'sura_details';

  @override
  Widget build(BuildContext context) {
    SuraNameArgs args =ModalRoute.of(context)?.settings.arguments as SuraNameArgs;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Islami'),
        ),
        body: Card(
          color: Colors.white,
          elevation: 5,
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              Text('سورة ${args.title}',style:const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: Theme.of(context).primaryColor,
          ),

            ],
          ),
        ),
      ),
    );
  }
}
