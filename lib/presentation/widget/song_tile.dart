import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  final Color iconColor;
  final String title;
  final VoidCallback? onListTap;
  final String subtitle;
  const SongTile({
    super.key,
    this.iconColor = Colors.grey,
    required this.title,
    this.onListTap,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onListTap,
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Card(
        child: Image.asset('assets/image/zaagh.png'),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: iconColor,
          )),
    );
  }
}
