import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderly/controller/profile/address_controller.dart';
import 'package:orderly/core/them/app_colors.dart';
// import 'address_controller.dart'; // تأكد من استيراد الـ Controller

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddressController controller = Get.put(AddressController());

    return Directionality(
      textDirection:
          TextDirection.rtl, // <<< هنا جعلنا الاتجاه من اليمين لليسار
      child: Scaffold(
        backgroundColor: AppColors.accent1,
        appBar: AppBar(
          backgroundColor: AppColors.accent1,
          elevation: 0,
          title: const Text(
            'إدارة العناوين',
            style: TextStyle(
              color: AppColors.accent31,
            ),
            textAlign: TextAlign.right,
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Expanded(
                child: controller.addresses.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_off,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'لا توجد عناوين محفوظة',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: controller.addresses.length,
                        itemBuilder: (context, index) {
                          final address = controller.addresses[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1,
                              ),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              // عكس leading و trailing عشان النص على اليمين والاكون على اليسار
                              trailing: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: address.iconColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  address.icon,
                                  color: address.iconColor,
                                  size: 24,
                                ),
                              ),
                              title: Text(
                                address.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              subtitle: Text(
                                address.subtitle,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: AppColors.primary,
                                      size: 20,
                                    ),
                                    onPressed: () => _showEditDialog(
                                        context, controller, address),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColors.primary,
                                      size: 20,
                                    ),
                                    onPressed: () => _showDeleteDialog(
                                        context, controller, address.id),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => _showAddDialog(context, controller),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'إضافة عنوان جديد',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  // حوار إضافة عنوان جديد
  void _showAddDialog(BuildContext context, AddressController controller) {
    final titleController = TextEditingController();
    final subtitleController = TextEditingController();
    IconData selectedIcon = Icons.home;
    Color selectedColor = Colors.blue;

    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl, // اضبط اتجاه الحوار كذلك
        child: AlertDialog(
          title: const Text('إضافة عنوان جديد', textAlign: TextAlign.right),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'اسم العنوان',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: subtitleController,
                decoration: const InputDecoration(
                  labelText: 'تفاصيل العنوان',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    subtitleController.text.isNotEmpty) {
                  final newAddress = Address(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: titleController.text,
                    subtitle: subtitleController.text,
                    icon: selectedIcon,
                    iconColor: selectedColor,
                  );
                  controller.addAddress(newAddress);
                  Get.back();
                }
              },
              child: const Text('إضافة'),
            ),
          ],
        ),
      ),
    );
  }

  // حوار تعديل العنوان
  void _showEditDialog(
      BuildContext context, AddressController controller, Address address) {
    final titleController = TextEditingController(text: address.title);
    final subtitleController = TextEditingController(text: address.subtitle);

    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl, // اضبط اتجاه الحوار كذلك
        child: AlertDialog(
          title: const Text('تعديل العنوان', textAlign: TextAlign.right),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'اسم العنوان',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: subtitleController,
                decoration: const InputDecoration(
                  labelText: 'تفاصيل العنوان',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    subtitleController.text.isNotEmpty) {
                  final updatedAddress = Address(
                    id: address.id,
                    title: titleController.text,
                    subtitle: subtitleController.text,
                    icon: address.icon,
                    iconColor: address.iconColor,
                  );
                  controller.editAddress(address.id, updatedAddress);
                  Get.back();
                }
              },
              child: const Text('تحديث'),
            ),
          ],
        ),
      ),
    );
  }

  // حوار تأكيد الحذف
  void _showDeleteDialog(
      BuildContext context, AddressController controller, String addressId) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl, // اضبط اتجاه الحوار كذلك
        child: AlertDialog(
          title: const Text('تأكيد الحذف', textAlign: TextAlign.right),
          content: const Text(
            'هل أنت متأكد من حذف هذا العنوان؟',
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.deleteAddress(addressId);
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('حذف'),
            ),
          ],
        ),
      ),
    );
  }
}
