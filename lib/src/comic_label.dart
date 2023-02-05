import "package:flutter/material.dart";

/// # Comic Text Made for making DC Comic Text!
///
/// A stateless widget that demonstrate a custom font to Comic style.
///
/// There is some note about color palette in comic design. For more knowledge
/// read DOCs `DESIGN.md`.
///
/// This Widget make Comic text base on your properties!
class ComicLabel extends StatelessWidget {
  /// # Properties
  ///
  /// - text: [String] Main Text
  /// - strokeWidth: [double] Stroke width size
  /// - textColors: [List<Hex|Color>] List of colors
  /// - style: [TextStyle] ThemeText TextStyle class
  ///
  /// ## EXAMPLE
  ///
  /// ```dart
  /// const ComicLabel
  ///    text: "Activities",
  ///    strokeWidth: 7,
  ///    textColors: [
  ///       Colors.black,
  ///       Colors.red,
  ///       Colors.white,
  ///    ],
  /// ),
  /// ```
  const ComicLabel({
    Key? key,
    this.text = "The Comical Label",
    this.strokeWidth = 4,
    required this.textColors,
    required this.style,
  }) : super(key: key);

  final String text;
  final double strokeWidth;
  final List<Color> textColors;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    // Prepare Labels Layers in `Stack`, base on stroke colors list
    final List<Widget> labelLayers = textColors
        .asMap()
        .entries
        .map(
          (color) => StrokedComicalLabel(
            text: text,
            hasStroke: color.key == textColors.length - 1 ? false : true,
            strokeWidth:
                (strokeWidth * ((textColors.length - 1.25) - color.key)),
            strokeColor: color.value,
            textStyle: style,
          ),
        )
        .toList();

    return Stack(
      children: labelLayers,
    );
  }
}

class StrokedComicalLabel extends StatelessWidget {
  /// # Stroked Comical Text Widget
  ///
  /// Private widget. All properties is defined in constructor that demonstrate
  /// all type!
  ///
  /// _Note_: with `hasStroke` property if it was true, the PaintingStyle will
  /// be stroke else will be fill, that demonstrate role of border color and
  /// fill color
  const StrokedComicalLabel({
    Key? key,
    required this.text,
    this.hasStroke = false,
    this.strokeWidth,
    this.strokeColor,
    this.textStyle,
  }) : super(key: key);

  final String text;
  final bool hasStroke;
  final double? strokeWidth;
  final Color? strokeColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    late Paint foregroundPainter = Paint()
      ..style = hasStroke ? PaintingStyle.stroke : PaintingStyle.fill
      ..strokeWidth = strokeWidth ?? 0
      ..color = strokeColor ?? Colors.transparent;

    return Text(
      text,
      style: textStyle?.copyWith(foreground: foregroundPainter),
    );
  }
}
