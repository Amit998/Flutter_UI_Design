import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerListTile(
              svcSrc: "assets/icons/menu_dashbord.svg",
              title: "Dashboard",
              press: () {},
            ),
            DrawerListTile(
              svcSrc: "assets/icons/menu_tran.svg",
              title: "Transacttion",
              press: () {},
            ),
            DrawerListTile(
              svcSrc: "assets/icons/menu_task.svg",
              title: "Task",
              press: () {},
            ),
            DrawerListTile(
              svcSrc: "assets/icons/menu_doc.svg",
              title: "Document",
              press: () {},
            ),
            DrawerListTile(
              svcSrc: "assets/icons/menu_store.svg",
              title: "Store",
              press: () {},
            ),
            DrawerListTile(
              svcSrc: "assets/icons/menu_notification.svg",
              title: "Notification",
              press: () {},
            ),
            DrawerListTile(
              svcSrc: "assets/icons/menu_profile.svg",
              title: "Profile",
              press: () {},
            ),
            DrawerListTile(
              svcSrc: "assets/icons/menu_setting.svg",
              title: "Settings",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    @required this.title,
    @required this.svcSrc,
    @required this.press,
  }) : super(key: key);

  final String? title, svcSrc;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svcSrc!,
        color: Colors.white,
        height: 16,
      ),
      title: Text(
        title!,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
