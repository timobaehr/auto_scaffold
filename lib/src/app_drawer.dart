import 'package:auto_scaffold/src/app_scaffold.dart';
import 'package:auto_scaffold/src/extensions.dart';
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
    this.selectedNavigationItemColor,
    this.unselectedNavigationItemColor,
    this.selectedNavigationItemBackground,
    this.collapseStringResource,
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

  final Color? selectedNavigationItemColor;

  final Color? unselectedNavigationItemColor;

  final Color? selectedNavigationItemBackground;

  final String? collapseStringResource;

  @override
  _CollapsibleDrawerState createState() => _CollapsibleDrawerState();
}

class _CollapsibleDrawerState extends State<CollapsibleDrawer> {
  bool _collapsed = false;

  static const double WIDTH_SELECTED_INDICATOR = 3;

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
        if (!_collapsed && (widget.leading != null || widget.title != null))
          AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: widget.leading,
            title: widget.title,
          ),
        if (!_collapsed) Container(color: Theme.of(context).colorScheme.background, height: 1),
        ..._items(_collapsed)
      ],
    );

    final drawer = Drawer(
      child: Container(
        color: widget.backgroundColor ?? Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Expanded(child: list),
            if (!displayMobileLayout)
              if (!_collapsed)
                ListTile(
                    onTap: () => setState(() {
                          _collapsed = true;
                        }),
                    leading: Icon(Icons.arrow_back_ios),
                    title: Text(_collapsed ? '' : widget.collapseStringResource ?? StringsCommon.collapse()))
              else
                InkWell(
                  onTap: () => setState(() {
                    _collapsed = false;
                  }),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
          ],
        ),
      ),
    );

    if (!_collapsed) {
      return drawer;
    } else {
      return SizedBox(
        width: 57 + (widget.selectedNavigationItemBackground != null ? WIDTH_SELECTED_INDICATOR : 0),
        child: drawer,
      );
    }
  }

  Color _itemColor(bool selected) {
    return selected
        ? widget.selectedNavigationItemColor ?? Theme.of(context).colorScheme.secondary
        : widget.unselectedNavigationItemColor ?? Theme.of(context).hintColor;
  }

  List<Widget> _items(bool collapsed) {
    final List<Widget> result = [];
    if (Environment.isSmartphoneApp()) {
      result.add(const SizedBox(
        height: 16,
      ));
    }
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;

    for (int i = 0; i < widget.items.length; i++) {
      final selected = widget.currentIndex == i;
      final item = widget.items[i];
      final leading = Theme(
        data: ThemeData(iconTheme: IconThemeData(color: _itemColor(selected))),
        child: item.icon,
      );
      final onTap = () async {
        /// Closes the drawer if applicable (which is only when it's not been displayed permanently) and navigates to the specified route
        /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
        if (displayMobileLayout) {
          Navigator.pop(context);
        }

        widget.onPageSelected(i);
      };
      final isTileSelected = widget.currentIndex == i;
      final listTile = ListTile(
        leading: _collapsed ? null : leading,
        title: _collapsed ? leading : Text(collapsed ? '' : item.name, style: TextStyle(color: _itemColor(selected))),
        selected: isTileSelected,
        onTap: isTileSelected ? null : onTap,
        selectedTileColor: widget.selectedNavigationItemBackground,
      );

      Widget entry = widget.selectedNavigationItemBackground != null
          ? LayoutBuilder(builder: (context, constraints) {
              const double width = WIDTH_SELECTED_INDICATOR;
              return Row(
                children: [
                  Container(width: width, height: 48, color: selected ? _itemColor(true) : Colors.transparent),
                  Container(width: constraints.maxWidth - width, child: listTile)
                ],
              );
            })
          : listTile;

      if (collapsed) {
        final wrappedWithTooltip = Tooltip(
          message: item.name,
          preferBelow: false,
          waitDuration: const Duration(milliseconds: 500),
          decoration: widget.tooltipDecoration ??
              BoxDecoration(
                color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.80),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
          textStyle: widget.tooltipTextStyle ?? TextStyle(color: Theme.of(context).colorScheme.onInverseSurface),
          child: entry,
        );
        result.add(wrappedWithTooltip);
      } else {
        result.add(entry);
      }
    }
    return result;
  }
}
