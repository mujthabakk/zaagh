
import 'package:flutter/material.dart';
import 'package:music_app/core/utils/dynamic_size.dart';

class Listviewcontainer extends StatelessWidget {
  const Listviewcontainer({
    super.key,
    required this.listviewimg,
  });

  final String listviewimg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(150),
      height: context.h(200),
      decoration: const BoxDecoration(color: Colors.amber),
      child: Image.asset(
        listviewimg,
        fit: BoxFit.cover,
        width: context.w(150),
        height: context.h(200),
      ),
    );
  }
}
