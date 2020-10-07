import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

final List<String> exercicios = <String>[
  "E8TomLongoTomCurto/",
  "E9TomFinoTomGrosso/",
  "E10SequenciaAnimais/",
  "E11SequenciaInstrumentos/",
  "E12SequenciaNatureza/",
  "E13CorpoHumano/",
  "E14SequenciaTransporte/",
  "E15SequenciaCasa/",
  "VozSequencias/",
]; //Exercícios

class Playback {
  AudioPlayer _player = AudioPlayer();
  AudioCache _loader;

  Playback(dynamic Function() whenEnd) {
    _player.onPlayerCompletion.listen(
      (event) {
        whenEnd();
      },
    );
  }

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

  dispose() {
    _player.dispose();
  }

  get currentPosition {
    _player.getCurrentPosition().toString();
  }
}
