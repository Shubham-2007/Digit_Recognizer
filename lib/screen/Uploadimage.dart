import 'dart:typed_data';

import 'package:digit_finder/input_output/camera_gallery.dart';
import 'package:digit_finder/input_output/output.dart';
import 'package:digit_finder/screen/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UploadImage extends StatelessWidget {
  static GlobalKey previewContainer = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final devicephoto = Provider.of<CameraGallery>(context);
    final showresult = Provider.of<Output>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('Upload Image'),
      ),
      body: Column(
        children: [
          // Container(
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.all(10.0),
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height * 0.7,
          //   decoration: BoxDecoration(
          //       // image: DecorationImage(image: AssetImage('assets/logo.png')),
          //       border: Border.all(color: Colors.black, width: 2.0)),
          //   child: GestureDetector(
          //     onTap: () {
          //       devicephoto.showdialong(context); //write code to upload image
          //     },
          //     child: Text('Tap here to upload image'),
          //   ),
          // ),
          RepaintBoundary(
            key: previewContainer,
            child: GestureDetector(
              onTap: () {
                devicephoto.showdialong(context); //write code to upload image
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    // image: DecorationImage(image: AssetImage('assets/logo.png')),
                    border: Border.all(color: Colors.black, width: 2.0)),
                child: Consumer<CameraGallery>(
                    builder: (context, provider, child) {
                  return provider.imagereturn() == 'yes'
                      ? Image.file(provider.imageFile)
                      : Text(
                          'Tap here to upload image'); //drawprovider.drawingBoard(context);
                }),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            height: 60.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black, width: 5.0),
                borderRadius: BorderRadius.circular(15.0)),
            child: GestureDetector(
              child: Text(
                'Identify',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              onTap: () async {
                //print(devicephoto.imageFile);
                //File imagephoto = takeScreenShot(previewContainer)[0];
                //ByteData imagesize = takeScreenShot(previewContainer);
                // print("imagesize");print(imagesize);
                var image = await takeScreenShot(previewContainer);
               // var image = await changeimagepathtobyte(previewContainer);
                //print("++++++");
                 print(image);
                // print("-------------------------------------");
                // String path = devicephoto.imageFile.toString();
                // final ByteData bytedata =
                //     await rootBundle.load(path.split('\'')[1]);
                // final Uint8List list = bytedata.buffer.asUint8List();
                // print(list);
                showresult.showdialongoutput(context, image);
                devicephoto.noimagereturn();
                //draw.clean();
              },
            ),
          ),
        ],
      ),
    );
  }
}
