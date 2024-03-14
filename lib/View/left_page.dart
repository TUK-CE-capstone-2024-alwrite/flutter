import 'package:alwrite/Controller/pdf_controller.dart';
import 'package:alwrite/View/HomePage.dart';
import 'package:alwrite/View/trash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class leftPage extends StatelessWidget {
  final controller = Get.put(PdfController());
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
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (value) => controller.onsearch(value),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[400],
                        hintText: "검색",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        contentPadding: EdgeInsets.all(10),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(height: 20),
                  TextButton.icon(
                      onPressed: () {
                        Get.to(trashPage());
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      label: Text(
                        "휴지통",
                        style: TextStyle(color: Colors.black),
                      )),
                  SizedBox(height: 20),
                  TextButton(
                      onPressed: () {
                        Get.off(HomePage());
                      },
                      child: Text(
                        "모든 메모",
                        style: TextStyle(color: Colors.black),
                      )),
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
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          Get.to(trashPage());
                        },
                        icon: Icon(
                          Icons.folder,
                          color: Colors.black,
                        ),
                        label: Text(
                          "알고리즘",
                          style: TextStyle(color: Colors.black),
                        )),
                    TextButton.icon(
                        onPressed: () {
                          Get.to(trashPage());
                        },
                        icon: Icon(
                          Icons.folder,
                          color: Colors.black,
                        ),
                        label: Text(
                          "이산수학",
                          style: TextStyle(color: Colors.black),
                        )),
                    TextButton.icon(
                        onPressed: () {
                          Get.to(trashPage());
                        },
                        icon: Icon(
                          Icons.folder,
                          color: Colors.black,
                        ),
                        label: Text(
                          "자료구조",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
