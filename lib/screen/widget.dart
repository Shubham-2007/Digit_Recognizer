import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// import 'package:digit_finder/server/DrawingPoints.dart';
// import 'package:digit_finder/input_output/canvas.dart';
// import 'dart:io';

class Widgetshow extends ChangeNotifier {
  // Widget clean() {
  //   int clean = 1;
  //   notifyListeners();
  //   return FloatingActionButton(
  //     child: Icon(Icons.clear),
  //     onPressed: () {
  //       points.clear();
  //       clean = 0;
  //     },
  //   );
  // }
}
// import 'package:path_provider/path_provider.dart';
// import 'package:image_picker_saver/image_picker_saver.dart';

takeScreenShot(GlobalKey previewContainer) async {
  RenderRepaintBoundary boundary =
      previewContainer.currentContext.findRenderObject();
  ui.Image image = await boundary.toImage();
  //print("*********************0");
  //print(image);
  //print("*********************1");
  //final directory = (await getApplicationDocumentsDirectory()).path;
  var bytedata = await image.toByteData(format: ui.ImageByteFormat.png);
  //print(bytedata);
  //print("*********************2");
  //var filepath =
  Uint8List pngBytes = bytedata.buffer.asUint8List();
  //print(pngBytes);
  // print("*********************1");
  return pngBytes;
  //await ImagePickerSaver.saveFile(fileData: byteData.buffer.asUint8List());
  // return byteData;
  //print(filepath);
  // print(directory);
  //print("*********************2");
  // //print(pngBytes);
  // File imgFile = new File('$directory/screenshot.png');
  // //imgFile.writeAsBytes(pngBytes);
  // print(imgFile);
  // imgFile.delete();
  // print(imgFile);
}

changeimagepathtobyte(imagepath) async {
  String path = imagepath.toString();
  final ByteData bytedata = await rootBundle.load(path.split('\'')[1]);
  final Uint8List list = bytedata.buffer.asUint8List();
  //print(list);
  //print(pngBytes);
  // print("*********************1");
  //await ImagePickerSaver.saveFile(fileData: byteData.buffer.asUint8List());
  // return byteData;
  //print(filepath);
  // print(directory);
  //print("*********************2");
  // //print(pngBytes);
  // File imgFile = new File('$directory/screenshot.png');
  // //imgFile.writeAsBytes(pngBytes);
  // print(imgFile);
  // imgFile.delete();
  // print(imgFile);
  return list;
}

Widget appbar() {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      'Draw',
      style:
          //Theme.of(context).textTheme.headline1,
          TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.orange[900],
  );
}

// Widget clickbutton(BuildContext context, File imagepath) {
//   return Container(
//     decoration:
//         BoxDecoration(shape: BoxShape.circle, color: Colors.orangeAccent),
//     child: FlatButton(
//       child: Text("Check"),
//       onPressed: () {
//         print(imagepath);
//         showdialong(context, imagepath);
//       },
//     ),
//     height: 80,
//     width: 80,
//   );
// }
