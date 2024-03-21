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
            drawerText: 'feedback ',
            ontap: () {},
            icon: Icons.feedback_outlined,
          ),
          DrawerListTile(
            drawerText: 'about  ',
            ontap: () {},
            icon: Icons.info,
          ),
          DrawerListTile(
            drawerText: 'policy ',
            ontap: () {},
            icon: Icons.policy,
          ),
          DrawerListTile(
            drawerText: 'Terms&conditions  ',
            ontap: () {},
            icon: Icons.policy,
          ),
        ],
      ),
    );
  }
}
