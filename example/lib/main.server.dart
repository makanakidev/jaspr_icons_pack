import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_svg/jaspr_svg.dart';

import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(
    Document(
      title: 'jaspr_svg Icon Gallery',
      body: const IconGalleryPage(),
    ),
  );
}

class IconGalleryPage extends StatelessComponent {
  const IconGalleryPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      [
        div(
          [
            _heroSection(),
            _namingSection(),
            _gallerySection(),
          ],
          styles: Styles(
            raw: {
              'margin': '0 auto',
              'max-width': '1280px',
              'display': 'flex',
              'flex-direction': 'column',
              'gap': '28px',
            },
          ),
        ),
      ],
      styles: Styles(
        raw: {
          'min-height': '100vh',
          'padding': '28px 18px 56px',
          'background': 'radial-gradient(circle at top, #f6efe3 0%, #f3ebda 25%, #fbfaf6 65%, #f6f3ed 100%)',
          'color': '#1f2937',
          'font-family': 'Iowan Old Style, Palatino, "Book Antiqua", Georgia, serif',
          'box-sizing': 'border-box',
        },
      ),
    );
  }

  Component _heroSection() {
    return section(
      [
        div(
          [
            div(
              [Component.text('jaspr_svg')],
              styles: Styles(
                raw: {
                  'display': 'inline-flex',
                  'align-items': 'center',
                  'width': 'fit-content',
                  'padding': '8px 14px',
                  'border-radius': '999px',
                  'border': '1px solid rgba(15, 23, 42, 0.12)',
                  'background': 'rgba(255, 255, 255, 0.72)',
                  'font-family': 'ui-monospace, SFMono-Regular, Menlo, monospace',
                  'font-size': '12px',
                  'letter-spacing': '0.08em',
                  'text-transform': 'uppercase',
                },
              ),
            ),
            h1(
              [Component.text('An icon gallery for all 12 bundled collections.')],
              styles: Styles(
                raw: {
                  'margin': '0',
                  'font-size': 'clamp(2.5rem, 6vw, 4.8rem)',
                  'line-height': '0.96',
                  'letter-spacing': '-0.05em',
                  'max-width': '10ch',
                },
              ),
            ),
            p(
              [
                Component.text(
                  'Browse the public classes, compare naming patterns, and preview a curated slice of the generated icons without digging through the source files.',
                ),
              ],
              styles: Styles(
                raw: {
                  'margin': '0',
                  'max-width': '62ch',
                  'font-size': '1.05rem',
                  'line-height': '1.7',
                  'color': '#475569',
                },
              ),
            ),
          ],
          styles: Styles(
            raw: {
              'display': 'flex',
              'flex-direction': 'column',
              'gap': '18px',
            },
          ),
        ),
        div(
          [
            _statCard('12', 'Collections'),
            _statCard('40+', 'Sample icons'),
            _statCard('1', 'Import file'),
          ],
          styles: Styles(
            raw: {
              'display': 'grid',
              'grid-template-columns': 'repeat(auto-fit, minmax(180px, 1fr))',
              'gap': '14px',
            },
          ),
        ),
      ],
      styles: Styles(
        raw: {
          'display': 'grid',
          'gap': '18px',
          'padding': '28px',
          'border': '1px solid rgba(15, 23, 42, 0.08)',
          'border-radius': '28px',
          'background': 'linear-gradient(145deg, rgba(255, 255, 255, 0.92), rgba(248, 244, 236, 0.86))',
          'box-shadow': '0 24px 80px rgba(15, 23, 42, 0.08)',
        },
      ),
    );
  }

  Component _namingSection() {
    return section(
      [
        h2(
          [Component.text('Common Naming Shapes')],
          styles: Styles(
            raw: {
              'margin': '0',
              'font-size': '1.6rem',
              'letter-spacing': '-0.03em',
            },
          ),
        ),
        div(
          [
            _patternCard(
              'Simple',
              'icon_<name>',
              'Used by Feather, Lucide, Font Awesome, Spinners, Flags, and many emoji entries.',
            ),
            _patternCard(
              'Variant-first',
              'outline_<name> or filled_<name>',
              'Seen in Material Symbols, Tabler, and the animated icon collection.',
            ),
            _patternCard(
              'Structured',
              'icon_<name>_<size>_<style>',
              'Fluent and Solar keep more of the upstream variant information in the field name.',
            ),
          ],
          styles: Styles(
            raw: {
              'display': 'grid',
              'grid-template-columns': 'repeat(auto-fit, minmax(240px, 1fr))',
              'gap': '14px',
            },
          ),
        ),
      ],
      styles: Styles(
        raw: {
          'display': 'grid',
          'gap': '16px',
        },
      ),
    );
  }

  Component _gallerySection() {
    return div(
      _collections.map(_collectionCard).toList(),
      styles: Styles(
        raw: {
          'display': 'grid',
          'grid-template-columns': 'repeat(auto-fit, minmax(270px, 1fr))',
          'gap': '18px',
        },
      ),
    );
  }

  Component _statCard(String value, String label) {
    return div(
      [
        div(
          [Component.text(value)],
          styles: Styles(
            raw: {
              'font-size': '2.2rem',
              'font-weight': '700',
              'line-height': '1',
              'letter-spacing': '-0.05em',
            },
          ),
        ),
        div(
          [Component.text(label)],
          styles: Styles(
            raw: {
              'font-size': '0.95rem',
              'color': '#475569',
            },
          ),
        ),
      ],
      styles: Styles(
        raw: {
          'padding': '18px',
          'border-radius': '20px',
          'background': 'rgba(255, 255, 255, 0.82)',
          'border': '1px solid rgba(15, 23, 42, 0.08)',
        },
      ),
    );
  }

  Component _patternCard(String title, String pattern, String description) {
    return div(
      [
        div(
          [Component.text(title)],
          styles: Styles(
            raw: {
              'font-size': '0.78rem',
              'font-weight': '700',
              'letter-spacing': '0.08em',
              'text-transform': 'uppercase',
              'color': '#8b5e3c',
            },
          ),
        ),
        div(
          [Component.text(pattern)],
          styles: Styles(
            raw: {
              'font-family': 'ui-monospace, SFMono-Regular, Menlo, monospace',
              'font-size': '0.98rem',
              'padding': '10px 12px',
              'border-radius': '14px',
              'background': '#1f2937',
              'color': '#f8fafc',
              'width': 'fit-content',
            },
          ),
        ),
        p(
          [Component.text(description)],
          styles: Styles(
            raw: {
              'margin': '0',
              'font-size': '0.96rem',
              'line-height': '1.65',
              'color': '#475569',
            },
          ),
        ),
      ],
      styles: Styles(
        raw: {
          'display': 'grid',
          'gap': '12px',
          'padding': '18px',
          'border-radius': '20px',
          'background': 'rgba(255, 255, 255, 0.76)',
          'border': '1px solid rgba(15, 23, 42, 0.08)',
        },
      ),
    );
  }

  Component _collectionCard(_CollectionSection collection) {
    return section(
      [
        div(
          [
            div(
              [Component.text(collection.title)],
              styles: Styles(
                raw: {
                  'font-size': '1.35rem',
                  'font-weight': '700',
                  'letter-spacing': '-0.03em',
                },
              ),
            ),
            div(
              [Component.text(collection.className)],
              styles: Styles(
                raw: {
                  'width': 'fit-content',
                  'padding': '8px 12px',
                  'border-radius': '999px',
                  'background': collection.badgeBackground,
                  'color': collection.badgeColor,
                  'font-family': 'ui-monospace, SFMono-Regular, Menlo, monospace',
                  'font-size': '0.8rem',
                },
              ),
            ),
          ],
          styles: Styles(
            raw: {
              'display': 'flex',
              'flex-direction': 'column',
              'gap': '10px',
            },
          ),
        ),
        p(
          [Component.text(collection.description)],
          styles: Styles(
            raw: {
              'margin': '0',
              'font-size': '0.97rem',
              'line-height': '1.7',
              'color': '#475569',
            },
          ),
        ),
        div(
          [
            div(
              [Component.text('Naming pattern')],
              styles: Styles(
                raw: {
                  'font-size': '0.75rem',
                  'font-weight': '700',
                  'letter-spacing': '0.08em',
                  'text-transform': 'uppercase',
                  'color': '#8b5e3c',
                },
              ),
            ),
            div(
              [Component.text(collection.namingPattern)],
              styles: Styles(
                raw: {
                  'font-family': 'ui-monospace, SFMono-Regular, Menlo, monospace',
                  'font-size': '0.9rem',
                  'color': '#0f172a',
                },
              ),
            ),
          ],
          styles: Styles(
            raw: {
              'display': 'grid',
              'gap': '6px',
              'padding': '14px',
              'border-radius': '16px',
              'background': 'rgba(248, 250, 252, 0.86)',
              'border': '1px solid rgba(148, 163, 184, 0.18)',
            },
          ),
        ),
        div(
          collection.samples.map((sample) => _sampleTile(collection, sample)).toList(),
          styles: Styles(
            raw: {
              'display': 'grid',
              'grid-template-columns': 'repeat(2, minmax(0, 1fr))',
              'gap': '12px',
            },
          ),
        ),
      ],
      styles: Styles(
        raw: {
          'display': 'grid',
          'gap': '16px',
          'padding': '22px',
          'border-radius': '24px',
          'background': collection.cardBackground,
          'border': '1px solid rgba(15, 23, 42, 0.08)',
          'box-shadow': '0 20px 60px rgba(15, 23, 42, 0.05)',
        },
      ),
    );
  }

  Component _sampleTile(_CollectionSection collection, _IconSample sample) {
    return div(
      [
        div(
          [
            SvgIcon(
              sample.icon,
              size: sample.size,
              color: sample.color,
              id: sample.svgId,
              strokeWidth: sample.strokeWidth,
              style: Styles(
                raw: {
                  'display': 'block',
                },
              ),
            ),
          ],
          styles: Styles(
            raw: {
              'display': 'flex',
              'align-items': 'center',
              'justify-content': 'center',
              'min-height': '76px',
              'padding': '10px',
              'border-radius': '18px',
              'background': collection.previewBackground,
            },
          ),
        ),
        div(
          [Component.text(sample.label)],
          styles: Styles(
            raw: {
              'font-family': 'ui-monospace, SFMono-Regular, Menlo, monospace',
              'font-size': '0.78rem',
              'line-height': '1.45',
              'word-break': 'break-word',
              'color': '#334155',
            },
          ),
        ),
      ],
      styles: Styles(
        raw: {
          'display': 'grid',
          'gap': '10px',
        },
      ),
    );
  }
}

class _CollectionSection {
  const _CollectionSection({
    required this.title,
    required this.className,
    required this.description,
    required this.namingPattern,
    required this.cardBackground,
    required this.previewBackground,
    required this.badgeBackground,
    required this.badgeColor,
    required this.samples,
  });

  final String title;
  final String className;
  final String description;
  final String namingPattern;
  final String cardBackground;
  final String previewBackground;
  final String badgeBackground;
  final String badgeColor;
  final List<_IconSample> samples;
}

class _IconSample {
  const _IconSample(
    this.label,
    this.icon, {
    this.size = 30,
    this.color,
    this.svgId,
    this.strokeWidth,
  });

  final String label;
  final IconData icon;
  final double size;
  final Color? color;
  final String? svgId;
  final String? strokeWidth;
}

const List<_CollectionSection> _collections = [
  _CollectionSection(
    title: 'Material Icons',
    className: 'MaterialIcons',
    description: 'Google Material Icons keep the classic five-style set and expose a plain alias for common defaults.',
    namingPattern: 'icon_<style>_<name> and icon_<name>',
    cardBackground: 'linear-gradient(180deg, #ffffff, #eef6ff)',
    previewBackground: 'linear-gradient(180deg, #eff6ff, #dbeafe)',
    badgeBackground: '#dbeafe',
    badgeColor: '#1d4ed8',
    samples: [
      _IconSample('icon_home', MaterialIcons.icon_home, color: Color('#2563eb')),
      _IconSample('icon_outline_search', MaterialIcons.icon_outline_search, color: Color('#334155')),
      _IconSample('icon_round_favorite', MaterialIcons.icon_round_favorite, color: Color('#dc2626')),
      _IconSample('icon_twotone_star', MaterialIcons.icon_twotone_star, color: Color('#d97706')),
    ],
  ),
  _CollectionSection(
    title: 'Material Symbols',
    className: 'MaterialSymbols',
    description:
        'Material Symbols retain multiple stylistic variants and combine prefixes when upstream symbols have stacked styles.',
    namingPattern: 'icon_<name>, outline_<name>, round_<name>, sharp_<name>',
    cardBackground: 'linear-gradient(180deg, #fffdf6, #fff7e8)',
    previewBackground: 'linear-gradient(180deg, #fff7ed, #ffedd5)',
    badgeBackground: '#ffedd5',
    badgeColor: '#c2410c',
    samples: [
      _IconSample('icon_home', MaterialSymbols.icon_home, color: Color('#b45309')),
      _IconSample('outline_home', MaterialSymbols.outline_home, color: Color('#334155')),
      _IconSample('round_download', MaterialSymbols.round_download, color: Color('#059669')),
      _IconSample('sharp_lightbulb', MaterialSymbols.sharp_lightbulb, color: Color('#eab308')),
    ],
  ),
  _CollectionSection(
    title: 'Lucide Icons',
    className: 'LucideIcons',
    description:
        'Lucide keeps a straightforward snake_case field name and works especially well for crisp stroke-first UI icons.',
    namingPattern: 'icon_<name>',
    cardBackground: 'linear-gradient(180deg, #faf5ff, #f5f3ff)',
    previewBackground: 'linear-gradient(180deg, #f3e8ff, #ede9fe)',
    badgeBackground: '#ede9fe',
    badgeColor: '#6d28d9',
    samples: [
      _IconSample('icon_accessibility', LucideIcons.icon_accessibility, color: Color('#6d28d9'), strokeWidth: '1.8'),
      _IconSample('icon_a_arrow_down', LucideIcons.icon_a_arrow_down, color: Color('#1f2937'), strokeWidth: '1.8'),
      _IconSample('icon_a_large_small', LucideIcons.icon_a_large_small, color: Color('#7c3aed'), strokeWidth: '1.8'),
      _IconSample('icon_home', LucideIcons.icon_home, color: Color('#2563eb'), strokeWidth: '1.8'),
    ],
  ),
  _CollectionSection(
    title: 'Feather Icons',
    className: 'FeatherIcons',
    description:
        'Feather follows the same direct naming style as Lucide, making it easy to reach for lightweight line icons.',
    namingPattern: 'icon_<name>',
    cardBackground: 'linear-gradient(180deg, #f0fdf4, #ecfdf5)',
    previewBackground: 'linear-gradient(180deg, #dcfce7, #bbf7d0)',
    badgeBackground: '#dcfce7',
    badgeColor: '#166534',
    samples: [
      _IconSample('icon_activity', FeatherIcons.icon_activity, color: Color('#166534')),
      _IconSample('icon_add_cart', FeatherIcons.icon_add_cart, color: Color('#0f766e')),
      _IconSample('icon_align_center', FeatherIcons.icon_align_center, color: Color('#334155')),
      _IconSample('icon_rocket', FeatherIcons.icon_rocket, color: Color('#2563eb')),
    ],
  ),
  _CollectionSection(
    title: 'Fluent Icons',
    className: 'FluentIcons',
    description:
        'Fluent preserves both size and style in the field name, which makes filled and regular variants easy to compare.',
    namingPattern: 'icon_<name>_<size>_<style>',
    cardBackground: 'linear-gradient(180deg, #f5faff, #eef6ff)',
    previewBackground: 'linear-gradient(180deg, #e0f2fe, #dbeafe)',
    badgeBackground: '#dbeafe',
    badgeColor: '#1d4ed8',
    samples: [
      _IconSample('icon_access_time_20_filled', FluentIcons.icon_access_time_20_filled, color: Color('#1d4ed8')),
      _IconSample('icon_access_time_24_regular', FluentIcons.icon_access_time_24_regular, color: Color('#0f172a')),
      _IconSample('icon_accessibility_24_filled', FluentIcons.icon_accessibility_24_filled, color: Color('#7c3aed')),
      _IconSample('icon_accessibility_24_regular', FluentIcons.icon_accessibility_24_regular, color: Color('#475569')),
    ],
  ),
  _CollectionSection(
    title: 'Tabler Icons',
    className: 'TablerIcons',
    description:
        'This bundle currently showcases Tabler filled variants, giving you strong silhouettes for denser interfaces.',
    namingPattern: 'filled_<name>',
    cardBackground: 'linear-gradient(180deg, #fff7ed, #fffbeb)',
    previewBackground: 'linear-gradient(180deg, #ffedd5, #fde68a)',
    badgeBackground: '#fed7aa',
    badgeColor: '#9a3412',
    samples: [
      _IconSample('filled_accessible', TablerIcons.filled_accessible, color: Color('#9a3412')),
      _IconSample('filled_alarm', TablerIcons.filled_alarm, color: Color('#b45309')),
      _IconSample('filled_alert_triangle', TablerIcons.filled_alert_triangle, color: Color('#dc2626')),
      _IconSample('filled_beer', TablerIcons.filled_beer, color: Color('#92400e')),
    ],
  ),
  _CollectionSection(
    title: 'Solar Icons',
    className: 'SolarIcons',
    description:
        'Solar keeps upstream style labels, so you can clearly distinguish duotone, outline, linear, and broken variants.',
    namingPattern: 'duotone_<name>_bold or icon_<name>_<style>',
    cardBackground: 'linear-gradient(180deg, #fefce8, #fff7ed)',
    previewBackground: 'linear-gradient(180deg, #fef3c7, #fed7aa)',
    badgeBackground: '#fde68a',
    badgeColor: '#92400e',
    samples: [
      _IconSample('duotone_add_circle_bold', SolarIcons.duotone_add_circle_bold, color: Color('#c2410c')),
      _IconSample('icon_add_circle_outline', SolarIcons.icon_add_circle_outline, color: Color('#1f2937')),
      _IconSample('icon_add_circle_linear', SolarIcons.icon_add_circle_linear, color: Color('#0f766e')),
      _IconSample('icon_add_circle_broken', SolarIcons.icon_add_circle_broken, color: Color('#7c3aed')),
    ],
  ),
  _CollectionSection(
    title: 'Font Awesome',
    className: 'FontAwesome',
    description:
        'Font Awesome solid icons map cleanly to snake_case names, which makes migration from web icon names painless.',
    namingPattern: 'icon_<name>',
    cardBackground: 'linear-gradient(180deg, #f8fafc, #f1f5f9)',
    previewBackground: 'linear-gradient(180deg, #e2e8f0, #cbd5e1)',
    badgeBackground: '#e2e8f0',
    badgeColor: '#334155',
    samples: [
      _IconSample('icon_a', FontAwesome.icon_a, color: Color('#0f172a')),
      _IconSample('icon_address_book', FontAwesome.icon_address_book, color: Color('#2563eb')),
      _IconSample('icon_fire', FontAwesome.icon_fire, color: Color('#dc2626')),
      _IconSample('icon_ad', FontAwesome.icon_ad, color: Color('#7c3aed')),
    ],
  ),
  _CollectionSection(
    title: 'Animated Icons',
    className: 'AnimatedIcons',
    description:
        'These SVGs include motion data from the source set, so the gallery doubles as a quick animation sanity check.',
    namingPattern: 'filled_<name> or outline_<name>',
    cardBackground: 'linear-gradient(180deg, #eef2ff, #f5f3ff)',
    previewBackground: 'linear-gradient(180deg, #e0e7ff, #ddd6fe)',
    badgeBackground: '#ddd6fe',
    badgeColor: '#5b21b6',
    samples: [
      _IconSample('filled_beer', AnimatedIcons.filled_beer, color: Color('#7c2d12'), svgId: 'animated-filled-beer'),
      _IconSample(
        'filled_bell_alert',
        AnimatedIcons.filled_bell_alert,
        color: Color('#b91c1c'),
        svgId: 'animated-filled-bell-alert',
      ),
      _IconSample(
        'filled_briefcase',
        AnimatedIcons.filled_briefcase,
        color: Color('#1d4ed8'),
        svgId: 'animated-filled-briefcase',
      ),
      _IconSample(
        'outline_download',
        AnimatedIcons.outline_download,
        color: Color('#334155'),
        svgId: 'animated-outline-download',
      ),
    ],
  ),
  _CollectionSection(
    title: 'Spinners',
    className: 'Spinners',
    description:
        'Spinner fields stick to direct snake_case names, making them ideal for loading states and async placeholders.',
    namingPattern: 'icon_<name>',
    cardBackground: 'linear-gradient(180deg, #f0fdfa, #ecfeff)',
    previewBackground: 'linear-gradient(180deg, #ccfbf1, #a5f3fc)',
    badgeBackground: '#ccfbf1',
    badgeColor: '#0f766e',
    samples: [
      _IconSample('icon_12_dots_scale_rotate', Spinners.icon_12_dots_scale_rotate, color: Color('#0f766e')),
      _IconSample('icon_180_ring', Spinners.icon_180_ring, color: Color('#0f172a')),
      _IconSample('icon_270_ring', Spinners.icon_270_ring, color: Color('#2563eb')),
      _IconSample('icon_180_ring_with_bg', Spinners.icon_180_ring_with_bg, color: Color('#7c3aed')),
    ],
  ),
  _CollectionSection(
    title: 'Flags',
    className: 'Flags',
    description:
        'Flags use ISO-style country code fields, which makes them easy to pair with locale and region selectors.',
    namingPattern: 'icon_<country_code>',
    cardBackground: 'linear-gradient(180deg, #fff1f2, #fff7ed)',
    previewBackground: 'linear-gradient(180deg, #ffe4e6, #ffedd5)',
    badgeBackground: '#ffe4e6',
    badgeColor: '#be123c',
    samples: [
      _IconSample('icon_ng', Flags.icon_ng, size: 34),
      _IconSample('icon_us', Flags.icon_us, size: 34),
      _IconSample('icon_gb', Flags.icon_gb, size: 34),
      _IconSample('icon_ad', Flags.icon_ad, size: 34),
    ],
  ),
  _CollectionSection(
    title: 'Emojis',
    className: 'Emojis',
    description:
        'Emoji names are normalized into readable snake_case, which keeps expressive icons consistent with the rest of the API.',
    namingPattern: 'icon_<emoji_name>',
    cardBackground: 'linear-gradient(180deg, #fff7ed, #fefce8)',
    previewBackground: 'linear-gradient(180deg, #ffedd5, #fde68a)',
    badgeBackground: '#fde68a',
    badgeColor: '#a16207',
    samples: [
      _IconSample('icon_1st_place_medal', Emojis.icon_1st_place_medal, size: 34),
      _IconSample('icon_party_popper', Emojis.icon_party_popper, size: 34),
      _IconSample('icon_rocket', Emojis.icon_rocket, size: 34),
      _IconSample('icon_sparkles', Emojis.icon_sparkles, size: 34),
    ],
  ),
];
