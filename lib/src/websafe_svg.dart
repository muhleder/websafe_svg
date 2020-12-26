import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'platform/io_svg.dart' as io_svg;

// ignore: uri_does_not_exist
import 'platform/stub_svg.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'platform/io_svg.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'platform/browser_svg.dart' as universal_svg;

const bool _useSkia =
bool.fromEnvironment('FLUTTER_WEB_USE_SKIA', defaultValue: false);

class WebsafeSvg {
  static Widget asset(
    String asset, {
    alignment = Alignment.center,
    Color color,
    BoxFit fit = BoxFit.contain,
    double height,
    String package,
    WidgetBuilder placeholderBuilder,
    String semanticsLabel,
    double width,
  }) =>
      _useSkia ?
      io_svg.svgFromAsset(
        asset,
        alignment: alignment,
        color: color,
        fit: fit,
        height: height,
        package: package,
        placeholderBuilder: placeholderBuilder,
        semanticsLabel: semanticsLabel,
        width: width,
      ) :
      universal_svg.svgFromAsset(
        asset,
        alignment: alignment,
        color: color,
        fit: fit,
        height: height,
        package: package,
        placeholderBuilder: placeholderBuilder,
        semanticsLabel: semanticsLabel,
        width: width,
      );

  static Widget memory(
    Uint8List bytes, {
    alignment = Alignment.center,
    Color color,
    BoxFit fit = BoxFit.contain,
    double height,
    WidgetBuilder placeholderBuilder,
    String semanticsLabel,
    double width,
  }) =>
      _useSkia ?
      io_svg.svgFromMemory(
        bytes,
        alignment: alignment,
        color: color,
        fit: fit,
        height: height,
        placeholderBuilder: placeholderBuilder,
        semanticsLabel: semanticsLabel,
        width: width,
      ) :
      universal_svg.svgFromMemory(
        bytes,
        alignment: alignment,
        color: color,
        fit: fit,
        height: height,
        placeholderBuilder: placeholderBuilder,
        semanticsLabel: semanticsLabel,
        width: width,
      );

  static Widget network(
    String url, {
    alignment = Alignment.center,
    Color color,
    BoxFit fit = BoxFit.contain,
    Map<String, String> headers,
    double height,
    WidgetBuilder placeholderBuilder,
    String semanticsLabel,
    double width,
  }) =>
      _useSkia ?
      io_svg.svgFromNetwork(
        url,
        alignment: alignment,
        color: color,
        fit: fit,
        headers: headers,
        height: height,
        placeholderBuilder: placeholderBuilder,
        semanticsLabel: semanticsLabel,
        width: width,
      ) :
      universal_svg.svgFromNetwork(
        url,
        alignment: alignment,
        color: color,
        fit: fit,
        headers: headers,
        height: height,
        placeholderBuilder: placeholderBuilder,
        semanticsLabel: semanticsLabel,
        width: width,
      );

  static Widget string(
    String bytes, {
    alignment = Alignment.center,
    Color color,
    BoxFit fit = BoxFit.contain,
    double height,
    WidgetBuilder placeholderBuilder,
    String semanticsLabel,
    double width,
  }) =>
      _useSkia ?
      io_svg.svgFromString(
        bytes,
        alignment: alignment,
        color: color,
        fit: fit,
        height: height,
        placeholderBuilder: placeholderBuilder,
        semanticsLabel: semanticsLabel,
        width: width,
      ) :
      universal_svg.svgFromString(
        bytes,
        alignment: alignment,
        color: color,
        fit: fit,
        height: height,
        placeholderBuilder: placeholderBuilder,
        semanticsLabel: semanticsLabel,
        width: width,
      );
}
