import 'package:flutter/material.dart';

class IconImageWidget extends StatelessWidget {
  final TextEditingController textControler;
  final ValueNotifier<String> imageTextNotifier;
  final ValueNotifier<int> fontSizeNotifier;
  final ValueNotifier<int> imageSizeNotifier;
  final GlobalKey imageWidgetKey;
  const IconImageWidget({
    super.key,
    required this.fontSizeNotifier,
    required this.imageSizeNotifier,
    required this.imageTextNotifier,
    required this.textControler,
    required this.imageWidgetKey,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RepaintBoundary(
        key: imageWidgetKey,
        child: ValueListenableBuilder(
          valueListenable: imageSizeNotifier,
          builder: (context, value, child) {
            return Container(
              color: Colors.deepPurpleAccent,
                                  height: value.toDouble(),
                                  width: value.toDouble(),
                                  child: Center(
                                    child: ValueListenableBuilder(
                                      valueListenable: fontSizeNotifier,
                                      builder: (context, font, child) {
                                        return ValueListenableBuilder(
                                          valueListenable: imageTextNotifier,
                                          builder: (context, text, child) {
                                            return Text(
                                                  text,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Glitch",
                                                    fontSize: font.toDouble(),
                                                  ),
                                                );
                                          }
                                        );
                                      }
                                    ),
                                  ),
            );
          }
        ),
      ),
    );
  }
}
