import 'package:collapsable_app_scaffold/app_scaffold.dart';
import 'package:collapsable_app_scaffold/extensions.dart';
import 'package:flutter/material.dart';

import 'localization.dart';
import 'navigation_item.dart';

/// The navigation drawer for the app.
/// This listens to changes in the route to update which page is currently been shown
class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key,
    this.pathToAppIcon,
    required this.headerText,
    required this.items,
    required this.currentIndex,
    required this.onPageSelected,
  }) : super(key: key);

  final String? pathToAppIcon;

  final Widget headerText;

  final List<NavigationItem> items;

  final int currentIndex;

  final OnPageSelected onPageSelected;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  bool collapsed = true;

  @override
  Widget build(BuildContext context) {
    final drawer = Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  /*const UserAccountsDrawerHeader(
                    accountName: Text('User'),
                    accountEmail: Text('user@email.com'),
                    currentAccountPicture: CircleAvatar(
                      child: Icon(Icons.android),
                    ),
                  ),*/
                  if (!collapsed) AppBar(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    leading: (widget.pathToAppIcon == null)
                        ? null
                        : Image.asset(widget.pathToAppIcon!),
                    title: widget.headerText,
                  ),
                  if (!collapsed) Container(
                      color: Theme.of(context).colorScheme.background,
                      height: 1
                  ),
                  ..._items(collapsed)
                ],
              ),
            ),
            ListTile(
              onTap: () => setState(() {
                collapsed = !collapsed;
              }),
              leading: Icon(collapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
              title: Text(collapsed ? '' : StringsCommon.collapse()))
          ],
        ),
      ),
    );

    if (!collapsed) {
      return drawer;
    } else {
      return SizedBox(
        width: 57,
        child: drawer,
      );
    }
  }

  List<Widget> _items(bool collapsed) {
    final List<Widget> result = [];
    if (Environment.isSmartphoneApp()) {
      result.add(const SizedBox(
        height: 16,
      ));
    }
    for (int i = 0; i < widget.items.length; i++) {
      final item = widget.items[i];
      final listTile = ListTile(
        leading: Icon(item.iconData),
        title: Text(collapsed ? '' : item.name),
        onTap: () async {
          /// Closes the drawer if applicable (which is only when it's not been displayed permanently) and navigates to the specified route
          /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
          /*if (widget.permanentlyDisplay) {
            Navigator.pop(context);
          }*/

          widget.onPageSelected(i);
        },
        selected: widget.currentIndex == i,
      );
      if (collapsed) {
        final tooltip = Tooltip(
          message: item.name,
          verticalOffset: -16,
          margin: const EdgeInsets.only(left: 40),
          decoration: BoxDecoration(
            color: Theme.of(context).textTheme.caption?.color?.withOpacity(0.80),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          textStyle: const TextStyle(color: Colors.white),
          preferBelow: true,
          child: listTile,
        );
        result.add(tooltip);
      } else {
        result.add(listTile);
      }
    }
    return result;
  }
}