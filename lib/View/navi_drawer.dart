import 'package:alwrite/Controller/pdf_controller.dart';
import 'package:alwrite/View/HomePage.dart';
import 'package:alwrite/View/trash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class navidrawer extends StatelessWidget {
  final textcontroller = TextEditingController();
  final controller = Get.put(PdfController());
  navidrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: ListView(padding: EdgeInsets.zero, children: [
          Container(
              width: 10,
              height: 230,
              child: Image(
                  image: AssetImage('assets/Logo2.jpg'), fit: BoxFit.cover)),
          SizedBox(height: 15),
          // ListTile(
          //   title: TextField(
          //       controller: textcontroller,
          //       onChanged: controller.searchfile,
          //       decoration: InputDecoration(
          //           labelText: 'Search', suffixIcon: Icon(Icons.search))),
          // ),
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
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("휴지통", style: TextStyle(fontWeight: FontWeight.w500)),
            onTap: () {
              Get.to(trashPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.folder_sharp),
            title: Text("모든 메모", style: TextStyle(fontWeight: FontWeight.w500)),
            onTap: () {
              Get.to(HomePage());
            },
          ),
          SizedBox(height: 14),
          Divider(
            color: Colors.grey,
            indent: 15,
            endIndent: 15,
            thickness: 1,
          ),
          ListTile(
            title: Text('카테고리', style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("새 카테고리 추가",
                style: TextStyle(fontWeight: FontWeight.w500)),
            onTap: () {},
          )
        ]),
      ),
    );
  }
}
