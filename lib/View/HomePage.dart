import 'package:alwrite/View/left_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'right_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(flex: 1, child: leftPage()),
            Expanded(flex: 3, child: rightPage())
          ],
        ),
      ),
    );
  }
}
