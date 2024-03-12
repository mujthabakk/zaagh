import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/model/object_box_model.dart';
import 'package:music_app/presentation/provider/db_provider.dart';
import 'package:music_app/presentation/provider/favprovider.dart';
import 'package:music_app/presentation/provider/get_music_entity_id_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';

class LocalSongTile extends ConsumerWidget {
  final void Function() onTap;
  final List<SongModel> data;
  final int index;
  final Color? iconcolor;

  const LocalSongTile({
    required this.data,
    super.key,
    required this.onTap,
    required this.index,
    this.iconcolor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        onTap: onTap,
        leading: Card(
          child: Image.asset("assets/image/music _img.png"),
        ),
        title: Text(data[index].title),
        subtitle: const Text("discription"),
        trailing: IconButton(
          onPressed: () {
            /// check if the song is favorite
            ref.invalidate(isFavProvider);
            ref.watch(isFavProvider(data: data[index].data))
                /// if the song is favorite it remove from database
                ? ref.watch(addsongProvider.notifier).removing(
                    id: ref.read(getMusicEntityProvider(
                        dbSongs: ref.read(addsongProvider),
                        data: data[index].data)))
                /// if the song is not in the data base it will add to it
                : ref.watch(addsongProvider.notifier).adding(
                      songsEntity: SongsEntity(
                          data: data[index].data,
                          uri: data[index].uri,
                          album: data[index].album,
                          artist: data[index].artist,
                          duration: data[index].duration,
                          title: data[index].title),
                    );
          },
          icon: ref.watch(IsFavProvider(data: data[index].data))
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(Icons.favorite),
        ));
  }
}
