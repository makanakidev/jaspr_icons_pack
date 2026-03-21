import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_svg/icons.dart';

import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(
    Document(
      title: 'example',
      body: div([
        const SvgIcon(color: Colors.red, MaterialIcons.icon_round_handshake),
        br(),
        const SvgIcon(FluentIcons.icon_handshake_16_filled),
        br(),
        const SvgIcon(MaterialSymbols.icon_10k, size: 45, color: Colors.blue),
        br(),
        const SvgIcon(SolarIcons.duotone_4k_bold, size: 45),
        br(),
        const SvgIcon(
          color: Colors.red,
          strokeWidth: '1',
          TablerIcons.icon_heart_handshake,
        ),
      ]),
    ),
  );
}
