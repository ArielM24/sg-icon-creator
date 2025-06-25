import 'package:flutter/material.dart';

class SetValuesButton extends StatelessWidget {
  final ValueNotifier<double> sizeNotifier;
  final ValueNotifier<double> xNotifier;
  final ValueNotifier<double> yNotifier;
  final ValueNotifier<double> cubeSizeNotifier;
  final ValueNotifier<double> xTranslationNotifier;
  final ValueNotifier<double> yTranslationNotifier;
  final String text;
  const SetValuesButton({
    super.key,
    required this.sizeNotifier,
    required this.xNotifier,
    required this.yNotifier,
    required this.cubeSizeNotifier,
    required this.xTranslationNotifier,
    required this.yTranslationNotifier,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
