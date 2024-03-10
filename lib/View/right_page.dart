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
              flex: 10,
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
                flex: 10,
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    onChanged: (value) => onsearch(value),
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
                )),
            Expanded(
              flex: 80,
              child: Container(
                color: Colors.white,
                child: GetBuilder<PdfController>(
                  builder: (_controller) => GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
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
                          // showLongPressDialog(context, index);
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

  onsearch(String search) {
    controller.searchedPdfFiles = controller.pdfFileNames
        .where(
            (fileName) => fileName.toLowerCase().contains(search.toLowerCase()))
        .toList();
    Get.forceAppUpdate(); // 검색 결과를 갱신하기 위해 화면을 강제로 갱신합니다.
  }
}
