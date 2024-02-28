import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final double imgwidth;
  final double fontsize;
  final String titileText;
  final String image;
  final TextStyle textstyle;
  const AppTitle({
    super.key,
    this.fontsize = 20,
    required this.textstyle,
    required this.imgwidth,
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
          width: imgwidth,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(titileText, style: textstyle)
      ],
    );
  }
}
