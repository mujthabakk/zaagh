import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
import 'package:music_app/presentation/pages/song_playing_page/song_playing_page.dart';
import 'package:music_app/presentation/provider/db_provider.dart';
import 'package:music_app/presentation/widget/app_title.dart';
import 'package:music_app/presentation/widget/song_tile.dart';

class FavouritePage extends ConsumerWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final favsong = ref.watch(dbsongProvider);

    return Scaffold(
        appBar: AppBar(
          title: AppTitle(
              textstyle: const TextStyle(),
              imgwidth: context.w(30),
              image: "assets/icon/music_icon.png",
              titileText: "Local Songs"),
        ),
        body: ref.watch(dbsongProvider).when(
              data: (data) {
                final List<AudioSource> favaudioSources = data
                    .map(
                      (source) => AudioSource.file(
                        source.data!,
                        tag: MediaItem(
                          id: '1',
                          title: source.title!,
                          artist: source.artist,
                        ),
                      ),
                    )
                    .toList();
                // create playlist
                final ConcatenatingAudioSource playlist =
                    ConcatenatingAudioSource(children: favaudioSources);

                return Padding(
                  padding: const EdgeInsets.all(8 * 2),
                  child: data.isEmpty
                      ? const Center(
                          child: Text("No favourite songs"),
                        )
                      : ListView.separated(
                          itemCount: data.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: context.h(17),
                          ),
                          itemBuilder: (context, index) => SongTile(
                            iconColor: Colors.red,
                            title: "${data[index].title}",
                            subtitle: '',
                            onListTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SongPlayingPage(
                                    index: index,
                                    data: data,
                                    playlist: playlist,
                                  ),
                                )),
                            ontap: () {
                              ref
                                  .watch(addsongProvider.notifier)
                                  .removing(id: data[index].id);
                            },
                          ),
                        ),
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => Center(
                child: Container(
                  width: context.w(200),
                  color: Colors.black,
                ),
              ),
            )
        //////////////////////////////////
        );
  }
}
