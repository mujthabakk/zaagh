import 'package:music_app/data/data_source/get_local_audio_files_impl.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part "search_provider.g.dart";

@riverpod
class Search extends _$Search {
  @override
  List<SongModel> build() {
    return [];
  }

  songsearch(
    String str,
  ) {
    List<SongModel>? song = ref.watch(getLocalAudioProvider).value!;
    RegExp regex = RegExp(
      str,
    );
    state = [
      for (SongModel songs in song)
        if (regex.hasMatch(songs.title.toLowerCase())) songs
    ];
  }
}
