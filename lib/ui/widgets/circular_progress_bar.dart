import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/styles/app_colors.dart';

/// Double pi.
const double _doublePi = 2 * pi;

/// Coefficient to convert degrees to radians.
const double _piDiv180 = pi / 180;

/// Convert degrees to radians
///
/// Accept [degree] and returns radians
double _degToRad(double degree) {
  return degree * _piDiv180;
}

/// The callback type to get a new text value centered in the progress bar.
typedef OnGetCenterText = Widget Function(double);

/// Simple circular progress bar.
///
/// The values are updated with ValueNotifier, which helps to avoid unnecessary
/// redrawing of the widget. Animation transition to a new value already built
/// into the widget. Progress bar can be either with or without a gradient.
class SimpleCircularProgressBar extends StatefulWidget {
  /// Create simple circular progress bar.
  ///
  /// Main params. Create simple circular progress bar with size equal to [size]
  /// ([size] = height = width). You can set the thickness of the progress line
  /// with [progressStrokeWidth] and the thickness of the background circle line
  /// with [backStrokeWidth]. If you don't want a background circle specify
  /// [backStrokeWidth] = 0. You can also set the starting angle [startAngle].
  /// Progress bar have a value from 0 to [maxValue].
  ///
  ///
  /// Color params. Progress bar can be either with or without a gradient. For a
  /// gradient, specify more than one color in the [progressColors] field and if
  /// a gradient is not needed specify only one color.You can also set the color
  /// of the circle on the background with [backColor]. The background circle
  /// does not support a gradient. About [fullProgressColor] read below.
  ///
  /// Animation param. You can adjust the speed of the animation with the
  /// [animationDuration] second. The higher the value, the slower the
  /// animation. If you do not need animation, specify zero [animationDuration].
  ///
  /// Value param. Set your ValueNotifier with the [valueNotifier] parameter.
  /// The values are updated with ValueNotifier which helps to avoid unnecessary
  /// redrawing of the widget and also allows you to put animation inside the
  /// widget.
  ///
  /// Full progress type. If [mergeMode] is true then at 100% the progress of
  /// the bar will be in the form of a closed ring and the color will be changed
  /// to [fullProgressColor]. If no [fullProgressColor] is specified, the last
  /// color from [progressColors] is taken.
  ///
  /// Center text. If you want the text with its value to be displayed in the
  /// center of the progress bar, define the [onGetText] method. In this method
  /// you should return the Text widget for the current progress bar value.
  const SimpleCircularProgressBar({
    super.key,
    this.size = 100,
    this.maxValue = 100,
    this.startAngle = 0,
    this.progressStrokeWidth = 15,
    this.backStrokeWidth = 15,
    this.progressColors = const [Colors.blueAccent, Colors.greenAccent],
    this.fullProgressColor,
    this.backColor = AppColors.progressBackground,
    this.animationDuration = 6,
    this.mergeMode = false,
    this.onGetText,
    required this.value,
  });

  /// Widget size. Equals the height and width of the widget.
  final double size;

  /// The maximum value of the progress bar.
  final int maxValue;
  final int value;

  /// Start angle. In this position there will be a zero value.
  final double startAngle;

  /// Progress line thickness.
  final double progressStrokeWidth;

  /// Background circle line thickness.
  final double backStrokeWidth;

  /// The list of colors of the main line (one and more).
  final List<Color> progressColors;

  /// The color of the circle at 100% value.
  /// It only works when [mergeMode] equal to true.
  final Color? fullProgressColor;

  /// The color of the background circle.
  final Color backColor;

  /// Animation speed.
  final int animationDuration;

  /// When this mode is enabled the progress bar with a 100% value forms a full
  /// circle.
  final bool mergeMode;

  /// Callback to generate a new Text widget located in the center of the
  /// progress bar. The callback input is the current value of the bar progress.
  final OnGetCenterText? onGetText;

  @override
  SimpleCircularProgressBarState createState() =>
      SimpleCircularProgressBarState();
}

class SimpleCircularProgressBarState extends State<SimpleCircularProgressBar>
    with SingleTickerProviderStateMixin {
  final double minSweepAngle = 0.015;

  late double circleLength;
  late double widgetSize;

  late double startAngle;
  late double correctAngle;
  late SweepGradient sweepGradient;

  late AnimationController animationController;

  late Color fullProgressColor;

  @override
  void initState() {
    final animationDuration =
        (widget.animationDuration < 0) ? 0 : widget.animationDuration;

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: animationDuration),
      value: 0.0,
      upperBound: widget.maxValue.toDouble(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widgetSize = (widget.size <= 0) ? 100.0 : widget.size;

    // Calculate the real starting angle and correction angle.
    // Correction angle - the angle to which the main line should be
    // shifted in order for the SweepGradient to be displayed correctly.
    circleLength = pi * widgetSize;
    final k = _doublePi / circleLength;

    correctAngle = widget.progressStrokeWidth * k;
    startAngle = correctAngle / 2;

    // Adjusting the colors.
    final List<Color> progressColors = [];
    if (widget.progressColors.isEmpty) {
      progressColors.add(Colors.blueAccent);
      progressColors.add(Colors.greenAccent);
    } else if (widget.progressColors.length == 1) {
      progressColors.add(widget.progressColors[0]);
      progressColors.add(widget.progressColors[0]);
    } else {
      progressColors.addAll(widget.progressColors);
    }

    sweepGradient = SweepGradient(
      tileMode: TileMode.decal,
      colors: progressColors,
    );

    fullProgressColor = (widget.fullProgressColor == null)
        ? progressColors.last
        : widget.fullProgressColor!;

    double value = widget.value.toDouble();

    if (value > widget.maxValue) {
      value = widget.maxValue.toDouble();
    } else if (value < 0) {
      value = 0;
    }

    // Read [MAIN LOGIC]
    if (value < animationController.value) {
      animationController.forward();
    } else {
      animationController.animateTo(value);
    }

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, snapshot) {
        // [MAIN LOGIC]
        //
        // If [value] >= [animation.value]:
        // Moving from the current value to the new value.
        //
        // If [value] <  [animation.value]:
        // Move to the end of the circle and from there to a new value.
        //
        // [MAIN LOGIC]

        if ((value != animationController.upperBound) &&
            (animationController.value >= animationController.upperBound)) {
          animationController.reset();
          animationController.animateTo(value);
        }

        double sweepAngle;

        // Reduce the value to a range of 0.0 to 1.0.
        final reducedValue = animationController.value / widget.maxValue;

        if (animationController.value == 0) {
          sweepAngle = 0;
        } else {
          sweepAngle = (_doublePi * reducedValue) - correctAngle;

          if (sweepAngle <= 0) {
            sweepAngle = minSweepAngle;
          }
        }

        final currentLength = reducedValue * circleLength;

        // If mergeMode is on and the current value is equal to the maximum
        // value, we should draw a full circle with the specified color.
        final isFullProgress = widget.mergeMode &
            (animationController.value == animationController.upperBound);

        // Create center text widget.
        // If no callback is defined, create an empty widget.
        Widget centerTextWidget;
        if (widget.onGetText != null) {
          centerTextWidget = widget.onGetText!(animationController.value);
        } else {
          centerTextWidget = const SizedBox.shrink();
        }

        // Repaint progress bar.
        return Stack(
          alignment: Alignment.center,
          children: [
            centerTextWidget,
            Transform.rotate(
              angle: _degToRad(widget.startAngle - 90),
              child: CustomPaint(
                size: Size(widgetSize, widgetSize),
                painter: _SimpleCircularProgressBarPainter(
                  progressStrokeWidth: widget.progressStrokeWidth,
                  backStrokeWidth: widget.backStrokeWidth,
                  startAngle: startAngle,
                  sweepAngle: sweepAngle,
                  currentLength: currentLength,
                  frontGradient: sweepGradient,
                  backColor: widget.backColor,
                  fullProgressColor: fullProgressColor,
                  isFullProgress: isFullProgress,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

/// Painter to draw the progress bar.
class _SimpleCircularProgressBarPainter extends CustomPainter {
  _SimpleCircularProgressBarPainter({
    required this.progressStrokeWidth,
    required this.backStrokeWidth,
    required this.startAngle,
    required this.sweepAngle,
    required this.currentLength,
    required this.frontGradient,
    required this.backColor,
    required this.fullProgressColor,
    required this.isFullProgress,
  });

  final double progressStrokeWidth;
  final double backStrokeWidth;
  final double startAngle;
  final double sweepAngle;
  final double currentLength;
  final SweepGradient frontGradient;
  final Color backColor;
  final Color fullProgressColor;
  final bool isFullProgress;

  /// Draw background circle for progress bar
  void _drawBack(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = backStrokeWidth;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
  }

  /// Draw the initial part of the arc (~ 0% - 1%).
  /// (The part that is less than the [progressStrokeWidth])
  void _drawLessArcPart(Canvas canvas, Size size) {
    // [MAIN LOGIC]
    //
    // Copies 'phases of the Moon' while drawing (Last Quarter -> Full Moon).
    // Draw two arcs. One static and one moving, and combine them using XOR.
    //
    // [MAIN LOGIC]

    double angle = 0;
    double height = 0;

    if (currentLength < progressStrokeWidth / 2) {
      angle = 180;
      height = progressStrokeWidth - currentLength * 2;
    } else if (currentLength < progressStrokeWidth) {
      angle = 0;
      height = currentLength * 2 - progressStrokeWidth;
    } else {
      return;
    }

    final Paint pathPaint = Paint()
      ..shader = frontGradient.createShader(Offset.zero & size)
      ..style = PaintingStyle.fill;

    final Offset circleOffset = Offset(
      (size.width / 2) * cos(startAngle) + size.center(Offset.zero).dx,
      (size.width / 2) * sin(startAngle) + size.center(Offset.zero).dy,
    );

    canvas.drawPath(
      Path.combine(
        PathOperation.xor,
        Path()
          ..addArc(
            Rect.fromLTWH(
              circleOffset.dx - progressStrokeWidth / 2,
              circleOffset.dy - progressStrokeWidth / 2,
              progressStrokeWidth,
              progressStrokeWidth,
            ),
            _degToRad(180),
            _degToRad(180),
          ),
        Path()
          ..addArc(
            Rect.fromCenter(
              center: circleOffset,
              width: progressStrokeWidth,
              height: height,
            ),
            _degToRad(angle),
            _degToRad(180),
          ),
      ),
      pathPaint,
    );
  }

  /// Draw main arc (~ 1% - 100%).
  void _drawArcPart(Canvas canvas, Size size) {
    final Rect arcRect = Offset.zero & size;

    final Paint arcPaint = Paint()
      ..shader = frontGradient.createShader(arcRect)
      ..strokeWidth = progressStrokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(arcRect, startAngle, sweepAngle, false, arcPaint);
  }

  void _drawFullProgress(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = fullProgressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressStrokeWidth;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (isFullProgress && (progressStrokeWidth > 0)) {
      _drawFullProgress(canvas, size);
      return;
    }

    if (backStrokeWidth > 0) {
      _drawBack(canvas, size);
    }

    if (progressStrokeWidth <= 0) {
      return;
    } else if (progressStrokeWidth >= currentLength) {
      _drawLessArcPart(canvas, size);
    } else {
      _drawArcPart(canvas, size);
    }
  }

  @override
  bool shouldRepaint(_SimpleCircularProgressBarPainter oldDelegate) {
    return oldDelegate.currentLength != currentLength;
  }
}
