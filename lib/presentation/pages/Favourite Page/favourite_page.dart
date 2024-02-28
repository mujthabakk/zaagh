import 'package:flutter/material.dart';
import 'package:music_app/presentation/widget/song_tile.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8 * 2),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => const SongTile(
            title: 'song title', subtitle: '',
          ),
        ),
      ),
    );
  }
}