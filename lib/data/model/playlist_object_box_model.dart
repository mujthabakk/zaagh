import 'package:objectbox/objectbox.dart';
import 'package:on_audio_query/on_audio_query.dart';

@Entity()
class PlaylistModel {
  @Id()
  int id = 0;
  String? name;
  List<SongModel>? plylist;
  PlaylistModel({required this.name, required this.plylist, this.id = 0});
}