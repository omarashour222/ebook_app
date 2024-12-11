import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/main_views/views/bottom_nav.dart';
import 'package:ebook_app/features/signin_screen/cubit/sign_in_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Drawer menuDrawer(SignInCubit signInCubit, MainViewController controller) {
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            currentAccountPictureSize: Size(68, 68),
            currentAccountPicture: const CircleAvatar(
              backgroundImage:
                  AssetImage(imagePath + 'profile pic placeholder.webp'),
            ),
            accountName: Text(signInCubit.model.data?.name ?? 'N/A'),
            accountEmail:
                Text(signInCubit.model.data?.email ?? 'No email created')),
        const Divider(
          color: Colors.transparent,
        ),
        ListTile(
          leading: Icon(CupertinoIcons.heart),
          title: Text('Saved Books'),
          onTap: () {
            controller.updateIndex(1);
          },
        ),
        ListTile(
          leading: Icon(CupertinoIcons.person),
          title: Text('profile'),
          onTap: () {
            controller.updateIndex(3);
          },
        ),
        Divider(
          color: Colors.black,
          indent: 20,
          endIndent: 20,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('settings'),
          onTap: () {
            controller.updateIndex(2);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {},
        ),
      ],
    ),
  );
}
