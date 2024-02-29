import 'package:on_audio_query/on_audio_query.dart';

abstract class GetLocalAudio {
  Future<List<SongModel>> getLocalAudioFiles();
}
