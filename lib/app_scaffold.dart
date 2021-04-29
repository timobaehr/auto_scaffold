import 'package:auto_scaffold/app_drawer.dart';
import 'package:auto_scaffold/navigation_item.dart';
import 'package:flutter/material.dart';

typedef OnPageSelected = void Function(int newIndex);

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough
class AutoScaffold extends StatelessWidget {
  const AutoScaffold({
    Key? key,
    this.drawerLeading,
    this.drawerTitle,
    this.backgroundColor,
    required this.navigationItems,
    required this.currentIndex,
    required this.onPageSelected,
    this.appBar,
    this.tabBarDisabled = false,
    this.floatingActionButton,
    this.tooltipDecoration,
    this.tooltipTextStyle,
    this.selectedNavigationItemColor,
    this.unselectedNavigationItemColor,
    this.selectedDrawerNavigationItemBackground,
  }) : super(key: key);

  final List<NavigationItem> navigationItems;

  final int currentIndex;

  final OnPageSelected onPageSelected;

  final FloatingActionButton? floatingActionButton;

  final bool tabBarDisabled;

  final Widget? drawerLeading;
  final Widget? drawerTitle;

  final AppBar? appBar;

  final Color? backgroundColor;

  final Decoration? tooltipDecoration;

  final TextStyle? tooltipTextStyle;

  final Color? selectedNavigationItemColor;

  final Color? unselectedNavigationItemColor;

  final Color? selectedDrawerNavigationItemBackground;

  @override
  Widget build(BuildContext context) {
    final tabBarEnabled = !tabBarDisabled && navigationItems.length > 1 && navigationItems.length < 6;

    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    final AppBar? modifiedAppBar = appBar == null ? null : AppBar(
      key: appBar?.key,
      automaticallyImplyLeading: displayMobileLayout,
      title: appBar?.title,
      actions: appBar?.actions ?? [],
      backgroundColor: appBar?.backgroundColor,
    );
    return Row(
      children: [
        if (!displayMobileLayout)
          CollapsibleDrawer(
            leading: drawerLeading,
              title: drawerTitle,
            items: navigationItems,
            currentIndex: currentIndex,
            onPageSelected: onPageSelected,
            backgroundColor: backgroundColor,
            tooltipDecoration: tooltipDecoration,
            tooltipTextStyle: tooltipTextStyle,
            selectedNavigationItemColor: selectedNavigationItemColor,
            unselectedNavigationItemColor: unselectedNavigationItemColor,
            selectedNavigationItemBackground: selectedDrawerNavigationItemBackground,
          ),
        Expanded(
          child: Scaffold(
            appBar: modifiedAppBar,
            drawer: displayMobileLayout && !tabBarEnabled
                ? CollapsibleDrawer(
                    leading: drawerLeading,
                    title: drawerTitle,
                    items: navigationItems,
                    currentIndex: currentIndex,
                    onPageSelected: onPageSelected,
                    backgroundColor: backgroundColor,
                    tooltipDecoration: tooltipDecoration,
                    tooltipTextStyle: tooltipTextStyle,
                    selectedNavigationItemColor: selectedNavigationItemColor,
                    unselectedNavigationItemColor: unselectedNavigationItemColor,
                    selectedNavigationItemBackground: selectedDrawerNavigationItemBackground,
                )
                : null,
            body: navigationItems[currentIndex].body,
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: (displayMobileLayout && tabBarEnabled) ? BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: onPageSelected,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: backgroundColor,
                  selectedItemColor: selectedNavigationItemColor,
                  unselectedItemColor: unselectedNavigationItemColor,
                  items: <BottomNavigationBarItem>[
                    for (NavigationItem item in navigationItems)
                      BottomNavigationBarItem(
                        icon: item.icon,
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