import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/player_provider.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<PlayerProvider>(context);

    return StreamBuilder<Duration>(
      stream: player.audioPlayer.positionStream,
      builder: (context, snapshot) {
        final position = snapshot.data ?? Duration.zero;
        final duration = player.audioPlayer.duration ?? Duration.zero;

        return Column(
          children: [
            if (player.current != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(_format(position)), Text(_format(duration))],
                ),
              ),
            if (player.current != null)
              Slider(
                value: position.inSeconds.toDouble(),
                max:
                    duration.inSeconds.toDouble() > 0
                        ? duration.inSeconds.toDouble()
                        : 1,
                onChanged:
                    (value) => player.audioPlayer.seek(
                      Duration(seconds: value.toInt()),
                    ),
              ),
            if (player.current != null)
              IconButton(
                icon: Icon(
                  player.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                ),
                onPressed:
                    () => player.isPlaying ? player.pause() : player.resume(),
              ),
          ],
        );
      },
    );
  }

  String _format(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(d.inMinutes)}:${twoDigits(d.inSeconds.remainder(60))}';
  }
}
