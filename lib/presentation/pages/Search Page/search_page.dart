import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
import 'package:music_app/presentation/widget/song_tile.dart';
import 'package:music_app/presentation/widgets/Not%20Found/not_found_widget.dart';
import 'package:music_app/presentation/widgets/Search%20Field/search_field_widget.dart';

final StateProvider<bool> isDataFound = StateProvider<bool>((ref) => false);

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.h(100),
          ),
          const SearchField(),
          SizedBox(
            height: context.h(20),
          ),
          ref.watch(isDataFound)
              ? const SongTile(title: 'songtitle', subtitle: '')
              : Column(
                  children: [
                    SizedBox(
                      height: context.h(250),
                    ),
                    const NotFound(),
                  ],
                ),
        ],
      ),
    );
  }
}
