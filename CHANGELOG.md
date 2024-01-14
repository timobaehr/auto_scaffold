# Changelog

## [1.1.3] - 14.01.2024

* Show tooltip again on hover
* Fix: Use font color onInverseSurface from theme for tooltip text as default
* Fix: Use color background from theme for drawer as default

## [1.1.2] - 13.01.2024

* Fix: Collapsed not clickable, disable Tooltip for the first

## [1.1.1] - 08.01.2024

* Fix: Collapsed menu should be rendered with latest Flutter version on Fold devices

## [1.1.0] - 12.05.2023

* Provide more API dartdoc documentation
* Make library compatible with Dart v3.x
* Pass static analysis: Resolve deprecation errors
* Do not expose internal classes just relevant inside this package

## [1.0.4] - 30.04.2021

* Remove build warning (caused by Flutter Web and nullable Locale)

## [1.0.3] - 29.04.2021

* Undo (official) Flutter web compatibility for analyzer because otherwise import of latest version 
  fails on projects that cannot be migrated to null safety. The project is still running on Flutter
  web even this is not detected from analyzer.

## [1.0.2] - 29.04.2021

* Add selected indicator on top of the item tile in color of selected items
* Flutter web compatibility (also for analyzer)

## [1.0.1] - 29.04.2021

* Fix: Item drawer color default (if not set by client)

## [1.0.0] - 29.04.2021

* First version of the auto scaffold.
