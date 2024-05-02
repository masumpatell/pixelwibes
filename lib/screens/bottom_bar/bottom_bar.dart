import 'package:flutter/material.dart';
import 'package:pixelwibes/screens/like_bar/like_bar.dart';
import 'package:pixelwibes/screens/person_bar/person_bar.dart';
import '../../constants/appColor.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  final List _screens = [
    const Person_bar(),
    const Like_bar()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppColor.lightBlue,
        unselectedItemColor: AppColor.gray,
        selectedItemColor: AppColor.darkBlue,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'person',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
