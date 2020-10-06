import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

final List<String> exercicios = <String>[
  "E8TomLongoTomCurto.mp3/",
  "E9TomFinoTomGrosso.mp3/",
  "E10SequenciaAnimais.mp3/",
  "E11SequenciaInstrumentos.mp3/",
  "E12SequenciaNatureza.mp3/",
  "E13CorpoHumano.mp3/",
  "E14SequenciaTransporte.mp3/",
  "E15SequenciaCasa.mp3/",
  "VozSequencias/",
]; //Exercícios

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
