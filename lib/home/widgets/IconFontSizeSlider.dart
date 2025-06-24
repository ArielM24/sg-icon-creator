import 'package:flutter/material.dart';

class IconFontSizeSlider extends StatelessWidget {
  final ValueNotifier<int> fontSizeNotifier;
  const IconFontSizeSlider({super.key, required this.fontSizeNotifier});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: ValueListenableBuilder(
            valueListenable: fontSizeNotifier,
            builder: (context, font, child) {
              return Text(
                "Font size: $font",
                style: TextStyle(color: Colors.white),
              );
            }
          ),
        ),
        Slider(
          activeColor: Colors.deepPurpleAccent,
          min: 1,
          max: 100,
          value: fontSizeNotifier.value * 1.0,
          onChanged: (v) {
            fontSizeNotifier.value = v.toInt();
          },
        ),
      ],
    );
  }
}
