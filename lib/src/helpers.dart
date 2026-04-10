/// Structured SVG data consumed by [SvgIcon].
class IconData {
  /// The SVG element tree that defines the icon.
  ///
  /// Each element map can contain:
  /// - `tag`: the name of the svg element
  /// - `attrs`: a map of attributes specific to the element
  /// - `children`: optional nested xml elements
  /// - `text`: optional text node content
  final List<Map<String, dynamic>> content;

  /// Creates an [IconData] instance from structured SVG content.
  const IconData(this.content);
}

/// Supported values for the SVG `stroke-linejoin` attribute.
enum StrokeLineJoin {
  /// arcs
  arcs('arcs'),

  /// bevel
  bevel('bevel'),

  /// miter
  miter('miter'),

  /// miter-clip
  miterClip('miter-clip'),

  /// round
  round('round');

  /// raw enum value
  final String value;
  const StrokeLineJoin(this.value);
}

/// Supported values for the SVG `stroke-linecap` attribute.
enum StrokeLineCap {
  /// butt
  butt,

  /// round
  round,

  /// square
  square,
}
