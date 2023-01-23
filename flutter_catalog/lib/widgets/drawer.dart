import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://i.guim.co.uk/img/media/fbb1974c1ebbb6bf4c4beae0bb3d9cb93901953c/10_7_2380_1428/master/2380.jpg?width=620&quality=45&dpr=2&s=none";
    return Drawer(
        child: Container(
      color: Colors.deepPurple,
      child: ListView(
        children: [
          DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Dipankar"),
                accountEmail: Text("dipankar@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              )),
          ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    ));
  }
}
