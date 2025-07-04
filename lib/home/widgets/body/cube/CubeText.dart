import 'dart:math';

import 'package:SGIconCreator/home/widgets/body/cube/SquaredFace.dart';
import 'package:flutter/material.dart';

class CubeText extends StatelessWidget {
  final ValueNotifier<String> topTextNotifier;
  final ValueNotifier<String> leftTextNotifier;
  final ValueNotifier<String> rightTextNotifier;
  final ValueNotifier<double> topFontSizeNotifier;
  final ValueNotifier<double> leftFontSizeNotifier;
  final ValueNotifier<double> rightFontSizeNotifier;
  final ValueNotifier<double> sizeNotifier;
  final ValueNotifier<double> xNotifier;
  final ValueNotifier<double> yNotifier;
  final ValueNotifier<double> cubeSizeNotifier;
  final ValueNotifier<double> xTranslationNotifier;
  final ValueNotifier<double> yTranslationNotifier;

  const CubeText({
    super.key,
    required this.topTextNotifier,
    required this.leftTextNotifier,
    required this.rightTextNotifier,
    required this.topFontSizeNotifier,
    required this.sizeNotifier,
    required this.xNotifier,
    required this.yNotifier,
    required this.cubeSizeNotifier,
    required this.xTranslationNotifier,
    required this.yTranslationNotifier,
    required this.leftFontSizeNotifier,
    required this.rightFontSizeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cubeSizeNotifier,
      builder: (context, cubeSize, child) {
        return ValueListenableBuilder(
          valueListenable: yTranslationNotifier,
          builder: (context, yTranslation, child) {
            return ValueListenableBuilder(
              valueListenable: xTranslationNotifier,
              builder: (context, xTranslation, child) {
                return ValueListenableBuilder(
                  valueListenable: xNotifier,
                  builder: (context, x, child) {
                    return ValueListenableBuilder(
                      valueListenable: yNotifier,
                      builder: (context, y, child) {
                        return ValueListenableBuilder(
                          valueListenable: sizeNotifier,
                          builder: (context, size, child) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    const Color.fromARGB(255, 68, 154, 234),
                                    const Color.fromARGB(255, 94, 43, 235),
                                    const Color.fromARGB(255, 31, 1, 90)
                                  ],
                                ),
                              ),
                              width: size,
                              height: size,
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..rotateX(x * pi / 180)
                                  ..rotateY(-y * pi / 180),
                                alignment: Alignment.center,
                                child: Stack(
                                  children: [
                                    Transform(
                                      transform: Matrix4.identity()
                                        ..translate(
                                          xTranslation,
                                          yTranslation,
                                          0,
                                        )
                                        ..translate(cubeSize * 0),
                                      child: SquaredFace(
                                        textNotifier: rightTextNotifier,
                                        colors: [
                                    Colors.purpleAccent,
                                    const Color.fromARGB(255, 42, 20, 102),
                                    const Color.fromARGB(255, 120, 28, 189)
                                  ],
                                        sizeNotifier: cubeSizeNotifier,
                                        fontSizeNotifier: rightFontSizeNotifier,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.identity()
                                        ..translate(
                                          xTranslation,
                                          yTranslation,
                                          0,
                                        )
                                        ..rotateY(-pi / 2 + pi)
                                        ..translate(-cubeSize, 0.0, 0.0),
                                      child: SquaredFace(
                                        textNotifier: leftTextNotifier,
                                        colors: [
                                    const Color.fromARGB(255, 200, 42, 228),
                                    const Color.fromARGB(255, 49, 27, 109),
                                    const Color.fromARGB(255, 148, 54, 219)
                                  ],
                                        sizeNotifier: cubeSizeNotifier,
                                        fontSizeNotifier: leftFontSizeNotifier,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.identity()
                                        ..translate(
                                          xTranslation,
                                          yTranslation,
                                          0,
                                        )
                                        ..rotateX(pi / 2 + pi)
                                        ..translate(0.0, -cubeSize, 0.0),
                                      child: SquaredFace(
                                        textNotifier: topTextNotifier,
                                        colors: [
                                    Colors.purpleAccent,
                                    Colors.deepPurpleAccent,
                                    const Color.fromARGB(255, 107, 18, 118)
                                  ],
                                        sizeNotifier: cubeSizeNotifier,
                                        fontSizeNotifier: topFontSizeNotifier,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
