import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/core/const/List/page_list.dart';

final StateProvider<int> selectedIndex = StateProvider<int>((ref) => 0);

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: pageList[ref.watch(selectedIndex)],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: ref.watch(selectedIndex),
          onTap: (value) => ref.read(selectedIndex.notifier).state = value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
          ]),
    );
  }
}
