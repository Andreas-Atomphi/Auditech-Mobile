import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:union/union.dart';
// import 'package:audioplayers/audioplayers.dart';

final List<String> examples = <String>[
  "assets/audios/file_example_MP3_2MG.mp3",
]; // Áudios da pasta exemplos

final List<String> exercicios = <String>[
  "assets/audios/Exercicios/10_sequencia_animais.mp3",
  "assets/audios/Exercicios/11_sequencia_instrumentos.mp3",
  "assets/audios/Exercicios/12_sequencia_natureza.mp3",
  "assets/audios/Exercicios/13_corpo_humano.mp3",
  "assets/audios/Exercicios/14_sequencia_transporte.mp3",
  "assets/audios/Exercicios/15_sequencia_casa.mp3",
];

// final List<Audio> audios = examples.map((e) => Audio(e)).toList();

enum Players {
  AAP,
  AC,
}

extension PlayersComponents on Players {
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

class Playback {
  AudioPlayer player = AudioPlayer();
  AudioCache loader;
  play(String path) {
    loader = AudioCache(prefix: "", fixedPlayer: player);
    loader.play(path);
  }

  stop() {
    player.stop();
  }
}
