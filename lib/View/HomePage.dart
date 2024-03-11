import 'package:alwrite/View/left_page.dart';
import 'package:flutter/material.dart';
import 'right_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(flex: 2, child: leftPage()), //leftPage
            Expanded(flex: 5, child: rightPage())
          ],
        ),
      ),
    );
  }
}
