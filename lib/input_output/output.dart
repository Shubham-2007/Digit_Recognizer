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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(
              "Result",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: new Container(
                height: 90,
                width: double.infinity,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'It\'s $digit',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Text(
                          'Okay',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ) //Image.file(imagepath)
                ),
          );
          //notifyListeners();
        });
  }
}
