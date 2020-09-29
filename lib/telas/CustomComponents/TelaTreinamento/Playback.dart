import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

final List<String> exercicios = <String>[
  "8_TomLongo_TomCurto.mp3",
  "9_TomFino_TomGrosso.mp3",
  "10_sequencia_animais.mp3",
  "11_sequencia_instrumentos.mp3",
  "12_sequencia_natureza.mp3",
  "13_corpo_humano.mp3",
  "14_sequencia_transporte.mp3",
  "15_sequencia_casa.mp3",
]; //Exercícios

/*enum Players {
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
}*/

class Playback {
  AudioPlayer _player = AudioPlayer();
  AudioCache _loader;

  String get player {
    return _player.toString();
  }

  String get loader {
    return _loader.toString();
  }

  String toString() {
    return "{player: $_player, loader: $_loader, play: $play(path), pause: $pause(), stop: $stop()}";
  }

  play(String path) {
    _loader = AudioCache(
      prefix: "assets/audios/Exercicios/",
      fixedPlayer: _player,
    );
    _loader.play(path);
  }

  pause() {
    _player.pause();
  }

  stop() {
    _player.stop();
  }

  get currentPosition {
    _player.getCurrentPosition().toString();
  }
}
