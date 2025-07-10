class Song {
  final String title;
  final String path;

  Song({required this.title, required this.path});

  factory Song.fromPath(String path) {
    final name = path.split('/').last;
    return Song(title: name, path: path);
  }
}
