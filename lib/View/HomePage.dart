import 'package:alwrite/View/left_page.dart';
import 'package:alwrite/View/navi_drawer.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'right_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navidrawer(),
      appBar: AppBar(),
      body: Container(
        child: Row(
          children: [
            // Expanded(flex: 2, child: leftPage()), //leftPage
            Expanded(flex: 5, child: rightPage())
          ],
        ),
      ),
    );
  }
}
