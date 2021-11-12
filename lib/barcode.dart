// ignore_for_file: always_specify_types

import 'dart:io';

import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';

class BarCode extends StatefulWidget {

  @override
  _BarCodeState createState() => _BarCodeState();
}

class _BarCodeState extends State<BarCode> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createBC();
  }
  createBC(){
    // Create a DataMatrix barcode
    final dm = Barcode.dataMatrix();

// Generate a SVG with "Hello World!"
    final svg = dm.toSvg('Hello World!', width: 200, height: 200);

    final me = MeCard.wifi(
      ssid: 'Wifi Name',
      password: 'password',
    );

// Generate a SVG with a barcode that configures the wifi access
    final svg1 = dm.toSvg(me.toString(), width: 200, height: 200);

// Save the image
   return File(svg1).writeAsString(svg);
  }

  @override
  Widget build(BuildContext context) {


// Save the image
//     File('barcode.svg').writeAsString(svg);
    return Container(
      child: createBC(),
    );

    }
  }