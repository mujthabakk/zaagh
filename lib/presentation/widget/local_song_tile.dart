import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class LocalSongTile extends StatelessWidget {
  final void Function() onTap;
  final List<SongModel> data;
  final int index;
  const LocalSongTile({
    required this.data,
    super.key,
    required this.onTap, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Card(
        child: Image.asset("assets/image/music _img.png"),
      ),
      title:  Text(data[index].title),
      subtitle: const Text("discription"),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
    );
  }
}
