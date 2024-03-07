 import 'package:music_app/presentation/pages/song_playing_page/song_playing_page.dart';

playmusic({required playlist, required index}) {
    player.setAudioSource(playlist, initialIndex: index);
  }