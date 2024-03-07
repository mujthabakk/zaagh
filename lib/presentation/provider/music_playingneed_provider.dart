import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/pages/song_playing_page/song_playing_page.dart';

final currentIndexProvider = Provider<int?>((ref) => player.currentIndex);

final playStateProvider = StateProvider<bool>((ref) => false);