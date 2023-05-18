/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Icon_clock.png
  AssetGenImage get iconClock =>
      const AssetGenImage('assets/icons/Icon_clock.png');

  /// File path: assets/icons/icon_calories.png
  AssetGenImage get iconCalories =>
      const AssetGenImage('assets/icons/icon_calories.png');

  /// File path: assets/icons/icon_distance.png
  AssetGenImage get iconDistance =>
      const AssetGenImage('assets/icons/icon_distance.png');

  /// File path: assets/icons/icon_goal.png
  AssetGenImage get iconGoal =>
      const AssetGenImage('assets/icons/icon_goal.png');

  /// File path: assets/icons/icon_health_details.png
  AssetGenImage get iconHealthDetails =>
      const AssetGenImage('assets/icons/icon_health_details.png');

  /// File path: assets/icons/icon_height.png
  AssetGenImage get iconHeight =>
      const AssetGenImage('assets/icons/icon_height.png');

  /// File path: assets/icons/icon_measurement_system.png
  AssetGenImage get iconMeasurementSystem =>
      const AssetGenImage('assets/icons/icon_measurement_system.png');

  /// File path: assets/icons/icon_steps.png
  AssetGenImage get iconSteps =>
      const AssetGenImage('assets/icons/icon_steps.png');

  /// File path: assets/icons/icon_weight.png
  AssetGenImage get iconWeight =>
      const AssetGenImage('assets/icons/icon_weight.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        iconClock,
        iconCalories,
        iconDistance,
        iconGoal,
        iconHealthDetails,
        iconHeight,
        iconMeasurementSystem,
        iconSteps,
        iconWeight
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
