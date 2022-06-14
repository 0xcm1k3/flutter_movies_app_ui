// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(color: kBackgroundColor, boxShadow: [
        BoxShadow(
          offset: const Offset(1, 0),
          color: Colors.black.withOpacity(0.2),
          blurRadius: 5,
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bottmNavItem(
            index: 0,
            selected: selectedIndex == 0,
            icon: Icons.home_rounded,
          ),
          _bottmNavItem(
              index: 1,
              selected: selectedIndex == 1,
              icon: Icons.play_circle_rounded),
          _bottmNavItem(
            index: 2,
            selected: selectedIndex == 2,
            icon: Icons.person,
          ),
        ],
      ),
    );
  }

  InkWell _bottmNavItem(
      {int index = 0, required IconData icon, bool selected = false}) {
    return InkWell(
      onTap: () {
        if (selectedIndex != index)
          setState(() {
            selectedIndex = index;
          });
      },
      child: ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          colors: (selected)
              ? [
                  kIconGradientSecond,
                  kIconGradientFirst,
                ]
              : [Colors.white, Colors.white],
        ).createShader(rect),
        child: Icon(
          icon,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
