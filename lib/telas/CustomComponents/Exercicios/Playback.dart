import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

final Map<String, dynamic> exercicios = const <String, dynamic>{
  "Ex1": "Exercicio01/",
  "Ex2": "Exercicio02/",
  "Ex3": "Exercicio03/",
  "Ex4": "Exercicio04/",
  "Ex5": "Exercicio05/",
  "Ex6": "Exercicio06/",
  "Ex7": "Exercicio07/",
  "Ex8": "Exercicio08/",
  "Ex9": "Exercicio09/",
  "Ex10": "Exercicio10/",
}; //Exercícios

class Playback {
  AudioPlayer _player = AudioPlayer();
  AudioCache _loader;
  String toPlay;
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

  play([String path]) {
    if (toPlay == null || path != null) {
      _loader.play(path, stayAwake: true);
      toPlay = path;
    } else if (toPlay != null && path == null) {
      _loader.play(toPlay, stayAwake: true);
    }
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
