import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/model/object_box_model.dart';
import 'package:music_app/domain/song_storing_use.dart';
import 'package:on_audio_query/on_audio_query.dart';

class LocalSongTile extends ConsumerWidget {
  final void Function() onTap;
  final List<SongModel> data;
  final int index;
  const LocalSongTile({
    required this.data,
    super.key,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        leading: Card(
          child: Image.asset("assets/image/music _img.png"),
        ),
        title: Text(data[index].title),
        subtitle: const Text("discription"),
        trailing: IconButton(
            onPressed: () {
              ref.watch(addsongProvider.notifier).adding(
                
                
                  songsEntity: SongsEntity(
                      data: data[index].data,
                      uri: data[index].uri,
                      album: data[index].album,
                      artist: data[index].artist,
                      duration: data[index].duration,
                      title: data[index].title));

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const FavouritePage(),
              //     ));
            },
            icon: Icon(Icons.favorite,
                size: 20,
                color: ref.watch(favorite) ? Colors.white : Colors.red)));
  }
}

final favorite = StateProvider<bool>((ref) => true);
