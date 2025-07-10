import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song.dart';

class PlayerProvider with ChangeNotifier {
  final _audioPlayer = AudioPlayer();
  List<Song> _songs = [];
  int _currentIndex = 0;

  AudioPlayer get audioPlayer => _audioPlayer;
  List<Song> get songs => _songs;
  int get currentIndex => _currentIndex;
  Song get currentSong =>
      _songs.isNotEmpty ? _songs[_currentIndex] : Song(title: '', path: '');

  Future<void> setSongs(List<Song> songs) async {
    _songs = songs;
    _currentIndex = 0;
    await _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: songs.map((s) => AudioSource.uri(Uri.file(s.path))).toList(),
      ),
    );
    _audioPlayer.currentIndexStream.listen((index) {
      if (index != null) {
        _currentIndex = index;
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void play() => _audioPlayer.play();
  void pause() => _audioPlayer.pause();
  void next() => _audioPlayer.seekToNext();
  void previous() => _audioPlayer.seekToPrevious();
  void seek(Duration position) => _audioPlayer.seek(position);

  void disposePlayer() {
    _audioPlayer.dispose();
  }
}
