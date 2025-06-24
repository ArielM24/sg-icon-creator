import 'package:SGIconCreator/home/widgets/IconFontSizeSlider.dart';
import 'package:SGIconCreator/home/widgets/IconImageSizeSlider.dart';
import 'package:SGIconCreator/home/widgets/IconImageWidget.dart';
import 'package:SGIconCreator/home/widgets/IconNameWidget.dart';
import 'package:SGIconCreator/home/widgets/IconSaveButton.dart';
import 'package:SGIconCreator/home/widgets/IconTextWidget.dart';
import 'package:flutter/material.dart';

class IconCreatorHome extends StatelessWidget {
  const IconCreatorHome({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameControler = TextEditingController();
    final TextEditingController textControler = TextEditingController();
    final ValueNotifier<String> imageTextNotifier = ValueNotifier<String>(
      "SG MOD",
    );
    final ValueNotifier<int> fontSizeNotifier = ValueNotifier<int>(16);
    final ValueNotifier<int> imageSizeNotifier = ValueNotifier<int>(128);
    final GlobalKey imageWidgetKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("SG Icon Creator"),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            IconNameWidget(nameControler: nameControler),
            IconTextWidget(
              textControler: textControler,
              imageTextNotifier: imageTextNotifier,
            ),
            IconFontSizeSlider(fontSizeNotifier: fontSizeNotifier),
            IconImageSizeSlider(imageSizeNotifier: imageSizeNotifier),
            IconImageWidget(
              fontSizeNotifier: fontSizeNotifier,
              imageSizeNotifier: imageSizeNotifier,
              imageTextNotifier: imageTextNotifier,
              textControler: textControler,
              imageWidgetKey: imageWidgetKey,
            ),
          ],
        ),
      ),
      floatingActionButton: IconSaveButton(textControler: textControler, imageWidgetKey: imageWidgetKey),
    );
  }
}
