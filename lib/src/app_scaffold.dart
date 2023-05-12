import 'package:auto_scaffold/src/app_drawer.dart';
import 'package:auto_scaffold/src/navigation_item.dart';
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

  /// The navigation items are either displayed inside the drawer menu oder inside the bottom navigation bar.
  final List<NavigationItem> navigationItems;

  /// The index of the currently selected item.
  final int currentIndex;

  /// Update the title when the user navigates.
  final OnPageSelected onPageSelected;

  /// A button displayed floating above [body], in the bottom right corner.
  ///
  /// Typically a [FloatingActionButton].
  /// This is a replacement for [Scaffold], usage of FloatingActionButton is identical.
  final FloatingActionButton? floatingActionButton;

  /// Tab bar can be disabled if necessary.
  final bool tabBarDisabled;

  /// Place a leading widget if necessary.
  final Widget? drawerLeading;

  /// Add a drawer title if necessary.
  final Widget? drawerTitle;

  /// An app bar to display at the top of the scaffold.
  final AppBar? appBar;

  /// Background color of drawer or bottom navigation bar.
  final Color? backgroundColor;

  /// Specifies the tooltip's shape and background color. Tooltip becomes visible
  /// if drawer is visible and collapsed and user hovers over the icon.
  final Decoration? tooltipDecoration;

  /// Text style of the text shown inside the tooltip.
  final TextStyle? tooltipTextStyle;

  /// Icon and text color of the selected navigation item.
  final Color? selectedNavigationItemColor;

  /// Icon and text color of a non-selected item.
  final Color? unselectedNavigationItemColor;

  /// Background color of a selected navigation item.
  final Color? selectedDrawerNavigationItemBackground;

  @override
  Widget build(BuildContext context) {
    final tabBarEnabled = !tabBarDisabled &&
        navigationItems.length > 1 &&
        navigationItems.length < 6;

    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    final AppBar? modifiedAppBar = appBar == null
        ? null
        : AppBar(
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
            selectedNavigationItemBackground:
                selectedDrawerNavigationItemBackground,
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
                      unselectedNavigationItemColor:
                          unselectedNavigationItemColor,
                      selectedNavigationItemBackground:
                          selectedDrawerNavigationItemBackground,
                    )
                  : null,
              body: navigationItems[currentIndex].body,
              floatingActionButton: floatingActionButton,
              bottomNavigationBar: (displayMobileLayout && tabBarEnabled)
                  ? BottomNavigationBar(
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
                        ])
                  : null),
        )
      ],
    );
  }
}
