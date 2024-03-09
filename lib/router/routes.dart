import 'package:flutter/material.dart';

final routes = <NavBarRoute>[
  NavBarRoute("/", const Icon(Icons.home), "Home"),
  NavBarRoute("/analytics", const Icon(Icons.analytics_outlined), "Analytic"),
];

class NavBarRoute {
  String route;
  Icon icon;
  String label;
  NavBarRoute(this.route, this.icon, this.label);
}