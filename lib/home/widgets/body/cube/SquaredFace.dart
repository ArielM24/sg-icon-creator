import 'package:flutter/material.dart';

class SquaredFace extends StatelessWidget {
  final ValueNotifier<String> textNotifier;
  final ValueNotifier<double> fontSizeNotifier;
  final ValueNotifier<double> sizeNotifier;
  final Color backgroundColor;
  const SquaredFace({
    super.key,
    required this.textNotifier,
    required this.backgroundColor,
    required this.sizeNotifier,
    required this.fontSizeNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: sizeNotifier,
      builder: (context, size, child) {
        return Container(
          color: backgroundColor,
          height: size,
          width: size,
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: fontSizeNotifier,
              builder: (context, fontSize, child) {
                return ValueListenableBuilder(
                  valueListenable: textNotifier,
                  builder: (context, text, child) {
                    return Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Glitch",
                        fontSize: fontSize,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
