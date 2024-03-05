import 'package:music_app/data/model/object_box_model.dart';
import 'package:music_app/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'object_box_impl.g.dart';

class ObjectBoxImpl  {
  late final Store store;
  static late final Box<SongsEntity> songBox;
  ObjectBoxImpl  ._create(this.store) {
    songBox = store.box<SongsEntity>();
  }

 
   static Future<ObjectBoxImpl> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: join(docsDir.path, "obx-example"));
    return ObjectBoxImpl._create(store);
  }
}

@riverpod
Box<SongsEntity> songsEntity(SongsEntityRef ref) {
  return ObjectBoxImpl.songBox;
}
