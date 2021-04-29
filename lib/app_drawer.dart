import 'package:collapsible_app_scaffold/app_scaffold.dart';
import 'package:collapsible_app_scaffold/extensions.dart';
import 'package:flutter/material.dart';

import 'localization.dart';
import 'navigation_item.dart';

/// The navigation drawer for the app.
/// This listens to changes in the route to update which page is currently been shown
class CollapsibleDrawer extends StatefulWidget {
  const CollapsibleDrawer({
    Key? key,
    this.leading,
    this.title,
    required this.items,
    required this.currentIndex,
    required this.onPageSelected,
    this.defaultCollapsed = false,
    this.backgroundColor,
    this.tooltipDecoration,
    this.tooltipTextStyle,
  }) : super(key: key);

  final Widget? leading;

  final Widget? title;

  final List<NavigationItem> items;

  final int currentIndex;

  final OnPageSelected onPageSelected;

  final bool defaultCollapsed;

  final Color? backgroundColor;

  final Decoration? tooltipDecoration;

  final TextStyle? tooltipTextStyle;

  @override
  _CollapsibleDrawerState createState() => _CollapsibleDrawerState();
}

class _CollapsibleDrawerState extends State<CollapsibleDrawer> {

  bool _collapsed = false;

  @override
  void initState() {
    _collapsed = widget.defaultCollapsed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// the collapse button should not be shown at bottom of regular drawer
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;

    final list = ListView(
      padding: EdgeInsets.zero,
      children: [
        /*const UserAccountsDrawerHeader(
                    accountName: Text('User'),
                    accountEmail: Text('user@email.com'),
                    currentAccountPicture: CircleAvatar(
                      child: Icon(Icons.android),
                    ),
                  ),*/
        if (!_collapsed && (widget.leading != null || widget.title != null)) AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: widget.leading,
          title: widget.title,
        ),
        if (!_collapsed) Container(
            color: Theme.of(context).colorScheme.background,
            height: 1
        ),
        ..._items(_collapsed)
      ],
    );

    final drawer = Drawer(
      child: Container(
        color: widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            if (displayMobileLayout) list,
            if (!displayMobileLayout) Expanded(child: list),
            if (!displayMobileLayout) ListTile(
              onTap: () => setState(() {
                _collapsed = !_collapsed;
              }),
              leading: Icon(_collapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
              title: Text(_collapsed ? '' : StringsCommon.collapse()))
          ],
        ),
      ),
    );

    if (!_collapsed) {
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
          decoration: widget.tooltipDecoration ?? BoxDecoration(
            color: Theme.of(context).textTheme.caption?.color?.withOpacity(0.80),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          textStyle: widget.tooltipTextStyle ?? const TextStyle(color: Colors.white),
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