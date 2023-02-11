import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/Model/RadioResponse.dart';
import 'package:islami_app/api/api_manager.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/radio/radio_item.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 3, child: Image.asset(settingsProvider.getRadioImage())),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 2,
            child: FutureBuilder<RadioResponse>(
              future: ApiManager.getRadio(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Text('Something Went Wrong');
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RadioItem(
                      radio: snapshot.data,
                      index: index,
                      play: play(snapshot.data?.radios?[index].url ?? ''),
                      pause: pause(),
                    );
                  },
                  itemCount: snapshot.data?.radios?.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  play(String url) async {
    int result = await audioPlayer.play(url);
  }

  pause() async {
    await audioPlayer.pause();
  }
}
