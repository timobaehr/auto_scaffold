# auto_scaffold

With increasing screen size a drawer becomes more common. On smartphones bottom navigation bars are
often used. This plugin helps to automatically switch between those depending on the screen size.

On small screens a bottom navigation bar can be used:
![Bottom Navigation Bar](https://github.com/timobaehr/auto_scaffold/tree/master/example/screenshots/bottom_navigation_bar.png)

On small screens a default drawer can be used (`tabBarDisabled: true`):
![Drawer mobile](https://github.com/timobaehr/auto_scaffold/tree/master/example/screenshots/drawer_mobile.png)

On large screens (like tablet or desktop) the drawer is collapsible and is not shown as overlay 
above the content:
![Drawer desktop](https://github.com/timobaehr/auto_scaffold/tree/master/example/screenshots/drawer_desktop.png)

## Features

► Automatically switch between collapsible app drawer (position left) and bottom navigation bar depending on screen width

► Disable bottom navigation tab bar on small devices and then use regular drawer instead (without collapse button)

► Show tooltips if the drawer is collapsed on mouse hover on Desktop

► Hide drawer leading if the drawer is collapsed

## Getting started

Use `AutoScaffold` instead of `Scaffold`.

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  auto_scaffold: <latest_version>
```

In your library add the following import:

```dart
import 'package:auto_scaffold/app_scaffold.dart';
import 'package:auto_scaffold/navigation_item.dart';
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Example

```dart
class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {

  _ExampleState(): super();

  int _selectedPageIndex = 0;
  String _appBarTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return AutoScaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      tabBarDisabled: true,
      drawerLeading: Icon(Icons.favorite, color: Colors.red),
      drawerTitle: Text('Your App',
          style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color)),
      backgroundColor: Colors.blue.shade50,
      selectedNavigationItemColor: Colors.black,
      unselectedNavigationItemColor: Colors.black54,
      onPageSelected: (int pageIndex) {
        setState(() {
          _selectedPageIndex = pageIndex;

          switch (_selectedPageIndex) {
            case 0: _appBarTitle = 'Home'; break;
            case 1: _appBarTitle = 'Settings'; break;
          }
        });
      },
      currentIndex: _selectedPageIndex,
      navigationItems: [
        NavigationItem(
          name: 'Home',
          iconData: Icon(Icons.home),
          route: '/',
          body: Text('Home')
        ),
        NavigationItem(
            name: 'Settings',
            iconData: Icon(Icons.settings),
            route: '/settings',
            body: Text('Settings'),
        )
      ],
    );
  }
}
```

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/timobaehr/auto_scaffold/issues).
If you fixed a bug or implemented a new feature, please send a [pull request](https://github.com/timobaehr/auto_scaffold/pulls).