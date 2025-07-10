import 'dart:io';
import 'package:file_picker/file_picker.dart';
import '../models/song_model.dart';

class MusicLoader {
  static Future<List<SongModel>> pickSongs() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['mp3', 'm4a', 'wav'],
    );

    if (result == null) return [];

    return result.files
        .map((file) => SongModel(title: file.name, path: file.path!))
        .toList();
  }
}
