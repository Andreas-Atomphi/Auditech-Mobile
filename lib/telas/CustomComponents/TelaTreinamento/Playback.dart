import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

final List<String> examples = <String>[
  "assets/audios/file_example_MP3_2MG.mp3",
]; // Áudios da pasta exemplos

final List<String> exercicios = <String>[
  "audios/Exercicios/10_sequencia_animais.mp3",
  "audios/Exercicios/11_sequencia_instrumentos.mp3",
  "audios/Exercicios/12_sequencia_natureza.mp3",
  "audios/Exercicios/13_corpo_humano.mp3",
  "audios/Exercicios/14_sequencia_transporte.mp3",
  "audios/Exercicios/15_sequencia_casa.mp3",
];

// final List<Audio> audios = examples.map((e) => Audio(e)).toList();

enum Players {
  AAP,
  AC,
}

extension PlayersFullName on Players {
  dynamic get playerComponent {
    switch (this) {
      case Players.AAP:
        return AssetsAudioPlayer();
        break;
      case Players.AC:
        return AudioCache();
        break;
      default:
        return null;
    }
  }
}

class Playback extends StatelessWidget {
  final Players player;

  Playback(this.player);

  void action(String path, [what = "play"]) {
    var selectedp = player.playerComponent;
    Map<bool, void Function()> playOptions = {
      player == Players.AAP: () async {
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
      player == Players.AC: () async {
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
