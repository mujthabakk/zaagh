import 'package:objectbox/objectbox.dart';

@Entity()
class SongsEntity {
  @Id()
  int id = 0;
  String? data;
  int? artistId;
  String? uri;

  String? album;

  String? artist;

  int? duration;

  String? title;

  String? displayName;
  SongsEntity(
      {this.id = 0,
      required this.data,
      required this.uri,
      required this.album,
      required this.artist,
      required this.duration,
      required this.title});
}

  // String? name;
  // int? artistId;
  // String? uri;

  // String? displayName;

  // String? album;

  // int? albumId;

  // String? artist;

  // int? duration;

  // String? title;
