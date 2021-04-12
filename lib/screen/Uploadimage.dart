import 'dart:typed_data';

import 'package:digit_finder/input_output/camera_gallery.dart';
import 'package:digit_finder/input_output/output.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UploadImage extends StatelessWidget {
  static GlobalKey previewContainer1 = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final devicephoto = Provider.of<CameraGallery>(context);
    final showresult1 = Provider.of<Output>(context);
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
          // GestureDetector(
          // onTap: () {
          //   devicephoto.showdialong(context); //write code to upload image
          // },
          // child:
          RepaintBoundary(
            key: previewContainer1,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              //width: MediaQuery.of(context).size.width,
              width: double.infinity,

              color: Colors.white,
              height: 500,
              //MediaQuery.of(context).size.height * 0.7,
              // decoration: BoxDecoration(
              //     // image: DecorationImage(image: AssetImage('assets/logo.png')),
              //     border: Border.all(color: Colors.black, width: 2.0)),
              child:
                  Consumer<CameraGallery>(builder: (context, provider, child) {
                return provider.imagereturn() == 'yes'
                    ? Image.file(provider.imageFile)
                    : Image.asset(
                        'assets/download.png',
                        fit: BoxFit.cover,
                      ); //drawprovider.drawingBoard(context);
              }),
            ),
          ),
          // ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.all(10.0),
            //width: double.infinity,
            //MediaQuery.of(context).size.width,
            //height: 60.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 5.0),
                borderRadius: BorderRadius.circular(15.0)),
            child: FlatButton(
              child: Text(
                'Upload Photo',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              onPressed: () {
                devicephoto.showdialong(context);
              },
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              //MediaQuery.of(context).size.width,
              height: 60.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black, width: 5.0),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text(
                'Identify',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            onTap: () async {
              //print(devicephoto.imageFile);
              //File imagephoto = takeScreenShot(previewContainer)[0];
              //ByteData imagesize = takeScreenShot(previewContainer);
              // print("imagesize");print(imagesize);
              // String path = devicephoto.imageFile.toString();
              // final ByteData bytedata =
              //     await rootBundle.load(path.split('\'')[1]);
              // final Uint8List image = bytedata.buffer.asUint8List();
              //var image = await takeScreenShot(previewContainer1);
              // var image = await changeimagepathtobyte(previewContainer);
              //print("++++++");
              //
              // print("-------------------------------------");
              //print(Image.file(devicephoto.imageFile));
              String path = devicephoto.imageFile.toString();
              //String path2 = 'assets/download (1).png';
              // print("--------------111111");
              // print(path2);
              // print(path.split('\'')[1]);
              path = path.split('\'')[1];
              final ByteData bytedata = await rootBundle.load(path);
              // print("--------------2222222");
              final Uint8List list = bytedata.buffer.asUint8List();
              // print(list);
              //print("--------------333333333");
              //print(image);
              showresult1.showdialongoutput(context, list);
              // print("-------------4444444");
              //showresult.showdialongoutput(context,devicephoto.imagebyte);
              //devicephoto.noimagereturn();
              //draw.clean(); 147 179 180 19 ,52 47 125 64
            },
          ),
        ],
      ),
    );
  }
}
