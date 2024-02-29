import 'package:audio_query/audio_query.dart';
import 'package:music_app/data/data_source/get_local_audio_files.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_local_audio_files_impl.g.dart';

class GetLocalAudioImpl extends GetLocalAudio {
  @override
  Future<List<SongInfo>> getLocalAudioFiles() async {
    FlutterAudioQuery audioQuery = FlutterAudioQuery();
    return await audioQuery.getSongs();
  }
}

@riverpod
GetLocalAudio getLocalAudio(GetLocalAudioRef ref) {
  return GetLocalAudioImpl();
}
