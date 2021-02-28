// import 'dart:io';
import 'package:digit_finder/server/apicall.dart';
import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
// import 'package:flutter/services.dart';
// import 'dart:typed_data';


class Output extends ChangeNotifier {
  Future<void> showdialongoutput(BuildContext context, imagephoto) async {
    var digit = await identifyDigitFromAssets(imagephoto);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Output")),
            content: new Container(
                height: 400,
                width: double.infinity,
                child: Column(
                  children: [
                    Text('Digit :- $digit'),
                  ],
                ) //Image.file(imagepath)
                ),
          );
          //notifyListeners();
        });
  }
}
