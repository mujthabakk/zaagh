import 'package:flutter/material.dart';
import 'package:music_app/core/utils/dynamic_size.dart';
import 'package:music_app/presentation/widget/drawerlisttile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: context.h(8 * 9)),
        children: <Widget>[
          DrawerListTile(
            drawerText: 'Profile',
            ontap: () {},
            icon: Icons.account_circle,
          ),
          DrawerListTile(
            drawerText: 'settings',
            ontap: () {},
            icon: Icons.settings,
          ),
          DrawerListTile(
            drawerText: 'logout',
            ontap: () {},
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}
