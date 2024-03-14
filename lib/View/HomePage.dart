import 'package:alwrite/Controller/pdf_controller.dart';
import 'package:alwrite/View/navi_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'right_page.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navidrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await controller.pickPDF(context);
            },
            icon: Icon(
              Icons.add,
              size: 38,
            ),
          )
        ],
      ),
      body: Container(
        child: rightPage(),
      ),
    );
  }
}
