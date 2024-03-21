import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/song_playing_page/song_playing_page.dart';

Widget processBar() {
  return StreamBuilder<Duration>(
    stream: player.positionStream,
    builder: (context, snapshot) => ProgressBar(
      progress: snapshot.data ?? Duration.zero,
      // buffered: player.bufferedPosition,
      total: player.duration ?? Duration.zero,
      onSeek: (duration) {
        player.seek(duration);
      },
    ),
  );
}
