import 'package:digit_finder/screen/Layout.dart';
import 'package:digit_finder/screen/Uploadimage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150.0,
            height: 150.0,
            
            child: Image.asset('assets/logo.png',fit: BoxFit.cover,),
          ),
          SizedBox(
            height: 50.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Layout()),
              );
              print("shubham");
              //Layout();
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black, width: 5.0),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text(
                'Draw',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadImage()),
              );
              
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 5.0),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text(
                'Upload Image',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
