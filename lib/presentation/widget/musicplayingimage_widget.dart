import 'package:flutter/material.dart';
import 'package:music_app/core/utils/dynamic_size.dart';

class MusicPlayingImage extends StatelessWidget {
  final String musicplayingimage;
  const MusicPlayingImage({super.key, required this.musicplayingimage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(400),
      height: context.w(400),
      decoration: const BoxDecoration(color: Colors.amber),
      child: Image.asset(
        musicplayingimage,
        fit: BoxFit.cover,
      ),
    );
  }
}
