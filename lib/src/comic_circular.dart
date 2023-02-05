import 'dart:math' as math;
import 'package:flutter/material.dart';

// Compact stroke width
const double defaultFilledStrokeWidthCompact = 5.0;
const double defaultFilledStrokeNormalWidth = 18.0;
// Default value for `CircularActivity` diagram
const double defaultCircularActivitySize = 200.0;
// Default Space size
const double defaultHeartPtsSpaceSize = 18.0;
const double defaultStepCountSpaceSize = 18.0;
const double defaultStandCountSpaceSize = 16.0;
// strokeWidth: compact ? 20 : 39,
const double defaultHeartPtCompactStrokeW = 20.0;
const double defaultStepCountCompactStrokeW = 10.0;
const double defaultStandCountCompactStrokeW = 30.0;
const double defaultHeartPtStrokeW = 39.0;
const double defaultStepCountStrokeW = 0.0;
const double defaultStandCountStrokeW = 78.0;
const Color defaultBgRing = Color.fromRGBO(0, 128, 0, 0.1);
const Color standBgRing = Color.fromRGBO(0, 0, 255, 0.1);
const Color heartBgRing = Color.fromRGBO(255, 200, 0, 0.2);

/// Colors of `CircularActivity` diagram
// Hear points color
Color heartPtsColor = Colors.orange.shade500;
// Step count
Color stepCountColor = Colors.green.shade500;
// Standup count color
Color standCountColor = Colors.blue.shade800;

/// # Circular Diagram to showing Steps and Heart Pts
///
/// This diagram will use to show user's activity when they start walking or
/// somethings like that and will show count of steps and Heart Pts.
class CircularPainter extends CustomPainter {
  final double progressPercent;
  final double strokeWidth, filledStrokeWidth;
  final Paint bgPaint, strokeBgPaint, strokeFilledPaint;
  final Color widthColor;
  final Color bgRing;

  /// # `CirclePainter` by Painter Class
  ///
  /// ## Stroke Settings
  ///
  /// - strokeWidth: [double] -> Stroke width size of circular diagram
  /// - filledStrokeWidth: [double] -> filled width size of circular diagram
  ///
  /// ## Paint vars
  ///
  /// - bgPaint: [Paint] -> Main Background of diagram
  /// - strokeBgPaint: [Paint] -> Stroke bg color
  /// - strokeFilledPaint: [Paint] -> Main Border of progress
  /// - widthColor: [Color] -> Color of progress
  /// - bgRing: [Color] -> Background color of progress
  CircularPainter({
    required this.progressPercent,
    this.strokeWidth = 10,
    this.filledStrokeWidth = 5.0,
    this.widthColor = Colors.red,
    required this.bgRing,
  })  : bgPaint = Paint()..color = Colors.transparent,
        strokeBgPaint = Paint()..color = Colors.transparent,
        strokeFilledPaint = Paint()
          ..color = widthColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = filledStrokeWidth
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    // Make a circle at the center of canvas
    final Offset center = Offset(size.width / 2, size.height / 2);
    // Radius of the outer circle + padding
    final double radius = size.width / 2;

    // Make rectangle of progress
    Rect rect = Rect.fromCircle(
      center: center,
      // Space of borders from the core
      radius: radius - (strokeWidth / 2),
    );

    // Background of progress paint design
    Paint strokeColorInFull = Paint()
      ..color = bgRing
      ..blendMode = BlendMode.srcATop
      ..style = PaintingStyle.stroke
      ..strokeWidth = filledStrokeWidth
      ..strokeCap = StrokeCap.round;

    // Progressive circle canvas Show the activities progress in this canvas
    canvas.drawArc(
      rect,
      math.pi,
      // Make it from 0 to 360 degree
      (progressPercent / 100) * math.pi * 2,
      false,
      strokeFilledPaint,
    );

    // Full circle canvas Show a full circle behind of the progressive circle
    canvas.drawArc(
      rect,
      math.pi,
      // Make it only 360 degree
      100,
      false,
      strokeColorInFull,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CircularActivity extends StatelessWidget {
  final double size;
  final double standCount;
  final double stepCount;
  final double heartPtsCount;
  final double standIndicator;
  final double stepIndicator;
  final double heartPtsIndicator;
  final bool compact;
  final TextStyle textStyle;

  /// # Usage of `CircularActivity`
  ///
  /// You should set some properties in `CircularActivity`:
  ///
  /// - stepProgress: [required double] -> Value should be pedometer value and
  /// we must save it in a provider that can use in anywhere what developer
  /// want. Inside of the provider we should use save storage functionality, to
  /// save value of the pedometer,
  /// - heartPtsProgress: [required double] -> ?
  /// - stepIndicator: [required double] -> Indicator of stepProgress.  Users
  ///  will set some target value to starting their exercise, for example they
  ///  should set pedometer target value in per day, like 10,000 step per day.
  ///  This is step indicator of the users that will do walking or somethings
  ///  like that. This value is very important to calculate about the percentage
  ///  of step counter `CircularActivity`.  For example this calculation -> I
  ///  had 530 step count today! this value will divide by 10,000 step per day
  ///  that i specify at first in this app.
  /// _Note:_ Target value can change in settings or preferences fo the app.
  ///
  /// - heartPtsIndicator: [required double] -> Indicator of heartPtsProgress
  /// to calculate progress value of the `CircularActivity`.
  ///
  /// _Note:_ Divide of the stepCount on stepIndicator is progress of step
  /// pedometer in diagram.
  ///
  /// _Note:_ Divide of the heartPtsCount on heartPtsIndicator is progress of
  /// heart value in diagram.
  ///
  /// - compact: [bool] -> Use in small space.
  ///
  /// ## EXAMPLE
  ///
  /// ```dart
  ///   const CircularActivity(
  ///        stepCount: 7431,
  ///        heartPtsCount: 5280,
  ///        stepIndicator: 100,
  ///        heartPtsIndicator: 100,
  ///        compact: true,
  ///   )
  /// ```
  ///
  /// Also you can wrap this widget to `Container` or `Stack`, `Row`, `Column`
  /// or `SingleChildScrollView`.
  ///
  /// _Note:_ Maybe i forgot to change direction in `SingleChildScrollView`.
  ///
  /// ```dart
  ///   SingleChildScrollView(scrollDirection: Axis.Horizontal),
  /// ```
  ///
  /// ```dart
  /// Container(
  ///     margin: const EdgeInsets.symmetric(vertical: 20),
  ///     width: 40,
  ///     height: 40,
  ///     child: const CircularActivity(
  ///     stepCount: 7431,
  ///     heartPtsCount: 5280,
  ///     stepIndicator: 100,
  ///     heartPtsIndicator: 100,
  ///     compact: true,
  ///     ),
  ///  ),
  /// ```
  const CircularActivity({
    super.key,
    required this.standCount,
    required this.stepCount,
    required this.heartPtsCount,
    required this.standIndicator,
    required this.stepIndicator,
    required this.heartPtsIndicator,
    this.compact = false,
    this.size = defaultCircularActivitySize,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    // Calculation of the pedometer, heartPts, stand diagram process.
    final double pedometerProgress = stepCount / stepIndicator,
        heartProgress = heartPtsCount / heartPtsIndicator,
        standProgress = standCount / standIndicator;

    return CustomPaint(
      /// HeartPts or Calories count (Orange color)
      painter: CircularPainter(
        progressPercent: standProgress,
        filledStrokeWidth: compact
            ? defaultFilledStrokeWidthCompact
            : defaultFilledStrokeNormalWidth,
        strokeWidth:
            compact ? defaultHeartPtCompactStrokeW : defaultHeartPtStrokeW,
        widthColor: heartPtsColor,
        bgRing: heartBgRing,
      ),

      // Step count (Green color)
      child: CustomPaint(
        painter: CircularPainter(
          progressPercent: pedometerProgress,
          filledStrokeWidth: compact
              ? defaultFilledStrokeWidthCompact
              : defaultFilledStrokeNormalWidth,
          strokeWidth: compact
              ? defaultStepCountCompactStrokeW
              : defaultStepCountStrokeW,
          widthColor: stepCountColor,
          bgRing: defaultBgRing,
        ),

        /// Stand count (Primary color)
        child: CustomPaint(
          painter: CircularPainter(
            progressPercent: heartProgress,
            filledStrokeWidth: compact
                ? defaultFilledStrokeWidthCompact
                : defaultFilledStrokeNormalWidth,
            strokeWidth: compact
                ? defaultStandCountCompactStrokeW
                : defaultStandCountStrokeW,
            widthColor: standCountColor,
            bgRing: standBgRing,
          ),
          size: Size(size, size),
          child: Container(
            padding: EdgeInsets.all(size / 3.8),
            width: size,
            height: size,
            child: compact
                ? const SizedBox(width: 0)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "${stepCount.toInt()}",
                          style: textStyle,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "${heartPtsCount.toInt()}",
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
