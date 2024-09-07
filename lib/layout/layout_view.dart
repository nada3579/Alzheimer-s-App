import 'package:flutter/material.dart';
import 'package:althhimer_app/account/pages/account_view.dart';
import 'package:althhimer_app/features/home/pages/home_view.dart';
import 'package:althhimer_app/features/task_bottom_sheet.dart';
import 'package:althhimer_app/features/today/pages/today_view.dart';
import 'package:althhimer_app/identify/pages/identify_view.dart';

import '../identify/pages/id.dart';

class Constants {
  static const Color kBlue = Color(0xFF669197);
}

class LayoutView extends StatefulWidget {
  static const String routeName = "layout";

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeView(),
    TodayView(),
    IdentifyScreen(),
    AccountView(),
    Identifyview(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => TaskBottomSheet(),
          );
        },
        child: Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
        backgroundColor: Constants.kBlue,
      ),
      body: screens[currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: BottomNavigationBar(
          backgroundColor: Constants.kBlue,
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.white70,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.today_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_album_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
