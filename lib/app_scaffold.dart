import 'package:collapsable_app_scaffold/app_drawer.dart';
import 'package:collapsable_app_scaffold/navigation_item.dart';
import 'package:flutter/material.dart';

typedef OnPageSelected = void Function(int newIndex);

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    this.pathToAppIcon,
    required this.headerText,
    required this.navigationItems,
    required this.currentIndex,
    required this.onPageSelected,
    this.appBar,
    this.tabbarEnabled = false,
    this.floatingActionButton
  }) : super(key: key);

  final List<NavigationItem> navigationItems;

  final int currentIndex;

  final OnPageSelected onPageSelected;

  final FloatingActionButton? floatingActionButton;

  final bool tabbarEnabled;

  final String? pathToAppIcon;
  final Widget headerText;

  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    assert(!tabbarEnabled || (tabbarEnabled && navigationItems.length > 1),
      'A bottom navigation bar requires at least 2 pages but only ${navigationItems.length} is given.');

    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    final AppBar? modifiedAppBar = appBar == null ? null : AppBar(
      key: appBar?.key,
      automaticallyImplyLeading: displayMobileLayout,
      title: appBar?.title,
      actions: appBar?.actions ?? [],
      backgroundColor: displayMobileLayout ? Colors.orange : appBar?.backgroundColor,
    );
    return Row(
      children: [
        if (!displayMobileLayout)
          AppDrawer(
            pathToAppIcon: pathToAppIcon,
            headerText: headerText,
            items: navigationItems,
            currentIndex: currentIndex,
            onPageSelected: onPageSelected),
        Expanded(
          child: Scaffold(
            appBar: modifiedAppBar,
            drawer: displayMobileLayout && !tabbarEnabled
                ? AppDrawer(
                    pathToAppIcon: pathToAppIcon,
                    headerText: headerText,
                    items: navigationItems,
                    currentIndex: currentIndex,
                    onPageSelected: onPageSelected)
                : null,
            body: navigationItems[currentIndex].body,
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: (displayMobileLayout && tabbarEnabled) ? BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: onPageSelected,
                  type: BottomNavigationBarType.fixed,
                  items: <BottomNavigationBarItem>[
                    for (NavigationItem item in navigationItems)
                      BottomNavigationBarItem(
                        icon: Icon(item.iconData),
                        label: item.name,
                      )
                  ]
            ) : null
          ),
        )
      ],
    );
  }
}