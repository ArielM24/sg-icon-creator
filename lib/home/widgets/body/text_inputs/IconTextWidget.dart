import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final ValueNotifier<String> imageTextNotifier;
  final String label;
  const IconTextWidget({super.key, required this.imageTextNotifier, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
              onChanged: (v) => imageTextNotifier.value = v,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.text_fields,
                  color: Colors.deepPurpleAccent,
                ),
                fillColor: Colors.white,
                border: UnderlineInputBorder(),
                label: Text(
                  label,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
  }
}