import 'package:collapsible_app_scaffold/app_scaffold.dart';
import 'package:collapsible_app_scaffold/navigation_item.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Example()));

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {

  _ExampleState(): super();

  int _selectedPageIndex = 0;
  String appBarTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      tabBarDisabled: false,
      drawerLeading: Icon(Icons.favorite, color: Colors.red),
      drawerTitle: Text('Your App',
          style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color)),
      onPageSelected: (int pageIndex) {
        setState(() {
          _selectedPageIndex = pageIndex;

          switch (_selectedPageIndex) {
            case 0: appBarTitle = 'Home'; break;
            case 1: appBarTitle = 'Settings'; break;
          }
        });
      },
      currentIndex: _selectedPageIndex,
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
