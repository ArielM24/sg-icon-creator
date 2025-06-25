import 'package:flutter/material.dart';

class ValueSlider extends StatelessWidget {
  final ValueNotifier<double> valueNotifier;
  final ValueNotifier<double>? matchValueNotifier;
  final String label;
  final double min;
  final double max;
  const ValueSlider({super.key, required this.valueNotifier, required this.label, required this.min, required this.max, this.matchValueNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22.0),
              child: Text(
                "$label: $value",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Slider(
              activeColor: Colors.deepPurpleAccent,
              min: min,
              max: max,
              value: value,
              onChanged: (v) {
                valueNotifier.value = v.truncateToDouble();
                if(matchValueNotifier == null){
                  return;
                }
                if(v > matchValueNotifier!.value){
                  matchValueNotifier!.value = v;
                }
              },
            ),
          ],
        );
      }
    );
  }
}