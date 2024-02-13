
import 'package:alwrite/controllers/drawingController.dart';
import 'package:alwrite/views/drawingView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (context) => DrawingProvider(),
          child: DrawingPage()),
    );
  }
}
