import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_8/featuers/home/Favorit_tap.dart';
import 'package:flutter_application_8/featuers/home/Home_tap.dart';
import 'package:flutter_application_8/featuers/home/Map_tap.dart';
import 'package:flutter_application_8/featuers/home/Profile_Tap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 0;
  final List<Widget> tabs = [
     HomeTap() ,
     MapTap(),
    ProfileTap(),
    FavoritTap(),
     // Add your favorite tap widget here.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
       FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
       FloatingActionButton(onPressed: (){}
      ,child: Icon(Icons.add),),
      body: tabs[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: AppLocalizations.of(context)!.home),
            BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: AppLocalizations.of(context)!.map),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: AppLocalizations.of(context)!.profile),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: AppLocalizations.of(context)!.favorit)
          ]),
    );
  }
}
