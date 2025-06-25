import 'dart:math';

import 'package:SGIconCreator/home/widgets/body/cube/CubeText.dart';
import 'package:flutter/material.dart';

class IconImageWidget extends StatelessWidget {
  final ValueNotifier<String> topTextNotifier;
  final ValueNotifier<String> leftTextNotifier;
  final ValueNotifier<String> rightTextNotifier;
  final ValueNotifier<double> topFontSizeNotifier;
  final ValueNotifier<double> leftFontSizeNotifier;
  final ValueNotifier<double> rightFontSizeNotifier;
  final ValueNotifier<double> imageSizeNotifier;
  final ValueNotifier<double> xNotifier;
  final ValueNotifier<double> yNotifier;
  final ValueNotifier<double> cubeSizeNotifier;
  final ValueNotifier<double> xTranslationNotifier;
  final ValueNotifier<double> yTranslationNotifier;
  final GlobalKey imageWidgetKey;
  const IconImageWidget({
    super.key,
    required this.topFontSizeNotifier,
    required this.imageSizeNotifier,
    required this.topTextNotifier,
    required this.imageWidgetKey,
    required this.xNotifier,
    required this.yNotifier,
    required this.cubeSizeNotifier,
    required this.xTranslationNotifier,
    required this.yTranslationNotifier,
    required this.leftTextNotifier,
    required this.rightTextNotifier,
    required this.leftFontSizeNotifier,
    required this.rightFontSizeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RepaintBoundary(
        key: imageWidgetKey,
        child: CubeText(
          topTextNotifier: topTextNotifier,
          leftTextNotifier: leftTextNotifier,
          rightTextNotifier: rightTextNotifier,
          topFontSizeNotifier: topFontSizeNotifier,
          sizeNotifier: imageSizeNotifier,
          xNotifier: xNotifier,
          yNotifier: yNotifier,
          cubeSizeNotifier: cubeSizeNotifier,
          xTranslationNotifier: xTranslationNotifier,
          yTranslationNotifier: yTranslationNotifier,
          leftFontSizeNotifier: leftFontSizeNotifier,
          rightFontSizeNotifier: rightFontSizeNotifier,
        ),
      ),
    );
  }
}
