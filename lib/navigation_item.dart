import 'package:flutter/material.dart';

class NavigationItem {
  NavigationItem(
      {required this.route,
      required this.name,
      required this.icon,
      required this.body});

  final String route;

  final String name;

  final Widget icon;

  final Widget body;
}
