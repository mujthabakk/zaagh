import 'dart:developer';
import 'dart:io';
import 'package:audio_query/audio_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/pages/local_home_page/local_home_page.dart';
import 'package:music_app/presentation/pages/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:music_app/presentation/pages/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Audio Files'),
      ),
      body: FutureBuilder<List<SongInfo>>(
        future: _getLocalAudioFiles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<SongInfo> audioFiles = snapshot.data!;
            return ListView.builder(
              itemCount: audioFiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(audioFiles[index].title ?? 'Unknown'),
                  subtitle: Text(audioFiles[index].artist ?? 'Unknown Artist'),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<SongInfo>> _getLocalAudioFiles() async {
    FlutterAudioQuery audioQuery = FlutterAudioQuery();
    return await audioQuery.getSongs();
  }
}
