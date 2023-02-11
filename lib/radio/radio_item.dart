import 'package:flutter/material.dart';
import 'package:islami_app/api/Model/RadioResponse.dart';

class RadioItem extends StatelessWidget {
  RadioResponse? radio;
  int? index;
  Future<dynamic>? play;
  Future<dynamic>? pause;

  RadioItem(
      {required this.radio,
      required this.index,
      required this.play,
      required this.pause});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            radio?.radios?[index!].name ?? '',
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  await play;
                },
                icon: Icon(
                  Icons.play_arrow,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 50,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await pause;
                },
                icon: Icon(
                  Icons.pause,
                  color: Theme.of(context).colorScheme.secondary,
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
