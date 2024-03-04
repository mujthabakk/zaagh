import 'package:music_app/data/data_source/get_local_audio_files.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_local_audio_files_impl.g.dart';

class GetLocalAudioImpl extends GetLocalAudio {
  @override
  Future<List<SongModel>> getLocalAudioFiles() async {
    OnAudioQuery audioQuery = OnAudioQuery();
    return await audioQuery.querySongs();
  }
}

@riverpod
Future<List<SongModel>> getLocalAudio(GetLocalAudioRef ref) {
  return GetLocalAudioImpl().getLocalAudioFiles();
}
