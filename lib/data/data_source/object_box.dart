import 'package:music_app/data/data_source/object_box_impl.dart';

abstract class ObjectBox {
  Future<ObjectBoxImpl> create();
}
