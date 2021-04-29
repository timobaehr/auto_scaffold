import 'package:auto_scaffold/app_scaffold.dart';
import 'package:auto_scaffold/navigation_item.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Example()));

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  _ExampleState() : super();

  int _selectedPageIndex = 0;
  String _appBarTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return AutoScaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      tabBarDisabled: false,
      drawerLeading: Icon(Icons.favorite, color: Colors.red),
      drawerTitle: Text('Your App',
          style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color)),
      backgroundColor: Colors.blue.shade50,
      selectedNavigationItemColor: Colors.red,
      unselectedNavigationItemColor: Colors.black54,
      selectedDrawerNavigationItemBackground: Colors.black12,
      onPageSelected: (int pageIndex) {
        setState(() {
          _selectedPageIndex = pageIndex;

          switch (_selectedPageIndex) {
            case 0:
              _appBarTitle = 'Home';
              break;
            case 1:
              _appBarTitle = 'Settings';
              break;
          }
        });
      },
      currentIndex: _selectedPageIndex,
      navigationItems: [
        NavigationItem(
            name: 'Home',
            icon: Icon(Icons.home),
            route: '/',
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Welcome to collapsible_app_scaffold example app.',
                        style: Theme.of(context).textTheme.headline5),
                    _headline('Features'),
                    _item(
                        'Automatically switch between collapsible app drawer (position left) and bottom navigation bar depending on screen width'),
                    _item(
                        'Disable bottom navigation tab bar on small devices and then use regular drawer instead (without collapse button)'),
                    _item(
                        'Show tooltips if the drawer is collapsed on mouse hover on Desktop'),
                    _item('Hide drawer leading if the drawer is collapsed'),
                  ],
                ),
              ),
            )),
        NavigationItem(
          name: 'Settings',
          icon: Icon(Icons.settings),
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
        child: Text(headline, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _item(String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('► $item'),
      ),
    );
  }
}
