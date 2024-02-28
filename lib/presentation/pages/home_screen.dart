
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
import 'package:music_app/presentation/widget/app_title.dart';
import 'package:music_app/presentation/widget/drawer_widget.dart';
import 'package:music_app/presentation/widget/listview_widget.dart';
import 'package:music_app/presentation/widget/music_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(
          image: 'assets/icon/music_icon.png',
          titileText: 'ZAGH',
          imgwidth: context.w(40),
          textstyle: GoogleFonts.pacifico(),
        ),
      ),
      drawer: const DrawerWidget(),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MusicCategory(
            musiccategory: 'musiccategory',
          ),
          Listview(
            listviewdiscription: 'discription',
            listviewimg: 'assets/image/music _img.png',
          ),
          MusicCategory(
            musiccategory: 'musiccategory',
          ),
          Listview(
            listviewdiscription: 'discription',
            listviewimg: 'assets/image/music _img.png',
          ),
          MusicCategory(
            musiccategory: 'musiccategory',
          ),
          Listview(
            listviewdiscription: 'discription',
            listviewimg: 'assets/image/music _img.png',
          ),
        ],
      ),
    );
  }
}
