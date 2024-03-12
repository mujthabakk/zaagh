import 'package:music_app/data/model/object_box_model.dart';
import 'package:music_app/presentation/provider/favprovider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part "get_music_entity_id_provider.g.dart";

/// method to find the id(from data base) of fav song
@riverpod
int getMusicEntity(GetMusicEntityRef ref,
    {required String data, required List<SongsEntity> dbSongs}) {
  ref.invalidate(isFavProvider);
  int id = 0;
  for (SongsEntity entity in dbSongs) {
    if (entity.data == data) {
      id = entity.id;
      break;
    }
  }
  return id;
}
