import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song_model.dart';

class PlayerProvider with ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  SongModel? _current;
  bool _isPlaying = false;

  SongModel? get current => _current;
  bool get isPlaying => _isPlaying;
  AudioPlayer get audioPlayer => _player;

  Future<void> play(SongModel song) async {
    _current = song;
    await _player.setFilePath(song.path);
    _player.play();
    _isPlaying = true;
    notifyListeners();
  }

  void pause() {
    _player.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() {
    _player.play();
    _isPlaying = true;
    notifyListeners();
  }
}
