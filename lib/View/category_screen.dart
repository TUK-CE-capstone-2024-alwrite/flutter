import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/pdf_controller.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  final PdfController _controller = Get.put(PdfController());

  CategoryScreen({required this.categoryName});

  // 해당 카테고리에 대한 PdfController 인스턴스 생성

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
        ),
        body: Expanded(
          flex: 3,
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
                        await _controller.pickPDF(context);
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
                        crossAxisCount: 3,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                      ),
                      itemCount: _controller.pdfFiles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            _controller.openPdf(
                              _controller.pdfFiles[index],
                            );
                          },
                          onLongPress: () {
                            //showLongPressDialog(context, index);
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
                                    _controller.pdfFileNames[index],
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
          ),
        ));
  }
}
