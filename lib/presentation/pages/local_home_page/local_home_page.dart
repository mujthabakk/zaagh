import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
import 'package:music_app/data/data_source/get_local_audio_files_impl.dart';
import 'package:music_app/presentation/pages/song_playing_page/song_playing_page.dart';
import 'package:music_app/presentation/widget/app_title.dart';
import 'package:music_app/presentation/widget/local_song_tile.dart';

class LocalHomePage extends ConsumerWidget {
  const LocalHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final song = ref.watch(getLocalAudioProvider).getLocalAudioFiles();
    return Scaffold(
        appBar: AppBar(
          title: AppTitle(
              textstyle: const TextStyle(),
              imgwidth: context.w(30),
              image: "assets/icon/music_icon.png",
              titileText: "Local Songs"),
        ),
        body: FutureBuilder(
          future: song,
          builder: (context, snapshot) => snapshot.data == null
              ? const Center(
                  child: Text('song empty'),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => LocalSongTile(
                        data: snapshot.data!,
                        index: index,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              log(snapshot.data![index].data);
                              return SongPlayingPage(
                                option: AudioSource.file(
                                    snapshot.data![index].data), data: snapshot.data!,index: index,
                              );
                            },
                          ));
                        },
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: context.h(10),
                      ),
                  itemCount: snapshot.data!.length),
        ));
  }
}
