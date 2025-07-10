import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/song.dart';
import '../providers/player_provider.dart';
import '../services/music_loader.dart';
import '../widgets/player_controls.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  void loadSongs() async {
    final songs = await pickSongsFromPhone();
    if (songs.isNotEmpty) {
      Provider.of<PlayerProvider>(context, listen: false).setSongs(songs);
    }
  }

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<PlayerProvider>(context);
    final songs = player.songs;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player"),
        actions: [
          IconButton(icon: const Icon(Icons.folder), onPressed: loadSongs),
        ],
      ),
      body: Column(
        children: [
          if (songs.isEmpty)
            const Expanded(child: Center(child: Text("No songs loaded")))
          else
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (_, index) {
                  final song = songs[index];
                  return ListTile(
                    title: Text(song.title),
                    selected: index == player.currentIndex,
                    onTap: () {
                      player.audioPlayer.seek(Duration.zero, index: index);
                      player.play();
                    },
                  );
                },
              ),
            ),
          const PlayerControls(),
        ],
      ),
    );
  }
}
