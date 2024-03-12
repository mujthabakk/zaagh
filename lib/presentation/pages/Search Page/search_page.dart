import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
import 'package:music_app/presentation/pages/song_playing_page/song_playing_page.dart';
import 'package:music_app/presentation/provider/search_provider/search_provider.dart';
import 'package:music_app/presentation/widget/song_tile.dart';
import 'package:music_app/presentation/widgets/Search%20Field/search_field_widget.dart';

final StateProvider<bool> isDataFound = StateProvider<bool>((ref) => false);

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favsong = ref.watch(searchProvider);

    final List<AudioSource> favaudioSources = favsong
        .map(
          (source) => AudioSource.file(
            source.data,
            tag: MediaItem(
              id: '1',
              title: source.title,
              artist: source.artist,
            ),
          ),
        )
        .toList();
    // create playlist
    final ConcatenatingAudioSource playlist =
        ConcatenatingAudioSource(children: favaudioSources);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.h(100),
            ),
            SearchField(
              onPressed: () {
                ref.watch(searchProvider).clear();
                ref.invalidate(searchProvider);
              },
            ),
            SizedBox(
              height: context.h(20),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => SongTile(
                
                onListTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SongPlayingPage(
                        index: index,
                        data: favsong,
                        playlist: playlist,
                      ),
                    )),
                title: ref.watch(searchProvider)[index].title,
                subtitle: '',
              ),
              itemCount: ref.watch(searchProvider).length,
              separatorBuilder: (context, index) => const Divider(),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:music_app/presentation/provider/search_provider/search_provider.dart';
// import 'package:music_app/presentation/widget/song_tile.dart';
// import 'package:music_app/presentation/widgets/Search%20Field/search_field_widget.dart';
// import 'package:objectbox/objectbox.dart';

// class SearchPage extends ConsumerWidget {
//   const SearchPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('data'),
//       ),
//       body: Column(
//         children: [
//           SearchField(),
//           ListView.separated(
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return ListTile(title: Text(ref.watch(searchProvider)[index].title),);
//             },
//             itemCount: ref.watch(searchProvider).length,
//             separatorBuilder: (context, index) => const Divider(),
//           )
//         ],
//       ),
//     );
//   }
// }
