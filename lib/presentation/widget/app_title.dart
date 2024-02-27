import 'package:flutter/material.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTitle extends StatelessWidget {
  final String titileText;
  final String image;
  const AppTitle({
    super.key,
    required this.image,
     required this.titileText,
    
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: context.w(40),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          titileText,
          style: GoogleFonts.pacifico(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
