// import 'package:flutter/cupertino.dart';
// import 'dart:convert';
//import 'package:http/http.dart' as http;
// import 'package:flutter/services.dart';
import "package:dio/dio.dart";
//import 'dart:async';import 'dart:io';
// import 'dart:ui' as ui;

// Future<String> identifyDigitFromAssets(imagephoto) async {
//   String url = "http://10.0.2.2:8000/digit/";

//   print("----------------------------1");
//   //print(MemoryImage(imagephoto));
//   //print("-----------------------1");
//   //var bytes = await imagesize.toByteData(format: ui.ImageByteFormat.png);
//   //print("-----------------------2");
//   //print(bytes.toString());
//   FormData formdata = FormData.fromMap({
//      'file':
//          MultipartFile.fromBytes(imagephoto)
//    });
//    print("-----------------------3");
//    Dio dio = Dio();
//    Response response = await dio.post(url, data: formdata);
//    print(response.data);
//    print("-----------------------4");
//   return response.data['acc'];
// }

Future<String> identifyDigitFromAssets(imagepath) async {
  //print('imagepath: $imagepath');
  String url = "http://10.0.2.2:8000/digit/";
  //  print("----------------------------0");
  print(imagepath);
  //  print("-----------------------1");
  // String path = imagepath.toString();
  //var bytes = await rootBundle.load(path.split('\'')[1]);
  //print(bytes.toString());
  //print(imagepath.buffer.asUint8List());
  // print("-----------------------2");
  FormData formdata = FormData.fromMap({
    'file': MultipartFile.fromBytes(imagepath.buffer.asUint8List(),
        filename: "assets/download (1).png")
  });

  Dio dio = Dio();
  Response response;
  try {
    response = await dio.post(url, data: formdata);
  } on DioError catch (e) {
    if (e.response.statusCode == 500) return 'Server Error';
  }

  print(response.data);

  return response.data['digit'];
}
