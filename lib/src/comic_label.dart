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
  /// - fontSize: [double] Text size
  /// - fontFace: [String] Base on Locales. FontFace will come
  /// from the flutter side. It will be base on custom [FontFace].We implemented
  /// table of proper [FontFaces] related to this Widget.
  /// - strokeWidth: [double] Stroke width size
  /// - textColors: [List<Hex|Color>] List of colors
  ///
  /// ## EXAMPLE
  ///
  /// ```dart
  /// const ComicLabel
  ///    text: "Activities",
  ///    fontSize: 40,
  ///    strokeWidth: 7,
  ///    fontFace: integralFontFace,
  ///    textColors: [
  ///       Colors.black,
  ///       Colors.red,
  ///       Colors.white,
  ///    ],
  /// ),
  /// ```
  const ComicLabel({
    Key? key,
    required this.text,
    required this.fontFace,
    required this.fontSize,
    required this.strokeWidth,
    required this.textColors,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final double strokeWidth;
  final String fontFace;
  final List<Color> textColors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _StrokedComicalText(
          text: text,
          hasStroke: true,
          fontFace: fontFace,
          fontSize: fontSize,
          strokeWidth: strokeWidth * 2,
          strokeColor: textColors[0],
          textShadow: [
            Shadow(
              offset: Offset(10.0, strokeWidth),
              blurRadius: 30.0,
              color: Colors.black,
            ),
          ],
        ),
        _StrokedComicalText(
          text: text,
          hasStroke: true,
          fontFace: fontFace,
          fontSize: fontSize,
          strokeWidth: strokeWidth,
          strokeColor: textColors[1],
        ),
        _StrokedComicalText(
          text: text,
          hasStroke: false,
          fontFace: fontFace,
          fontSize: fontSize,
          strokeColor: textColors[2],
        ),
      ],
    );
  }
}

class _StrokedComicalText extends StatelessWidget {
  /// # Stroked Comical Text Widget
  ///
  /// Private widget. All properties is defined in constructor that demonstrate
  /// all type!
  ///
  /// _Note:_ with `hasStroke` property if it was true, the PaintingStyle will
  /// be stroke else will be fill, that demonstrate role of border color and
  /// fille color
  const _StrokedComicalText({
    Key? key,
    required this.text,
    this.hasStroke = false,
    required this.fontFace,
    required this.fontSize,
    this.strokeWidth,
    this.strokeColor,
    this.textShadow,
  }) : super(key: key);

  final String text;
  final bool hasStroke;
  final String fontFace;
  final double fontSize;
  final double? strokeWidth;
  final Color? strokeColor;
  final List<Shadow>? textShadow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFace,
        fontSize: fontSize,
        fontStyle: FontStyle.italic,
        shadows: textShadow ?? [],
        foreground: Paint()
          ..style = hasStroke ? PaintingStyle.stroke : PaintingStyle.fill
          ..strokeWidth = strokeWidth ?? 0
          ..color = strokeColor ?? Colors.transparent,
      ),
    );
  }
}
