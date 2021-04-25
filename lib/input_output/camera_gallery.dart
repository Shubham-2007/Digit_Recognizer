import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraGallery extends ChangeNotifier {
  File imageFile;
  //var imagebyte;

  void openGallery(BuildContext context) async {
    // print("1-----------------");
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    // print("picture");
    // print(picture);
    imageFile = picture;
    notifyListeners();
    Navigator.of(context).pop();
  }

  void opencamera(BuildContext context) async {
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.camera );
    // print("picture1");
    imageFile = picture;
    notifyListeners();
    Navigator.of(context).pop();
  }

  String imagereturn() {
    if (imageFile != null) {
      return "yes";
    } else
      return "no";
  }

  // Future<void> image8byte() async {
  //   String path = imageFile.toString();
  //   final ByteData bytedata = await rootBundle.load(path.split('\'')[1]);
  //   final Uint8List image = bytedata.buffer.asUint8List();
  //   imagebyte = image;
  //   notifyListeners();
  // }

  void noimagereturn() {
    imageFile = null;
    notifyListeners();
  }

  Future<void> showdialong(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a Choice!"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      opencamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
