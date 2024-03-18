
import 'package:alwrite/View/HomePage.dart';

import 'package:alwrite/views/drawingPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

const Color kCanvasColor = Color(0xfff2f3f7);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

    //return MaterialApp(
     // title: 'Alwrite',
      //theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      //debugShowCheckedModeBanner: true,
     // home: const DrawingPage(),
    //);
  //}
//}

