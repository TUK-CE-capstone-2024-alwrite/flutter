import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../View/category_screen.dart';

class CategoryController extends GetxController {
  RxList<String> categories = <String>[].obs; // obs는 get 상태관리

  Future<void> showNewCategoryDialog(BuildContext context) async {
    String? categoryName = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _controller = TextEditingController();
        return AlertDialog(
          title: Text("새 카테고리 추가"),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "카테고리 이름을 입력하세요",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                String inputText = _controller.text;
                if (inputText.isNotEmpty) {
                  categories.add(inputText); // 새 카테고리를 추가합니다.
                  // 카테고리가 추가되면 화면을 갱신합니다.
                  update();
                }
                Navigator.pop(context);
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  void navigateToCategoryScreen(BuildContext context, String categoryName) {
    Get.to(() => CategoryScreen(categoryName: categoryName));
  }
}
