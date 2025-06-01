import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:orderly/controller/search_controller.dart';
import 'package:orderly/core/them/app_colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchControllerimp>(
      init: SearchControllerimp(),
      builder: (controller) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppColors.accent2, // لون موحد للخلفية
          appBar: AppBar(
            backgroundColor: AppColors.accent2,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.only(
                  top: 18.0, right: 8.0), // تنزل وتقرّب الكلمة من اليمين
              child: Text(
                'بحث',
                style: TextStyle(
                  color: AppColors.accent31,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 18.0, left: 8.0), // تنزل وتقرّب السلة من اليسار
                child: IconButton(
                  icon: const Icon(LineIcons.shoppingCart,
                      color: AppColors.primary),
                  onPressed: () {
                    // تفعيل السلة
                  },
                ),
              ),
            ],
          ),

          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.searchTextController,
                        onSubmitted: (_) => controller.search(),
                        cursorColor: AppColors.accent3, // ← لون المؤشر

                        decoration: InputDecoration(
                          hintText: 'ابحث عن مطعم أو متجر...',
                           hintStyle: const TextStyle(
                            color: AppColors.accent32 // ← لون hintText بنسبة شفافية 40%
                          ),
                          iconColor: AppColors.accent32,
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: AppColors.accent1,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 16,
                          ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.accent4, // لون الإطار العادي
                              width: 1,
                            ),
                          ),
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color:
                                  AppColors.accent3,
                              width: 1.5,
                            ),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (controller.isLoading)
                  const CircularProgressIndicator()
                else if (controller.searchResults.isEmpty)
                  const Text('لا توجد نتائج')
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.searchResults.length,
                      itemBuilder: (context, index) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const Icon(Icons.store),
                          title: Text(controller.searchResults[index]),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
