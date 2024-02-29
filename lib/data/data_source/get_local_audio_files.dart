import 'package:audio_query/audio_query.dart';

abstract class GetLocalAudio {
  Future<List<SongInfo>> getLocalAudioFiles();
}
