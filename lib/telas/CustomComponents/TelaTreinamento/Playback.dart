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

  Playback({dynamic Function() whenEnd, String prefix}) {
    _loader = AudioCache(
      prefix: "assets/audios/Exercicios/",
      fixedPlayer: _player,
    );
    if (prefix != null) {
      _loader.prefix = _loader.prefix + prefix;
    }
    _player.onPlayerCompletion.listen(
      (event) {
        whenEnd();
      },
    );
  }

  set prefix(String prfx) {
    _loader.prefix = "assets/audios/Exercicios/" + prfx;
  }

  set whenEnd(dynamic Function() func) {
    _player.onPlayerCompletion.listen(
      (event) {
        func();
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
    _loader.play(path, stayAwake: true);
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
