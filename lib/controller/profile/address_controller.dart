import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;

  Address({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
  });
}

class AddressController extends GetxController {
  // قائمة العناوين
  final RxList<Address> addresses = <Address>[].obs;

  // متغير للتحكم في حالة التحميل
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadAddresses();
  }

  // تحميل العناوين (يمكن أن تكون من API أو قاعدة البيانات)
  void loadAddresses() {
    isLoading.value = true;

    // محاكاة بيانات العناوين
    addresses.addAll([
      Address(
        id: '1',
        title: 'المنزل',
        subtitle: 'حلب، حي جديدة شمالي',
        icon: Icons.home,
        iconColor: Colors.blue,
      ),
      Address(
        id: '2',
        title: 'العمل',
        subtitle: 'حلب، حي جديدة شمالي',
        icon: Icons.work,
        iconColor: Colors.purple,
      ),
    ]);

    isLoading.value = false;
  }

  // إضافة عنوان جديد
  void addAddress(Address address) {
    addresses.add(address);
    Get.snackbar(
      'تم بنجاح',
      'تم إضافة العنوان الجديد',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // تعديل عنوان
  void editAddress(String id, Address updatedAddress) {
    final index = addresses.indexWhere((address) => address.id == id);
    if (index != -1) {
      addresses[index] = updatedAddress;
      Get.snackbar(
        'تم بنجاح',
        'تم تعديل العنوان',
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // حذف عنوان
  void deleteAddress(String id) {
    addresses.removeWhere((address) => address.id == id);
    Get.snackbar(
      'تم الحذف',
      'تم حذف العنوان بنجاح',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // الحصول على عنوان بواسطة ID
  Address? getAddressById(String id) {
    try {
      return addresses.firstWhere((address) => address.id == id);
    } catch (e) {
      return null;
    }
  }

  // تنظيف الموارد
  @override
  void onClose() {
    addresses.clear();
    super.onClose();
  }
}
