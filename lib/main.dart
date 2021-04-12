import 'package:digit_finder/HoemPage.dart';
import 'package:digit_finder/input_output/camera_gallery.dart';
import 'package:digit_finder/input_output/output.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//mport 'package:digit_finder/screen/Layout.dart';
import 'package:provider/provider.dart';
//import 'package:digit_finder/screen/Output.dart';
import 'package:digit_finder/input_output/canvas.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Output>(create: (_) => Output()),
        ChangeNotifierProvider<CameraGallery>(create: (_) => CameraGallery()),
        ChangeNotifierProvider<Draw1>(create: (_) => Draw1()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: //Layout(),
        //UploadImage(),
        HomePage(),
        //mainpage(),
      ),
    );
  }
}

// List providers = ;
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(

//         //primarySwatch: Colors.blue,
//       ),
//       home: Layout(),
//     );
//     Using MultiProvider is convenient when providing multiple objects.
//     return MultiProvider(
//       providers: [
//         // In this sample app, CatalogModel never changes, so a simple Provider
//         // is sufficient.
//         Provider(create: (context) => CatalogModel()),
//         // CartModel is implemented as a ChangeNotifier, which calls for the use
//         // of ChangeNotifierProvider. Moreover, CartModel depends
//         // on CatalogModel, so a ProxyProvider is needed.
//         ChangeNotifierProxyProvider<CatalogModel, CartModel>(
//           create: (context) => CartModel(),
//           update: (context, catalog, cart) {
//             cart.catalog = catalog;
//             return cart;
//           },
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Provider Demo',
//         //theme: appTheme,
//         initialRoute: '/',
//         routes: {
//           '/': (context) => Layout(),
//           '/answer': (context) => Output(),
//           //'/cart': (context) => MyCart(),
//         },
//       ),
//     );
//   }
// }