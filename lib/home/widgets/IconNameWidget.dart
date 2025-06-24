import 'package:flutter/material.dart';

class IconNameWidget extends StatelessWidget {
  final TextEditingController nameControler;
  const IconNameWidget({super.key, required this.nameControler});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameControler,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.file_copy, color: Colors.deepPurpleAccent),
        fillColor: Colors.white,
        border: UnderlineInputBorder(),
        label: Text("Name:", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
