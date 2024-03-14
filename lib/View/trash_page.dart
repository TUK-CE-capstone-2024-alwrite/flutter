import 'package:alwrite/View/navi_drawer.dart';
import 'package:flutter/material.dart';

class trashPage extends StatelessWidget {
  const trashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navidrawer(),
      appBar: AppBar(),
    );
  }
}
