// ignore_for_file: public_member_api_docs

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../jaspr_svg.dart';

class SvgIcon extends StatelessComponent {
  /// the icon data to render
  final IconData icon;

  /// the height and width of the icon (defaults to 24)
  final double size;

  /// the viewbox of the icon
  final (double, double, double, double) viewBox;

  /// the stroke or fill color of the icon
  final Color? color;

  /// the stroke width of the icon
  final String? strokeWidth;

  /// the stroke line join of the icon
  final StrokeLineJoin? strokeLineJoin;

  /// the stroke line cap of the icon
  final StrokeLineCap? strokeLineCap;

  /// css classes to be applied to the svg element
  final String? classes;

  /// the key to be used by the framework
  final String? id;

  /// inline css styles to be applied to the svg element
  final Styles? style;

  /// Render an svg icon from a structured [IconData] object.
  ///
  /// This component is safe for both server-side and client-side rendering.
  ///
  /// Currently available 12 icon classes:
  /// - MaterialIcons
  /// - MaterialSymbols
  /// - LucideIcons
  /// - FluentIcons
  /// - TablerIcons
  /// - SolarIcons
  /// - FeatherIcons
  /// - FontAwesome
  /// - Spinners
  /// - Emojis
  /// - Flags
  /// - AnimatedIcons
  ///
  /// See the package README for more details
  const SvgIcon(
    this.icon, {
    this.size = 24,
    this.viewBox = const (0, 0, 24, 24),
    this.color,
    this.strokeWidth,
    this.strokeLineJoin,
    this.strokeLineCap,
    this.classes,
    this.id,
    this.style,
  });

  @override
  Component build(BuildContext context) => svg(
    viewBox: '${viewBox.$1} ${viewBox.$2} ${viewBox.$3} ${viewBox.$4}',
    width: size.px,
    height: size.px,
    key: key,
    id: id,
    classes: classes,
    styles: Styles(raw: {'color': ?color?.value, 'min-width': '${size}px', 'min-height': '${size}px', ...?style?.properties}),
    attributes: {
      'fill': color?.value ?? 'currentColor',
      if (icon.content.elementAtOrNull(0)?['tag'] == 'root') ...icon.content[0]['attrs'] as Map<String, String>,
      'stroke-width': ?strokeWidth,
      'stroke-linejoin': ?strokeLineJoin?.value,
      'stroke-linecap': ?strokeLineCap?.name,
    },
    _paths(icon),
  );

  List<Component> _paths(IconData icon) => [
    for (final elementData in icon.content.where((element) => element['tag'] != 'root')) _node(elementData),
  ];

  Component _node(Map<String, dynamic> elementData) {
    final text = elementData['text'];
    if (text is String) {
      return .text(text);
    }

    final tag = elementData['tag'] as String;
    final attrs = {...?((elementData['attrs'] as Map?)?.cast<String, String>())};

    final children = (elementData['children'] as List?)
        ?.whereType<Map>()
        .map((child) => _node(child.cast<String, dynamic>()))
        .toList();

    return .element(
      tag: tag,
      attributes: attrs,
      children: children,
    );
  }
}
