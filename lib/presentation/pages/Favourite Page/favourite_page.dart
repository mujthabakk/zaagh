import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
// import 'package:music_app/data/data_source/get_local_audio_files_impl.dart';
// import 'package:music_app/data/model/object_box_model.dart';
import 'package:music_app/presentation/pages/song_playing_page/song_playing_page.dart';
import 'package:music_app/presentation/provider/db_provider.dart';
import 'package:music_app/presentation/widget/song_tile.dart';

class FavouritePage extends ConsumerWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favsong = ref.watch(dbsongProvider);

    final List<AudioSource> favaudioSources = favsong.value!
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8 * 2),
        child: favsong.value!.isEmpty
            ? const Center(
                child: Text("No favourite songs"),
              )
            : ListView.separated(
                itemCount: favsong.value!.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: context.h(17),
                ),
                itemBuilder: (context, index) => SongTile(
                  iconColor: Colors.red,
                  title: "${favsong.value![index].title}",
                  subtitle: '',
                  onListTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongPlayingPage(
                          index: index,
                          data: favsong.value!,
                          playlist: playlist,
                        ),
                      )),
                  ontap: () {
                    ref
                        .watch(addsongProvider.notifier)
                        .removing(id: favsong.value![index].id);
                  },
                ),
              ),
      ),
    );
  }
}
