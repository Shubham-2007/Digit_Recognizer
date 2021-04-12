import 'package:digit_finder/input_output/output.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:digit_finder/screen/widget.dart';
import 'package:digit_finder/input_output/canvas.dart';

// ignore: must_be_immutable
class Layout extends StatelessWidget {
  //List<DrawingPoint> points = [];
  static GlobalKey previewContainer = new GlobalKey();
  // DrawingBoard floatbutton = new DrawingBoard();
  @override
  Widget build(BuildContext context) {
    //final devicephoto = Provider.of<CameraGallery>(context);
    final showresult = Provider.of<Output>(context);
    final draw = Provider.of<Draw1>(context);
    return Scaffold(
        // backgroundColor: Colors.red,
        appBar: appbar(),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RepaintBoundary(
              key: previewContainer,
              child: Container(
                //con > 0 ? uploadimage.imagereturn() : Container()
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.76,
                color: Colors.white,
                child: 
                // Consumer<CameraGallery>(
                //     builder: (context, provider, child) {
                //   return provider.imagereturn() == 'yes'
                //       ? Image.file(provider.imageFile)
                //       : 
                      DrawingBoard() //drawprovider.drawingBoard(context);
                // }),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 50,
            //   child: FlatButton(
            //     child: Text("Camera/Phone Photo"),
            //     color: Colors.blue,
            //     textColor: Colors.white,
            //     onPressed: () {
            //       devicephoto.showdialong(context);
            //     },
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                //print(devicephoto.imageFile);
                //File imagephoto = takeScreenShot(previewContainer)[0];
                // ByteData imagesize = takeScreenShot(previewContainer);
                // print("imagesize");print(imagesize);
                var image = await takeScreenShot(previewContainer);
                //print("++++++");
                //print(image);
                showresult.showdialongoutput(context, image);
                //devicephoto.noimagereturn();
                draw.clean();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                height: 60.0,
                margin: EdgeInsets.only(
                    left: 20.0, right: 100.0, top: 0.0, bottom: 10.0),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.black, width: 2.0)),
                child: Text(
                  'Identify',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),

            // showresult.clickbutton(context, imageFile),
          ],
        ),
        floatingActionButton: draw.cleancanvas());
  }
}

// Widget mainpage() {
//   return ChangeNotifierProvider<CameraGallery>(
//       create: (context) => CameraGallery(),
//       child: Builder(builder: (context) {
//         return Scaffold(
//           appBar: appbar(),
//           body: Container(
//               decoration: BoxDecoration(color: Colors.grey[700]),
//               padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
//               child:
//                   Consumer<CameraGallery>(builder: (context, provider, child) {
//                 return Column(
//                   //mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                         //con > 0 ? uploadimage.imagereturn() : Container()
//                         width: double.infinity,
//                         height: 450,
//                         color: Colors.white,
//                         child: provider.imagereturn() == 'yes'
//                             ? Image.file(provider.imageFile)
//                             : Container()),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       width: double.infinity,
//                       child: FlatButton(
//                         child: Text("Camera/Phone Photo"),
//                         color: Colors.blue,
//                         textColor: Colors.white,
//                         onPressed: () {
//                           provider.showdialong(context);
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     clickbutton(),
//                   ],
//                 );
//               })),
//         );
//       }));
// }

// floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.clear),
//         onPressed: () {
//           setState(() {
//             points.clear();
//           });
//         },
//       ),

// class _ProviderDemoState extends State<ProviderDemo> {
//   List items = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"];
//   @override
//   Widget build(BuildContext context) {
//     final itemMdl = Provider.of<ItemProvider>(context);
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Provider Demo"),
//       ),
//       body: SingleChildScrollView(
//           child: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ConstrainedBox(
//               constraints: BoxConstraints(
//                 minHeight: height / 3,
//               ),
//               child: Container(
//                 width: width,
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 color: Colors.purpleAccent,
//                 child: Wrap(
//                   crossAxisAlignment: WrapCrossAlignment.center,
//                   children: items.map((e) {
//                     return InkWell(
//                       onTap: () {
//                         itemMdl.addItems(e);
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(20),
//                         margin: EdgeInsets.only(right: 10, bottom: 10),
//                         color: Colors.yellow,
//                         child: Text(e),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight: height / 3,
//                 ),
//                 child: Container(
//                   width: width,
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                   color: Colors.greenAccent,
//                   child: Wrap(
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     children: itemMdl.addedItems.map((e) {
//                       return InkWell(
//                         onTap: () {
//                           itemMdl.removeItems(e);
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(20),
//                           margin: EdgeInsets.only(right: 10, bottom: 10),
//                           color: Colors.blue,
//                           child: Text(e),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ))
//           ],
//         ),
//       )),
//     );
//   }
// }
