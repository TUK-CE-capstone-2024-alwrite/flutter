import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../Model/pdf_model.dart';
import '../pdf_viewer.dart';

class PdfController extends GetxController {
  final pdfModel _model = pdfModel();
  List<File> get pdfFiles => _model.pdfFiles;
  List<String> get pdfFileNames => _model.pdfFileNames;

  List<String> searchedPdfFiles = []; // 검색된 파일만 나옴

  Future<void> pickPDF(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      _model.addPdf(File(result.files.single.path!), result.files.single.name);
      update(); // 상태 변경을 알리기 위해 update 호출
    }
  }

  void deletePdf(int index) {
    if (index >= 0 && index < pdfFiles.length) {
      pdfFiles[index].deleteSync();
      pdfFiles.removeAt(index);
      pdfFileNames.removeAt(index);
      update(); // 상태 변경을 알리기 위해 update 호출
    }
  }

  void openPdf(File file) {
    Get.to(() => PdfViewer(file: file));
  }
}
