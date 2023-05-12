import 'package:flutter/material.dart';

class NavigationItem {
  NavigationItem(
      {required this.route,
      required this.name,
      required this.icon,
      required this.body});

  /// The route of this navigation item.
  final String route;

  /// Text shown as name inside tabbar/drawer.
  final String name;

  /// Icon shown inside tabbar/drawer.
  final Widget icon;

  /// The body for this navigation item.
  final Widget body;
}
