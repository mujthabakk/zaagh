import 'dart:developer';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
import 'package:music_app/presentation/widget/app_title.dart';
import 'package:music_app/presentation/widget/musicplayingimage_widget.dart';

class SongPlayingPage extends ConsumerStatefulWidget {
  const SongPlayingPage( {super.key,required this.option});
  final AudioSource option;

  @override
  ConsumerState<SongPlayingPage> createState() => _SongPlayingPageState();
}

StateProvider<bool> isPlaying = StateProvider<bool>((ref) => false);

class _SongPlayingPageState extends ConsumerState<SongPlayingPage> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    // _setupAudioPlayer();
  }

  String formatTime(int seconds) =>
      '${Duration(seconds: seconds)}'.split('.')[0].padLeft(8, '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(
          image: "assets/image/zaagh.png",
          titileText: "PLAYING FROM PLATLIST",
          imgwidth: context.w(50),
          fontsize: context.w(6),
          textstyle: TextStyle(fontSize: context.w(8 * 3)),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: context.h(8 * 13),
            ),
            const MusicPlayingImage(
              musicplayingimage: 'assets/image/zaagh.png',
            ),
            SizedBox(
              height: context.h(10),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.w(8 * 4),
                vertical: context.h(8 * 3),
              ),
              child: processBar(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _playbackControlButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _setupAudioPlayer() async {
    player.playbackEventStream
        .listen((event) {}, onError: (Object e, StackTrace stackTrace) {
          log('playbackEventStream error $e');
        });
    try {
      player.setAudioSource(widget.option);
    } catch (e) {
      throw e.toString();
    }
  }

  Widget _playbackControlButton() {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final processingState = snapshot.data?.processingState;
        final playing = snapshot.data?.playing;
        if (processingState == ProcessingState.buffering ||
            processingState == ProcessingState.loading) {
          return const SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            onPressed: player.play,
            icon: const Icon(Icons.play_arrow),
            iconSize: 64,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            onPressed: player.pause,
            iconSize: 64,
            icon: const Icon(Icons.pause),
          );
        } else {
          return IconButton(
            onPressed: () => player.seek(Duration.zero),
            icon: const Icon(Icons.replay),
          );
        }
      },
    );
  }

  Widget processBar() {
    return StreamBuilder<Duration>(
      stream: player.positionStream,
      builder: (context, snapshot) => ProgressBar(
        progress: snapshot.data ?? Duration.zero,
        buffered: player.bufferedPosition,
        total: player.duration ?? Duration.zero,
        onSeek: (duration) {
          player.seek(duration);
        },
      ),
    );
  }
}
