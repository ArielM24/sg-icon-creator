import 'package:SGIconCreator/home/widgets/body/buttons/SetValuesButton.dart';
import 'package:SGIconCreator/home/widgets/body/cube/IconImageWidget.dart';
import 'package:SGIconCreator/home/widgets/body/sliders/ValueSlider.dart';
import 'package:SGIconCreator/home/widgets/body/text_inputs/IconNameWidget.dart';
import 'package:SGIconCreator/home/widgets/body/buttons/IconSaveButton.dart';
import 'package:SGIconCreator/home/widgets/body/text_inputs/IconTextWidget.dart';
import 'package:flutter/material.dart';

class IconCreatorHome extends StatelessWidget {
  const IconCreatorHome({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameControler = TextEditingController();
    final ValueNotifier<String> topTextNotifier = ValueNotifier<String>(
      "SG MOD",
    );
    final ValueNotifier<String> leftTextNotifier = ValueNotifier<String>(
      "SG MOD",
    );
    final ValueNotifier<String> rightTextNotifier = ValueNotifier<String>(
      "SG MOD",
    );
    final ValueNotifier<double> topFontSizeNotifier = ValueNotifier<double>(10);
    final ValueNotifier<double> leftFontSizeNotifier = ValueNotifier<double>(
      10,
    );
    final ValueNotifier<double> rightFontSizeNotifier = ValueNotifier<double>(
      10,
    );
    final ValueNotifier<double> imageSizeNotifier = ValueNotifier<double>(128);
    final ValueNotifier<double> cubeSizeNotifier = ValueNotifier<double>(70);
    final ValueNotifier<double> xTranslationNotifier = ValueNotifier<double>(
      64,
    );
    final ValueNotifier<double> yTranslationNotifier = ValueNotifier<double>(
      78,
    );
    final ValueNotifier<double> xRotationNotifier = ValueNotifier<double>(45.0);
    final ValueNotifier<double> yRotationNotifier = ValueNotifier<double>(45.0);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: IconTextWidget(
                    imageTextNotifier: topTextNotifier,
                    label: "Top Text",
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ValueSlider(
                    valueNotifier: topFontSizeNotifier,
                    label: "Top Font Size",
                    min: 1,
                    max: 50,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: IconTextWidget(
                    imageTextNotifier: leftTextNotifier,
                    label: "Left Text",
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ValueSlider(
                    valueNotifier: leftFontSizeNotifier,
                    label: "Left Font Size",
                    min: 1,
                    max: 50,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: IconTextWidget(
                    imageTextNotifier: rightTextNotifier,
                    label: "Right Text",
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ValueSlider(
                    valueNotifier: rightFontSizeNotifier,
                    label: "Right Font Size",
                    min: 1,
                    max: 50,
                  ),
                ),
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ValueSlider(
                  valueNotifier: imageSizeNotifier,
                  label: "Image size",
                  min: 1,
                  max: 512,
                ),
                ValueSlider(
                  valueNotifier: cubeSizeNotifier,
                  matchValueNotifier: imageSizeNotifier,
                  label: "Cube size",
                  min: 1,
                  max: 512,
                ),
                ValueSlider(
                  valueNotifier: xRotationNotifier,
                  label: "X rotation",
                  min: 0,
                  max: 360,
                ),
                ValueSlider(
                  valueNotifier: yRotationNotifier,
                  label: "Y rotation",
                  min: 0,
                  max: 360,
                ),
                ValueSlider(
                  valueNotifier: xTranslationNotifier,
                  label: "X translation",
                  min: 0,
                  max: 512,
                ),
                ValueSlider(
                  valueNotifier: yTranslationNotifier,
                  label: "Y translation",
                  min: 0,
                  max: 512,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    imageSizeNotifier.value = 128;
                    cubeSizeNotifier.value = 70;
                    xRotationNotifier.value = 45;
                    yRotationNotifier.value = 45;
                    xTranslationNotifier.value = 64;
                    yTranslationNotifier.value = 78;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  child: Text(
                    "128x128 Cube",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    imageSizeNotifier.value = 256;
                    cubeSizeNotifier.value = 140;
                    xRotationNotifier.value = 45;
                    yRotationNotifier.value = 45;
                    xTranslationNotifier.value = 130;
                    yTranslationNotifier.value = 160;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  child: Text(
                    "256x256 Cube",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    imageSizeNotifier.value = 512;
                    cubeSizeNotifier.value = 275;
                    xRotationNotifier.value = 45;
                    yRotationNotifier.value = 45;
                    xTranslationNotifier.value = 260;
                    yTranslationNotifier.value = 320;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  child: Text(
                    "512x125 Cube",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    imageSizeNotifier.value = 128;
                    cubeSizeNotifier.value = 128;
                    xRotationNotifier.value = 0;
                    yRotationNotifier.value = 0;
                    xTranslationNotifier.value = 0;
                    yTranslationNotifier.value = 0;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  child: Text(
                    "128x128 Square",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    imageSizeNotifier.value = 256;
                    cubeSizeNotifier.value = 256;
                    xRotationNotifier.value = 0;
                    yRotationNotifier.value = 0;
                    xTranslationNotifier.value = 0;
                    yTranslationNotifier.value = 0;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  child: Text(
                    "256x256 Square",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    imageSizeNotifier.value = 512;
                    cubeSizeNotifier.value = 512;
                    xRotationNotifier.value = 0;
                    yRotationNotifier.value = 0;
                    xTranslationNotifier.value = 0;
                    yTranslationNotifier.value = 0;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  child: Text(
                    "512x512 Square",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            Expanded(child: Container()),
            IconImageWidget(
              topFontSizeNotifier: topFontSizeNotifier,
              imageSizeNotifier: imageSizeNotifier,
              topTextNotifier: topTextNotifier,
              imageWidgetKey: imageWidgetKey,
              xNotifier: xRotationNotifier,
              yNotifier: yRotationNotifier,
              cubeSizeNotifier: cubeSizeNotifier,
              xTranslationNotifier: xTranslationNotifier,
              yTranslationNotifier: yTranslationNotifier,
              leftTextNotifier: leftTextNotifier,
              rightTextNotifier: rightTextNotifier,
              leftFontSizeNotifier: leftFontSizeNotifier,
              rightFontSizeNotifier: rightFontSizeNotifier,
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      floatingActionButton: IconSaveButton(
        textControler: nameControler,
        imageWidgetKey: imageWidgetKey,
      ),
    );
  }
}
