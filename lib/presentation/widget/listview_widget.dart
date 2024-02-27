import 'package:flutter/material.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
import 'package:music_app/presentation/widget/listviewcontainer_widget.dart';

class Listview extends StatelessWidget {
  final String listviewdiscription;
  final String listviewimg;
  const Listview({
    required this.listviewdiscription,
    required this.listviewimg,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h(245),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Listviewcontainer(listviewimg: listviewimg),
              const SizedBox(
                height: 10,
              ),
              Text(listviewdiscription)
            ],
          ),
        ),
      ),
    );
  }
}
