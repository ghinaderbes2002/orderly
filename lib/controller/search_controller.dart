import 'package:flutter/material.dart';
import 'package:get/get.dart';



abstract class SearchController extends GetxController {
search();
}

class SearchControllerimp extends SearchController {

  final TextEditingController searchTextController = TextEditingController();

  List<dynamic> searchResults = [];
  bool isLoading = false;




@override
  Future<void> search() async {
    final query = searchTextController.text.trim();
    if (query.isEmpty) return;

    isLoading = true;
    update();

    try {
      await Future.delayed(const Duration(seconds: 1)); 

      searchResults = [
        'مطعم الشام - $query',
        'متجر المدينة - $query',
        'سوبرماركت نور - $query',
      ];
    } catch (e) {
      Get.snackbar('خطأ', 'فشل البحث: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }
  

}
