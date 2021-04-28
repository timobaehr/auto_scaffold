import 'package:collapsable_app_scaffold/app_scaffold.dart';
import 'package:collapsable_app_scaffold/navigation_item.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Example()));

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {

  _ExampleState(): super();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      onPageSelected: (int pageIndex) {},
      headerText: Text('HeaderText'),
      currentIndex: 0,
      navigationItems: [
        NavigationItem(
          name: 'Home',
          iconData: Icons.home,
          route: '/',
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Welcome to collapsable_app_scaffold example app.',
                      style: Theme.of(context).textTheme.headline5),
                  _headline('Features'),
                  _item('...'),
                ],
              ),
            ),
          )
        ),
        NavigationItem(
            name: 'Settings',
            iconData: Icons.settings,
            route: '/settings',
            body: Text('Settings goes here',
                style: Theme.of(context).textTheme.headline5),
        )
      ],
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Example app'),
      ),
    );
  }

  Widget _headline(String headline) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(headline,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _item(String item) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('► $item'),
    );
  }
}
