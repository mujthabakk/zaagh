import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/Favourite%20Page/favourite_page.dart';
import 'package:music_app/presentation/pages/Search%20Page/search_page.dart';
import 'package:music_app/presentation/pages/home_screen.dart';

final List<Widget> pageList = [
  const HomeScreen(),
  const SearchPage(),
  const FavouritePage(),
];
