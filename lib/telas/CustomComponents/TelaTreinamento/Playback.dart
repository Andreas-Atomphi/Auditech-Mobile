import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

final List<String> exercicios = <String>[
  "E6SequenciaNumerosDireita/",
  "E7SequenciaNumerosEsquerda/",
  "E8TomLongoTomCurto/",
  "E9TomFinoTomGrosso/",
  "E10SequenciaAnimais/",
  "E11SequenciaInstrumentos/",
  "E12SequenciaNatureza/",
  "E13CorpoHumano/",
  "E14SequenciaTransporte/",
  "E15SequenciaCasa/",
]; //Exercícios

class Playback {
  AudioPlayer _player = AudioPlayer();
  AudioCache _loader;
  bool _playing = false;

  Playback({dynamic Function() whenEnd, String prefix}) {
    _loader = AudioCache(
      prefix: (prefix == null) ? '' : prefix,
      fixedPlayer: _player,
    );
    _player.onPlayerCompletion.listen(
      (event) {
        whenEnd();
      },
    );
  }

  set prefix(String prfx) {
    _loader.prefix = prfx;
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
    return "{player: $_player, loader: $_loader,playing: $_playing,  play: $play(path), pause: $pause(), stop: $stop()}";
  }

  play(String path) {
    _loader.play(path, stayAwake: true);
    _playing = true;
  }

  pause() {
    _player.pause();
    _playing = false;
  }

  stop() {
    _player.stop();
    _playing = false;
  }

  dispose() {
    _player.dispose();
    _playing = false;
  }

  bool get playing {
    return _playing;
  }

  get currentPosition {
    _player.getCurrentPosition().toString();
  }
}
