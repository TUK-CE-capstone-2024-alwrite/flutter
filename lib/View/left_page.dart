import 'package:alwrite/View/HomePage.dart';
import 'package:alwrite/View/right_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class leftPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  leftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 35,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              width: double.infinity,
              color: Colors.grey[300],
              child: Column(
                children: [
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        Get.off(HomePage());
                      },
                      child: Text("모든 메모"))
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.all(6),
            child: Text(
              "내 카테고리",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
              flex: 65,
              child: Container(
                color: Colors.grey[300],
                child: ListView(
                  children: [Text('ss')],
                ),
              ))
        ],
      ),
    );
  }
}
