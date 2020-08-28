import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

final List<String> paths = <String>[
  "assets/audios/file_example_MP3_2MG.mp3",
];

final List<Audio> audios = paths.map((e) => Audio(e)).toList();

class AudioTreinamento extends StatelessWidget {
  final String player;

  AudioTreinamento(this.player);

  void action(String path, [what = "play"]) {
    var selectedp;
    Map<bool, void Function()> playOptions = {
      player == "assets_audio_player": () async {
        selectedp = AssetsAudioPlayer();
        try {
          if (what == "play") {
            await selectedp.open(
              Audio(path),
              autoStart: true,
            );
          } else if (what == "stop") {
            selectedp.stop();
          }
        } catch (e) {
          print(e);
        }
      },
      player == "audio_cache": () async {
        selectedp = AudioCache();
        try {
          if (what == "play") {
            final result = await selectedp.play(
              path,
            );
          } else if (what == "stop") {
            selectedp.stop();
          }
          print(path);
        } catch (e) {
          print(e);
        }
      }
    };
    playOptions[true]();
  }

  @override
  Widget build(BuildContext context) {
    return this;
  }
}
