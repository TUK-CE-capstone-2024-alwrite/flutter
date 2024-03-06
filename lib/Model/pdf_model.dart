import 'dart:io';
import 'package:get/get.dart';

class pdfModel extends GetxController {
  List<File> pdfFiles = [];
  List<String> pdfFileNames = [];

  void addPdf(File file, String fileName) {
    pdfFiles.add(file);
    pdfFileNames.add(fileName);
  }
}
