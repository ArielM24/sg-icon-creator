import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IconSaveButton extends StatelessWidget {
  final TextEditingController textControler;
  final GlobalKey imageWidgetKey;
  const IconSaveButton({super.key, required this.textControler, required this.imageWidgetKey});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () async => await _saveImage(context),
        tooltip: 'Save Iamge',
        child: const Icon(Icons.save, color: Colors.white),
      );
  }

  _saveImage(BuildContext context) async{
try {
      RenderRepaintBoundary boundary =
          imageWidgetKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      String name = textControler.text.trim();
      if (name.isEmpty) {
        name = 'IMG-${DateTime.now().millisecondsSinceEpoch}';
      }
      Directory output = Directory("output");
      if(!output.existsSync()){
        output.createSync();
      }
      final file = File("output/$name.png");
      await file.writeAsBytes(pngBytes);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image $name saved successfully in ${output.absolute}')),
        );
      }
    } catch (ex) {
      debugPrint("$ex");
    }
  }
}