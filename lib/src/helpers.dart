/// a helper class that stores the data for an svg icon
class IconData {
  /// a list of xml elements that form an svg
  ///
  /// each element is a map with the following keys:
  /// - `tag`: the name of the svg element
  /// - `attrs`: a map of attributes specific to the element
  /// - `children`: optional nested xml elements
  /// - `text`: optional text node content
  final List<Map<String, dynamic>> content;

  /// this can be used to supply a [icon] component with the data it needs to drawan svg icon
  const IconData(this.content);
}

/// stroke-linejoin options
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

/// stroke-linecap options
enum StrokeLineCap {
  /// butt
  butt,

  /// round
  round,

  /// square
  square,
}
