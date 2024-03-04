import 'package:music_app/data/data_source/object_box_impl.dart';
import 'package:music_app/data/model/object_box_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'song_storing_use.g.dart';

@riverpod
class Addsong extends _$Addsong {
  @override
  List<SongsEntity> build() {
    return ref.watch(songsEntityProvider).getAll();
  }

  void removing({required id}) {
    
    ref.watch(songsEntityProvider).remove(id);
    state = List.from(ref.watch(songsEntityProvider).getAll());
  }

  void adding({required SongsEntity songsEntity}) {
    
    ref.watch(songsEntityProvider).put(songsEntity);
    state = List.from(ref.watch(songsEntityProvider).getAll());
  }
}
