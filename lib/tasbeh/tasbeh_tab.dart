import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';

class TasbehTab extends StatefulWidget {
  static const String routeName = 'tasbeh-tab';

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  String dropDownValue = 'سبحان الله';
  List<String> dropDownItems = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
    'لا حول ولا قوة إلا بالله'
  ];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: InkWell(
              onTap: (){
                setState(() {
                  counter++;
                });
                if(counter==33){
                  counter=0;
                }
              },
              child: Image.asset(
                'assets/images/sebha.png',
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child:  Text(
                    'عدد التسبيحات',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Theme.of(context).accentColor),
                  ),
                  child: Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Theme.of(context).accentColor)
                  ),
                  child: DropdownButton(
                    dropdownColor: Theme.of(context).primaryColor,
                    underline: const SizedBox(),
                    style: Theme.of(context).textTheme.headline6,
                    value: dropDownValue,
                    icon:  Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).accentColor
                    ),
                    items: dropDownItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                        counter=0;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
