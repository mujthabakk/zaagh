
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'audio_provider.g.dart';

@riverpod

class Audio extends _$Audio{
  @override
AudioPlayer build(){
  return AudioPlayer();

}

}