// ignore_for_file: public_member_api_docs

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../jaspr_icons_pack.dart';

class SvgIcon extends StatelessComponent {
  static const (double, double, double, double) _defaultViewBox = (0, 0, 24, 24);

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
    this.viewBox = _defaultViewBox,
    this.color,
    this.strokeWidth,
    this.strokeLineJoin,
    this.strokeLineCap,
    this.classes,
    this.id,
    this.style,
  });

  @override
  Component build(BuildContext context) {
    final rootData = icon.content.elementAtOrNull(0)?['tag'] == 'root' ? icon.content[0] : null;
    final resolvedViewBox = _resolvedViewBox(rootData);
    final svgIdMap = _buildSvgIdMap(id);
    final rootAttrs = _resolveAttrs(
      {...?((rootData?['attrs'] as Map?)?.cast<String, String>())}..remove('viewBox'),
      svgIdMap,
    );

    return svg(
      viewBox: '${resolvedViewBox.$1} ${resolvedViewBox.$2} ${resolvedViewBox.$3} ${resolvedViewBox.$4}',
      width: size.px,
      height: size.px,
      key: key,
      id: id,
      classes: classes,
      styles: Styles(raw: {'color': ?color?.value, 'min-width': '${size}px', 'min-height': '${size}px', ...?style?.properties}),
      attributes: {
        'fill': color?.value ?? 'currentColor',
        ...rootAttrs,
        'stroke-width': ?strokeWidth,
        'stroke-linejoin': ?strokeLineJoin?.value,
        'stroke-linecap': ?strokeLineCap?.name,
      },
      _paths(icon),
    );
  }

  (double, double, double, double) _resolvedViewBox(Map<String, dynamic>? rootData) {
    if (viewBox != _defaultViewBox) return viewBox;

    final rootAttrs = (rootData?['attrs'] as Map?)?.cast<String, String>();
    final attrViewBox = rootAttrs?['viewBox'];

    if (attrViewBox != null) {
      final parts = attrViewBox.split(RegExp(r'\s+')).where((part) => part.isNotEmpty).toList();
      if (parts.length == 4) {
        final values = parts.map(double.tryParse).toList();
        if (values.every((value) => value != null)) {
          return (values[0]!, values[1]!, values[2]!, values[3]!);
        }
      }
    }

    return _defaultViewBox;
  }

  List<Component> _paths(IconData icon) {
    final svgIdMap = _buildSvgIdMap(id);
    return [
      for (final elementData in icon.content.where((element) => element['tag'] != 'root')) _node(elementData, svgIdMap),
    ];
  }

  Map<String, String> _buildSvgIdMap(String? prefix) {
    if (prefix == null || prefix.isEmpty) return const {};

    final ids = <String>{};

    void visit(Map<String, dynamic> node) {
      final attrs = (node['attrs'] as Map?)?.cast<String, dynamic>();
      final nodeId = attrs?['id'];
      if (nodeId is String && nodeId.isNotEmpty) {
        ids.add(nodeId);
      }

      final children = (node['children'] as List?)?.whereType<Map<String, dynamic>>();
      if (children != null) {
        for (final child in children) {
          visit(child);
        }
      }
    }

    for (final element in icon.content) {
      visit(element);
    }

    return {
      for (final value in ids) value: '$prefix--$value',
    };
  }

  Map<String, String> _resolveAttrs(Map<String, String> attrs, Map<String, String> svgIdMap) {
    if (svgIdMap.isEmpty) return attrs;

    return {
      for (final entry in attrs.entries) entry.key: _resolveAttrValue(entry.key, entry.value, svgIdMap),
    };
  }

  String _resolveAttrValue(String key, String value, Map<String, String> svgIdMap) {
    if (svgIdMap.isEmpty) return value;

    if (key == 'id') {
      return svgIdMap[value] ?? value;
    }

    var resolved = value;
    for (final entry in svgIdMap.entries) {
      resolved = resolved.replaceAll('url(#${entry.key})', 'url(#${entry.value})');
      resolved = resolved.replaceAll('#${entry.key}', '#${entry.value}');
      resolved = resolved.replaceAll('${entry.key}.', '${entry.value}.');
    }
    return resolved;
  }

  Component _node(Map<String, dynamic> elementData, Map<String, String> svgIdMap) {
    final text = elementData['text'];
    if (text is String) {
      return .text(text);
    }

    final tag = elementData['tag'] as String;
    final attrs = _resolveAttrs({...?((elementData['attrs'] as Map?)?.cast<String, String>())}, svgIdMap);

    final children = (elementData['children'] as List?)
        ?.whereType<Map>()
        .map((child) => _node(child.cast<String, dynamic>(), svgIdMap))
        .toList();

    return .element(
      tag: tag,
      attributes: attrs,
      children: children,
    );
  }
}
