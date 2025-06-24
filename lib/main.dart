import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Saver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      home: const MyHomePage(title: 'Image Saver'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController strControler = TextEditingController();
  final ValueNotifier<String> _imgText = ValueNotifier<String>("SG MOD");
  final ValueNotifier<int> _fontSize = ValueNotifier<int>(16);
  final ValueNotifier<int> _imgSize = ValueNotifier<int>(128);
  final GlobalKey _widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,

        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            TextField(
              controller: nameControler,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.file_copy,
                  color: Colors.deepPurpleAccent,
                ),
                fillColor: Colors.white,
                border: UnderlineInputBorder(),
                label: Text("Name:", style: TextStyle(color: Colors.white)),
              ),
            ),
            TextField(
              controller: strControler,
              onChanged: (v) => _imgText.value = v,
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
            ),
            ValueListenableBuilder(
              valueListenable: _fontSize,
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Text(
                        "Font size: ${_fontSize.value}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Slider(
                      activeColor: Colors.deepPurpleAccent,
                      min: 1,
                      max: 100,
                      value: _fontSize.value * 1.0,
                      onChanged: (v) {
                        _fontSize.value = v.toInt();
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: _imgSize,
                      builder: (context, value, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: Text(
                                "Image size: $value",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Slider(
                              activeColor: Colors.deepPurpleAccent,
                              min: 1,
                              max: 512,
                              value: _imgSize.value * 1.0,
                              onChanged: (v) {
                                _imgSize.value = v.toInt();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    Center(
                      child: RepaintBoundary(
                        key: _widgetKey,
                        child: ValueListenableBuilder(
                          valueListenable: _imgSize,
                          builder: (context, value, child) {
                            return Container(
                              color: Colors.deepPurpleAccent,
                              height: value.toDouble(),
                              width: value.toDouble(),
                              child: Center(
                                child: ValueListenableBuilder(
                                  valueListenable: _imgText,
                                  builder: (context, value, child) {
                                    return ValueListenableBuilder(
                                      valueListenable: _fontSize,
                                      builder: (context, value, child) {
                                        return Text(
                                          _imgText.value,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Glitch",
                                            fontSize: _fontSize.value.toDouble(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: _saveImage,
        tooltip: 'Save Iamge',
        child: const Icon(Icons.save, color: Colors.white),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _saveImage() async {
    try {
      RenderRepaintBoundary boundary =
          _widgetKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // 2) save image logic
      String name = nameControler.text.trim();
      if (name.isEmpty) {
        name = 'IMG-${DateTime.now().millisecondsSinceEpoch}';
      }
      Directory output = Directory("output");
      if(!output.existsSync()){
        output.createSync();
      }
      final file = File("output/$name.png");
      await file.writeAsBytes(pngBytes);

      // show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image $name saved successfully in ${output.absolute}')),
        );
      }
    } catch (ex) {
      debugPrint("$ex");
    }
  }
}
