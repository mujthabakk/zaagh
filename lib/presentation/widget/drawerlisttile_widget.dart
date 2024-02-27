import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String drawerText;
  final void Function() ontap;
  final IconData icon;

  const DrawerListTile({
    required this.icon,
    required this.ontap,
    required this.drawerText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(drawerText),
      onTap: ontap,
      // Navigate to profile screen or perform any action
      // when the corresponding item is tapped
    );
  }
}
