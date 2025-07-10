import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/song.dart';

Future<List<Song>> pickSongsFromPhone() async {
  final status = await Permission.audio.request();
  if (!status.isGranted) return [];

  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['mp3', 'wav', 'm4a'],
    allowMultiple: true,
  );

  if (result != null) {
    return result.paths
        .whereType<String>()
        .map((path) => Song.fromPath(path))
        .toList();
  } else {
    return [];
  }
}
