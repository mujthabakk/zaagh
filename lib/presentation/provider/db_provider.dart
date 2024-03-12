import 'package:music_app/data/data_source/object_box_impl.dart';
import 'package:music_app/data/model/object_box_model.dart';
import 'package:music_app/presentation/provider/favprovider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_provider.g.dart';

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
    ref.invalidate(isFavProvider);
    ref.watch(songsEntityProvider).put(songsEntity);
    state = List.from(ref.watch(songsEntityProvider).getAll());
  }
}

@riverpod
Future<List<SongsEntity>> dbsong(DbsongRef ref) async {
  return await ref.watch(addsongProvider);
}
