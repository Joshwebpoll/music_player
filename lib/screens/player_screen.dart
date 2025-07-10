// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/player_provider.dart';
// import '../widgets/player_controls.dart';

// class PlayerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Now Playing'),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         foregroundColor: Colors.white,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Consumer<MusicProvider>(
//         builder: (context, musicProvider, child) {
//           final currentSong = musicProvider.currentSong;

//           if (currentSong == null) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.music_off, size: 80, color: Colors.grey),
//                   SizedBox(height: 16),
//                   Text(
//                     'No song selected',
//                     style: TextStyle(fontSize: 18, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             );
//           }

//           return Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.deepPurple.shade400,
//                   Colors.deepPurple.shade800,
//                 ],
//               ),
//             ),
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Album Art
//                         Container(
//                           width: 280,
//                           height: 280,
//                           margin: EdgeInsets.symmetric(horizontal: 40),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.3),
//                                 blurRadius: 20,
//                                 offset: Offset(0, 10),
//                               ),
//                             ],
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child:
//                                 currentSong.albumArt != null
//                                     ? Image.network(
//                                       currentSong.albumArt!,
//                                       fit: BoxFit.cover,
//                                     )
//                                     : Container(
//                                       decoration: BoxDecoration(
//                                         gradient: LinearGradient(
//                                           begin: Alignment.topLeft,
//                                           end: Alignment.bottomRight,
//                                           colors: [
//                                             Colors.deepPurple.shade300,
//                                             Colors.deepPurple.shade600,
//                                           ],
//                                         ),
//                                       ),
//                                       child: Icon(
//                                         Icons.music_note_rounded,
//                                         size: 120,
//                                         color: Colors.white.withOpacity(0.8),
//                                       ),
//                                     ),
//                           ),
//                         ),
//                         SizedBox(height: 40),
//                         // Song Info
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 32),
//                           child: Column(
//                             children: [
//                               Text(
//                                 currentSong.title,
//                                 style: TextStyle(
//                                   fontSize: 26,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                                 textAlign: TextAlign.center,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 currentSong.artist,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white.withOpacity(0.8),
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Player Controls
//                   PlayerControls(),
//                   SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
