import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/pages/Favourite%20Page/favourite_page.dart';
import 'package:music_app/presentation/pages/Search%20Page/search_page.dart';
import 'package:music_app/presentation/pages/local_home_page/local_home_page.dart';

final StateProvider<int> selectedIndex = StateProvider<int>((ref) => 0);

class MainPage extends ConsumerWidget {
  MainPage({super.key});
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) =>
            ref.read(selectedIndex.notifier).state = value,
        scrollDirection: Axis.horizontal,
        children:  [
          const LocalHomePage(),
          SearchPage(),
          const FavouritePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(
            size: 30,
          ),
          iconSize: 24,
          selectedFontSize: 10,
          currentIndex: ref.watch(selectedIndex),
          onTap: (value) {
            ref.read(selectedIndex.notifier).state = value;
            _pageController.jumpToPage(value);
          },
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          items: const [
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: 'Home',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy),
              label: 'Local',
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
