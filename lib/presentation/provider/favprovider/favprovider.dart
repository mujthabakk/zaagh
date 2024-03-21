import 'package:music_app/data/model/object_box_model.dart';
import 'package:music_app/presentation/provider/dbprovider/db_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favprovider.g.dart';

class CheckIsFav {
  bool isFav({required String data, required List<SongsEntity> listOfmusic}) {
    bool isFav = false;
    for (SongsEntity model in listOfmusic) {
      if (model.data == data) {
        isFav = true;
        break;
      }
    }
    return isFav;
  }
}
@riverpod
bool isFav(IsFavRef ref, {required String data}) {
  return CheckIsFav().isFav(data: data, listOfmusic: ref.read(addsongProvider));
}