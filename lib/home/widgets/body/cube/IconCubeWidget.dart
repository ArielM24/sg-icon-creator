import 'dart:math';

import 'package:flutter/material.dart';

class IconCubeWidget extends StatefulWidget {
  const IconCubeWidget({super.key});

  @override
  State<IconCubeWidget> createState() => _IconCubeWidgetState();
}

class _IconCubeWidgetState extends State<IconCubeWidget> {
  Offset offset = Offset.zero;
  double X = 45;
  double Y = 45;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Transform(
          alignment: Alignment.center,
          //transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateX(offset.dy * pi/180)..rotateY(offset.dx * pi/180),
          transform: Matrix4.identity()..rotateX(X * pi/180)..rotateY(-Y * pi/180),
           child: Center(child: GestureDetector(
            onPanUpdate: (details) {
        
              setState(() {
                offset += details.delta;
              });
              print(offset);
        
            },
             child: Stack(
               children: [
                 Container(
                       color: Colors.red,
                       child: Icon(Icons.flutter_dash, color: Colors.deepPurpleAccent,size: 200,)),
                 
                 Transform(
                  transform: Matrix4.identity()..rotateY(-pi/2),
                   child: Container(
                         color: Colors.orange,
                         child: Icon(Icons.flutter_dash, color: Colors.deepPurpleAccent,size: 200,)),
                 ),
                 
                 Transform(
                  transform: Matrix4.identity()..rotateX(pi/2),
                   child: Container(
                         color: Colors.blue,
                         child: Icon(Icons.flutter_dash, color: Colors.deepPurpleAccent,size: 200,)),
                 ),
                 
               ],
             ),
           )),),
           Slider(
            min: 0,
            max: 180,
            value: X, onChanged: (v){
              setState(() {
                X = v;
              });
           }),
           Slider(
            min: 0,
            max: 180,
            value: Y, onChanged: (v){
              setState(() {
                Y = v;
              });
           }),
      ],
    );
    //return Center(child: Icon(Icons.flutter_dash, color: Colors.deepPurpleAccent,size: 280,));
  }
}

