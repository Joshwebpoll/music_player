// import 'package:flutter/material.dart';
// import '../models/song.dart';

// class SongTile extends StatelessWidget {
//   final Song song;
//   final bool isCurrentSong;
//   final bool isPlaying;
//   final VoidCallback onTap;

//   const SongTile({
//     Key? key,
//     required this.song,
//     required this.onTap,
//     this.isCurrentSong = false,
//     this.isPlaying = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       decoration: BoxDecoration(
//         color: isCurrentSong ? Colors.deepPurple.shade50 : Colors.transparent,
//         borderRadius: BorderRadius.circular(12),
//         border:
//             isCurrentSong
//                 ? Border.all(color: Colors.deepPurple.shade200, width: 1)
//                 : null,
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         leading: Container(
//           width: 50,
//           height: 50,
//           decoration: BoxDecoration(
//             color:
//                 isCurrentSong
//                     ? Colors.deepPurple.shade200
//                     : Colors.deepPurple.shade50,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Icon(
//             isCurrentSong && isPlaying
//                 ? Icons.equalizer_rounded
//                 : Icons.music_note_rounded,
//             color:
//                 isCurrentSong
//                     ? Colors.deepPurple.shade700
//                     : Colors.deepPurple.shade400,
//             size: 24,
//           ),
//         ),
//         title: Text(
//           song.title,
//           style: TextStyle(
//             fontWeight: isCurrentSong ? FontWeight.w600 : FontWeight.w500,
//             color: isCurrentSong ? Colors.deepPurple.shade700 : Colors.black87,
//           ),
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//         subtitle: Text(
//           song.artist,
//           style: TextStyle(
//             color:
//                 isCurrentSong
//                     ? Colors.deepPurple.shade500
//                     : Colors.grey.shade600,
//           ),
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//         trailing: Icon(
//           isCurrentSong && isPlaying
//               ? Icons.pause_circle_filled
//               : Icons.play_circle_filled,
//           color: isCurrentSong ? Colors.deepPurple : Colors.grey.shade400,
//           size: 32,
//         ),
//         onTap: onTap,
//       ),
//     );
//   }
// }
