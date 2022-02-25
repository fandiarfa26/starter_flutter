import 'package:flutter/material.dart';
import 'package:starter_flutter/constants/assets_path.dart';
import 'package:starter_flutter/routes/router.dart';
import 'package:starter_flutter/utils/ui/custom_styles.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  static final List<Map<String, dynamic>> _navItem = [
    {"title": "Welcome", "route": "/"},
    {"title": "Counter", "route": "/counter"},
    {"title": "Fetch API", "route": "/list"},
    {"title": "Image Picker & Cropper", "route": "/upload_image"},
    {"title": "Cached Image Network", "route": "/cached_image"},
    {"title": "Package Info", "route": "/package_info"},
  ];

  @override
  Widget build(BuildContext context) {
    List<ListTile> _items = [];

    for (var item in _navItem) {
      _items.add(ListTile(
        horizontalTitleGap: 0,
        leading: Icon(Icons.emoji_emotions),
        title: Text(item['title'], style: Typo.r14p),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          RouterApp.router.navigateTo(context, item['route'], replace: true);
        },
      ));
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Center(
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    child: Image.asset(avatarImage),
                    radius: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Avatar Name',
                      style: Typo.r14p,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: _items,
          )
        ],
      ),
    );
  }
}
