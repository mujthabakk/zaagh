// import 'package:music_app/data/model/playlist_object_box_model.dart';
// import 'package:objectbox/objectbox.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'playlist_objectbox.g.dart';

// class SongPlayBox  {
//   late final Store store;
//   static late final Box<PlaylistModel> playBox;
//  SongPlayBox  ._create(this.store) {
//   playBox= store.box<PlaylistModel>();
//   }

 
//    static Future<SongPlayBox > create() async {
//     final docsDir = await getApplicationDocumentsDirectory();
//     final store = await openStore(directory: join(docsDir.path, "playlist"));
//     return SongPlayBox ._create(store);
//   }
// }

// @riverpod
// Box<PlaylistModel>songplaylist (SongplaylistRef ref) {
//   return SongPlayBox .playBox;
// }

