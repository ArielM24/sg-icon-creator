import 'package:flutter/material.dart';

class IconImageSizeSlider extends StatelessWidget {
  final ValueNotifier<int> imageSizeNotifier;
  const IconImageSizeSlider({super.key, required this.imageSizeNotifier});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: ValueListenableBuilder(
            valueListenable: imageSizeNotifier,
            builder: (context, size, child) {
              return Text(
                "Image size: $size",
                style: TextStyle(color: Colors.white),
              );
            },
          ),
        ),
        ValueListenableBuilder(
          valueListenable: imageSizeNotifier,
          builder: (context, value, child) {
            return Slider(
              activeColor: Colors.deepPurpleAccent,
              min: 1,
              max: 512,
              value: value * 1.0,
              onChanged: (v) {
                imageSizeNotifier.value = v.toInt();
              },
            );
          }
        ),
      ],
    );
  }
}
