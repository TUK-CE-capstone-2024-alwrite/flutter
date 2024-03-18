// pdf_viewer.dart
//pdf 보여주는 페이지
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewer extends StatelessWidget {
  final File file;

  const PdfViewer({required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              PDFView(
                filePath: file.path,
                enableSwipe: true,
              ),
            ],
          )),
    );
  }
}
