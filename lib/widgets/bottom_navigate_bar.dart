import 'package:flutter/material.dart';
import 'package:my_first_app/themes/global_style.dart';
import 'package:my_first_app/themes/global_light_theme.dart';

class CustomBottomNavigateBar extends StatefulWidget{
  final Function(int) onItemTapped;

  const CustomBottomNavigateBar({
    super.key,
    required this.onItemTapped,
  });
  @override
  CustomBottomNavigateBarState createState() => CustomBottomNavigateBarState();
}

class CustomBottomNavigateBarState extends State<CustomBottomNavigateBar>{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      backgroundColor: lightTheme.scaffoldBackgroundColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: GlobalStyle.primaryColor,
      unselectedItemColor: GlobalStyle.textColorBlackGray,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          activeIcon: Icon(Icons.bookmark),
          label: 'Bookmark',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: widget.onItemTapped,
    );

  }
}