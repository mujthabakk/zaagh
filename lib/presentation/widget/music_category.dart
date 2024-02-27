import 'package:flutter/material.dart';
import 'package:music_app/core/utils/dynamic_size.dart';

class MusicCategory extends StatelessWidget {
  final String musiccategory;
  const MusicCategory({
    required this.musiccategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Text(
        musiccategory,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.w(27)),
      ),
    );
  }
}
