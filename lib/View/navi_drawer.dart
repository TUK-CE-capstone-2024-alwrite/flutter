import 'package:alwrite/Controller/pdf_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class navidrawer extends StatelessWidget {
  final controller = Get.put(PdfController());
  navidrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[250],
        child: ListView(padding: EdgeInsets.zero, children: [
          Container(
              width: 10,
              height: 230,
              child: Image(
                  image: AssetImage('assets/Logo2.jpg'), fit: BoxFit.cover)),
          SizedBox(height: 15),
          ListTile(
            title: TextField(
              onChanged: (value) => controller.onsearch(value),
              decoration: InputDecoration(
                  hintText: "검색",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("휴지통"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.folder_sharp),
            title: Text("모든 메모"),
            onTap: () {},
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.black,
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            title: Text('카테고리'),
          )
        ]),
      ),
    );
  }
}
