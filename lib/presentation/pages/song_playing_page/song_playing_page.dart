import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
import 'package:music_app/presentation/provider/audio_provider.dart';
import 'package:music_app/presentation/provider/icon_provider.dart';
import 'package:music_app/presentation/provider/music_playingneed_provider.dart';
import 'package:music_app/presentation/provider/setaudiosource.dart';
import 'package:music_app/presentation/widget/app_title.dart';
import 'package:music_app/presentation/widget/musicplayingimage_widget.dart';
import 'package:music_app/presentation/widgets/process_baar.dart';

final AudioPlayer player = AudioPlayer();

// ignore: must_be_immutable
class SongPlayingPage extends ConsumerStatefulWidget {
  SongPlayingPage({
    // this.playsongs,
    this.data,
    required this.index,
    super.key,
    required this.playlist,
  });
  final ConcatenatingAudioSource playlist;
  final List? data;
  int index;
  // final AudioSource option;
  // final VoidCallback? playsongs;

  @override
  ConsumerState<SongPlayingPage> createState() => _SongPlayingPageState();
}

StateProvider<bool> isPlaying = StateProvider<bool>((ref) => false);

class _SongPlayingPageState extends ConsumerState<SongPlayingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    playmusic(playlist: widget.playlist, index: widget.index);
  }

  String formatTime(int seconds) {
    return '${Duration(seconds: seconds)}'.split('.')[0].padLeft(8, '0');
  }

  @override
  Widget build(BuildContext context) {
    player.positionStream.listen((_) {
      ref.invalidate(currentIndexProvider);
      ref.invalidate(playStateProvider);
    });

    return Scaffold(
      appBar: AppBar(
        title: AppTitle(
          image: "assets/image/zaagh.png",
          titileText: "PLAYING FROM PLATLIST",
          imgwidth: context.w(50),
          fontsize: context.w(6),
          textstyle: TextStyle(fontSize: context.w(8 * 3)),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              ref.watch(playerProvider).pause();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: context.h(8 * 13),
              ),
              const MusicPlayingImage(
                musicplayingimage: 'assets/image/background_img.jpg',
              ),
              SizedBox(
                height: context.h(10),
              ),
              Column(
                children: [
                  Text(
                      widget.data![ref.watch(currentIndexProvider) ?? 0].title),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.w(8 * 4),
                      vertical: context.h(8 * 3),
                    ),
                    child: processBar(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      player.seekToPrevious();
                      player.positionStream.listen((_) {
                        ref.invalidate(currentIndexProvider);
                        ref.invalidate(playStateProvider);
                      });
                    },
                    icon: const Icon(Icons.skip_previous),
                    iconSize: 55,
                  ),
                  IconButton(
                      onPressed: () {
                        if (player.playing) {
                          player.pause();
                        } else {
                          player.play();
                        }
                        ref.read(iconsprovider.notifier).state =
                            !ref.watch(iconsprovider.notifier).state;
                      },
                      icon: ref.watch(iconsprovider)
                          ? Icon(
                              Icons.pause,
                              size: context.w(60),
                            )
                          : Icon(
                              Icons.play_arrow_outlined,
                              size: context.w(60),
                            )),
                  IconButton(
                    onPressed: () {
                      player.seekToNext();
                      player.positionStream.listen((_) {
                        ref.invalidate(currentIndexProvider);
                        ref.invalidate(playStateProvider);
                      });
                    },
                    icon: const Icon(Icons.skip_next),
                    iconSize: 55,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
