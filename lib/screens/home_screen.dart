import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/song_model.dart';
import '../providers/player_provider.dart';
import '../services/music_loader.dart';
import '../widgets/player_controls.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SongModel> _songs = [];

  void _loadSongs() async {
    final songs = await MusicLoader.pickSongs();
    if (mounted) setState(() => _songs = songs);
  }

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<PlayerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Music Player"),
        actions: [
          IconButton(
            icon: const Icon(Icons.folder_open),
            onPressed: _loadSongs,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:
                _songs.isEmpty
                    ? const Center(child: Text("No songs loaded."))
                    : ListView.builder(
                      itemCount: _songs.length,
                      itemBuilder: (_, index) {
                        final song = _songs[index];
                        return ListTile(
                          title: Text(song.title),
                          onTap: () => player.play(song),
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
