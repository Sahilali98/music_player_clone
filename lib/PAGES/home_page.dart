import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_player/PAGES/NowPlaying.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:music_player/PAGES/settings_page.dart';
import 'package:just_audio/just_audio.dart';

// class home_page extends StatefulWidget {
//   home_page({Key? key}) : super(key: key);

//   @override
//   State<home_page> createState() => _home_pageState();
// }

// class _home_pageState extends State<home_page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Music Player 2022"),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.search),),
//         ],
//       ),
//       body: ListView.builder(itemBuilder: (context, index) => ListTile(
//         leading: Icon(Icons.music_note),
//         title: Text("Music No $index"),
//         subtitle: Text("Artist Name \t Duration"),
//         trailing: Icon(Icons.more_horiz),
//       ),itemCount: 100,),
//     );
//   }
// }

// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

// ignore: camel_case_types
class _home_pageState extends State<home_page> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    requestPermission();
  }

  void requestPermission() {
    Permission.storage.request();
  }

  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer _audioPlayer = AudioPlayer();

  playSong(String? uri) {
    try {
      _audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(uri!),
        ),
      );
      _audioPlayer.play();
    } on Exception {
      log("Eror parsing song");
    }
  }

  @override
  Widget build(BuildContext context) {
    // val user = Firebase.auth.currentUser;
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 50,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.settings,
          ),
        ),
        title: Text(user!.email.toString()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<List<SongModel>>(
        future: _audioQuery.querySongs(
            sortType: null,
            orderType: OrderType.ASC_OR_SMALLER,
            uriType: UriType.EXTERNAL,
            ignoreCase: true),
        builder: (context, item) {
          if (item.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (item.data!.isEmpty) {
            return const Center(child: Text("No songs found"));
          }
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              tileColor: Colors.black87,
              minVerticalPadding: 20,
              leading: const CircleAvatar(child: Icon(Icons.music_note)),
              title: Text(item.data![index].displayNameWOExt),
              subtitle: Text("${item.data![index].artist})"),
              trailing: const Icon(Icons.more_horiz),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NowPlaying(
                      songModel: item.data![index],
                      audioPlayer: _audioPlayer,
                    ),
                  ),
                );
              },
            ),
            itemCount: item.data!.length,
          );
        },
      ),
    );
  }
}
  
  //  backgroundColor: Colors.cyanAccent,
  //     body: Padding(
  //       padding: const EdgeInsets.all(32),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Text(
  //             "Signed In as",
  //             style: TextStyle(
  //               fontSize: 16,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 8,
  //           ),
  //           const SizedBox(
  //             height: 40,
  //           ),
  //           ElevatedButton.icon(
  //             onPressed: () => FirebaseAuth.instance.signOut(),
  //             icon: const Icon(Icons.arrow_back,size: 32,),
  //             label: const Text(
  //               'Sign Out',
  //               style: TextStyle(fontSize: 24),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
