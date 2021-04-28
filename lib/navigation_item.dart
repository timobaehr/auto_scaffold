import 'package:flutter/material.dart';

class NavigationItem {

  NavigationItem({
    required this.route,
    required this.name,
    required this.iconData,
    required this.body
  });

  final String route;

  final String name;

  final IconData iconData;

  final Widget body;

}