# jaspr_icons_pack

An easy and efficient way to use SVG icons in your Jaspr applications. This package provides a simple `SvgIcon()` component and a comprehensive, tree-shakable library of 12 icon collections.

## Overview

Insert icons just like you do in flutter.


## Features

- **Simple API:** A single, easy-to-use `SvgIcon()` component.
- **Tree-Shakable:** Only the icons you import are included in your final compiled app.
- **Fully Customizable:** Easily control the width, height, color (`fill`), stroke, and apply custom CSS classes.
- **Type-Safe:** All icons are `static const` fields, providing compile-time safety and IDE auto-completion.
- **Comprehensive Icon Set:** Includes 12 different icon collections.

## Installation

Add `jaspr_icons_pack` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  jaspr_icons_pack: ^1.0.0
```

Then, run `dart pub get`.

## Usage

Import the package and use the `SvgIcon()` component with the desired icon.

```dart
import 'package:jaspr/jaspr.dart';

// Import the main library file
import 'package:jaspr_icons_pack/jaspr_icons_pack.dart';

class MyAwesomeComponent extends StatelessComponent {
  @override
  Component build(BuildContext context) => div([
    // 1. Basic Usage: Display the 'home' icon with default settings.
    SvgIcon(MaterialIcons.icon_home),

    // 2. Custom Size and Color: Display a large, red 'favorite' icon.
    SvgIcon(
      MaterialIcons.icon_favorite,
      size: 50,
      color: Colors.red,
    ),


    // 4. Using Stroke Properties: For icons that support it.
    SvgIcon(
      MaterialIcons.icon_circle,
      color: Colors.transparent,
      stroke: Colors.black,
      strokeWidth: '2px',
    ),
  ]);
}
```

## Available Icons
> Open an issue on github if there is a certain icon family that you think should be included

There's currently 12 icon collections:
| Collection | Class | Naming convention | Example |
|------------|-------|-------------------|---------|
| Google Material Icons | `MaterialIcons` | `icon_<style>_<icon_name>` with a plain alias `icon_<icon_name>` for the default icon where available | `MaterialIcons.icon_home`, `MaterialIcons.icon_baseline_home`, `MaterialIcons.icon_outline_home`, `MaterialIcons.icon_round_home`, `MaterialIcons.icon_sharp_home`, `MaterialIcons.icon_twotone_home` |
| Google Material Symbols | `MaterialSymbols` | `icon_<icon_name>` for the default symbol, `<style>_<icon_name>` for alternates, and combined variants like `<style1>_<style2>_<icon_name>` | `MaterialSymbols.icon_home`, `MaterialSymbols.outline_home`, `MaterialSymbols.round_home`, `MaterialSymbols.sharp_home`, `MaterialSymbols.outline_round_home`, `MaterialSymbols.outline_sharp_home` |
| Lucide Icons | `LucideIcons` | `icon_<icon_name>` | `LucideIcons.icon_accessibility` |
| Feather Icons | `FeatherIcons` | `icon_<icon_name>` | `FeatherIcons.icon_activity` |
| Fluent Icons | `FluentIcons` | `icon_<icon_name>_<size>_<style>` | `FluentIcons.icon_access_time_20_filled`, `FluentIcons.icon_access_time_24_regular` |
| Tabler Icons | `TablerIcons` | `filled_<icon_name>` | `TablerIcons.filled_accessible`, `TablerIcons.filled_alarm` |
| Solar Icons | `SolarIcons` | Solar uses upstream variant names. Common patterns are `duotone_<icon_name>_bold` and `icon_<icon_name>_<style>` | `SolarIcons.duotone_add_circle_bold`, `SolarIcons.icon_add_circle_outline`, `SolarIcons.icon_add_circle_linear`, `SolarIcons.icon_add_circle_broken` |
| Font Awesome | `FontAwesome` | `icon_<icon_name>` | `FontAwesome.icon_a`, `FontAwesome.icon_ad` |
| Animated Icons | `AnimatedIcons` | `filled_<icon_name>` | `AnimatedIcons.filled_beer`, `AnimatedIcons.filled_bell_alert` |
| Spinners | `Spinners` | `icon_<icon_name>` | `Spinners.icon_12_dots_scale_rotate`, `Spinners.icon_180_ring` |
| Flags | `Flags` | `icon_<country_code>` | `Flags.icon_ng`, `Flags.icon_us`, `Flags.icon_gb` |
| Emojis | `Emojis` | `icon_<emoji_name>` | `Emojis.icon_1st_place_medal`, `Emojis.icon_0` |

## API Reference

### `SvgIcon()` Component

| Parameter     | Type                         | Description                                                                 |
|---------------|------------------------------|-----------------------------------------------------------------------------|
| `icon`         | `IconData`                   | **Required.** The icon data object to render (e.g `MaterialIcons.icon_home`).   |
| `size`         | `double`                      | The width and height of the icon. Defaults to `24`.                       |
| `color`         | `Color?`                     | The fill or stroke color of the icon. Defaults to inheriting the parent's text color (`currentColor`). |
| `viewBox`      | `(double, double, double, double)?` | defines the position and dimensions of the SVG viewport, allowing you to control how the SVG content is scaled and displayed. It consists of four values: min-x, min-y, width, and height, which determine the visible area and scaling of the SVG graphic |
| `strokeWidth`  | `String?`                    | efines different types of endings for a line or an open path                                                    |
| `strokeLineJoin`  | enum `StrokeLineJoin?`                    | defines the shape of the corners where two lines meet                                                    |
| `strokeLineCap`| enum `StrokeLineCap?`                    | The width of the stroke.                                                    |
| `classes`      | `String?`                    | A space-separated list of CSS classes to apply to the SVG element.          |
| `key`          | `Key?`                       | A key to uniquely identify the component.                                   |
| `id`           | `String?`                    | The HTML `id` attribute for the SVG element.                                |
| `styles`       | `Styles?`                    | Inline CSS styles to apply to the SVG element.                              |

## Using Your Own Custom Icons

The `SvgIcon()` component is designed to work with any `IconData` object. You can create your own library of icons by defining them with the same structure.

```dart
// my_custom_icons.dart
import 'package:jaspr_icons_pack/jaspr_icons_pack.dart';

class MyIcons {
  const MyIcons._();

  static const IconData heart = IconData( [
    {
      'tag': 'path',
      'attrs': {
        'd': r'''M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z''',
      }
    }
  ]);
}

// In your component:
 SvgIcon(MyIcons.heart, color: Colors.pink)
```
> a `'tag: 'root'` can be used to specify attributes for the root svg element.
## License

The included icons are licensed under the **Apache License 2.0**. Your use of these icons is subject to the terms and conditions of that license.

## Issues and Contributions

If you encounter any bugs or have a feature request, please file an issue on the [Github issue tracker](https://github.com/makanakidev/jaspr_icons_pack/issues). Contributions are welcome

## Inspiration

This package was inspired by [Jaspr Icons](https://pub.dev/packages/jaspr_icons)
