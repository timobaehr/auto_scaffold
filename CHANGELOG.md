# Changelog

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
