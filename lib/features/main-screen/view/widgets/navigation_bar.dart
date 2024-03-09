import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../router/routes.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    AutoRouter.of(context).pushNamed(routes[index].route);

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: routes
          .map((r) => BottomNavigationBarItem(icon: r.icon, label: r.label))
          .toList(),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
