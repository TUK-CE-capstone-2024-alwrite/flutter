import 'dart:io';

import 'package:alwrite/Controller/pdf_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class rightPage extends StatelessWidget {
  final controller = Get.put(PdfController());

  rightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                width: double.infinity,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () async {
                      await controller.pickPDF(context);
                    },
                    icon: Icon(
                      Icons.add,
                      size: 38,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 92,
              child: Container(
                color: Colors.white,
                child: GetBuilder<PdfController>(
                  builder: (_controller) => GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 6
                          : 4, // 세로모드 4개 , 가로모드 6개
                      mainAxisSpacing: 50, // 간격
                      crossAxisSpacing: 50,
                    ),
                    itemCount: _controller.searchedPdfFiles.isNotEmpty
                        ? _controller.searchedPdfFiles.length
                        : _controller.pdfFiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      final fileName = _controller.searchedPdfFiles.isNotEmpty
                          ? _controller.searchedPdfFiles[index]
                          : _controller.pdfFileNames[index];
                      final file = _controller.pdfFiles.firstWhere(
                          (element) => element.path.contains(fileName));
                      return GestureDetector(
                        onTap: () {
                          _controller.openPdf(file);
                        },
                        onLongPress: () {
                          showLongPressDialog(context, index);
                        },
                        child: Card(
                          color: Colors.grey,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'PDF ${index + 1}',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  fileName,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void showLongPressDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('취소'),
                onTap: () {
                  // Option 1이 선택되었을 때 할 일
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('휴지통으로 이동'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("완전히 삭제하기"),
                        content: Text("이 파일을 영구적으로 삭제하시겠습니까?"),
                        actions: [
                          TextButton(
                            child: Text("취소"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                          TextButton(
                            child: Text("삭제"),
                            onPressed: () {
                              controller.deletePdf(index);
                              // Remove action here
                              Navigator.of(context).pop();
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // Option 2가 선택되었을 때 할 일
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
