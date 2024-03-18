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

  List<String> searchedPdfFiles = []; // 검색된 파일담는 리스트

  Future<void> pickPDF(BuildContext context) async {
    //파일 피커
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
      //인덱스가 유효한지지 확인.
      pdfFiles[index].deleteSync(); //해당 인덱스의 파일을 동기적으로 삭제.
      pdfFiles.removeAt(index); //해당 인덱스의 파일을 리스트에서 제거
      pdfFileNames.removeAt(index); //해당 인덱스의 파일명을 리스트에서 제거
      update(); // 상태 변경을 알리기 위해 update 호출
    }
  }

  void openPdf(File file) {
    Get.to(() => PdfViewer(file: file));
  }

  //검색한 파일명 필터링
  onsearch(String search) {
    searchedPdfFiles = pdfFileNames
        .where(
            (fileName) => fileName.toLowerCase().contains(search.toLowerCase()))
        .toList();
    update(); // 화면 갱신.
  }
}
