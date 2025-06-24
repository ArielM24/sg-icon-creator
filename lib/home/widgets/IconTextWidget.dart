import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final TextEditingController textControler;
  final ValueNotifier<String> imageTextNotifier;
  const IconTextWidget({super.key, required this.textControler, required this.imageTextNotifier});

  @override
  Widget build(BuildContext context) {
    return TextField(
              controller: textControler,
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
                  "Image Text:",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
  }
}