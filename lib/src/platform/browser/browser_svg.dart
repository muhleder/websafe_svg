import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:websafe_svg/src/platform/browser/browser_svg_loader.dart';

class BrowserSvg extends StatefulWidget {
  BrowserSvg({
    @required this.alignment,
    this.color,
    @required this.excludeFromSemantics,
    @required this.fit,
    @required this.height,
    Key key,
    @required this.loader,
    @required this.placeholderBuilder,
    @required this.semanticsLabel,
    @required this.width,
  })  : assert(loader != null),
        super(key: key);

  final Alignment alignment;
  final Color color;
  final bool excludeFromSemantics;
  final BoxFit fit;
  final double height;
  final BrowserSvgLoader loader;
  final WidgetBuilder placeholderBuilder;
  final String semanticsLabel;
  final double width;

  @override
  _BrowserSvgState createState() => _BrowserSvgState();
}

class _BrowserSvgState extends State<BrowserSvg> {
  static final Logger _logger = Logger('_BrowserSvgState');

  int _loadIndex = 0;
  String _image;
  BrowserSvgLoader _loader;

  @override
  void initState() {
    super.initState();

    _loader = widget.loader;
    _loadImage();
  }

  @override
  void didUpdateWidget(BrowserSvg oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.loader != oldWidget?.loader) {
      _loader = widget.loader;
      _loadImage();
    }
  }

  Future<void> _loadImage() async {
    if (mounted == true) {
      setState(() {});
    }
    _loadIndex++;
    var idx = _loadIndex;

    try {
      var image = await _loader.load();

      if (idx == _loadIndex) {
        var b64 = base64.encode(utf8.encode(image));
        image = 'data:image/svg+xml;base64,$b64';

        _image = image;

        if (mounted == true) {
          setState(() {});
        }
      }
    } catch (e, stack) {
      _logger.info('Error loading SVG', e, stack);
    }
  }

  Widget _buildPlaceholder(BuildContext context) =>
      widget.placeholderBuilder == null
          ? SizedBox()
          : Builder(builder: widget.placeholderBuilder);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 100),
      child: _image == null
          ? _buildPlaceholder(context)
          : Container(
              height: widget.height,
              width: widget.width,
              alignment: Alignment.center,
              child: Image.network(
                _image,
                color: widget.color,
                height: widget.height,
                fit: BoxFit.fill,
                width: widget.width,
              ),
            ),
    );
  }
}
