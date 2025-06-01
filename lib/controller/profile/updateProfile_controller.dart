import 'package:get/get.dart';


abstract class UpdateprofileController extends GetxController {
  saveProfile();
}

class UpdateprofileControllerimp extends UpdateprofileController {


  String name = '';
  String phone = '';
  String address = '';
  bool isLoading = false;


  // تحديث قيم الحقول
  void updateName(String value) {
    name = value;
    update();
  }

  void updatePhone(String value) {
    phone = value;
    update();
  }

  void updateAddress(String value) {
    address = value;
    update();
  }

@override
  Future<void> saveProfile() async {
    isLoading = true;
    update();
    try {
      // هنا يمكنك إضافة منطق حفظ البيانات إلى API
      print('تم حفظ: $name, $phone, $address');
      Get.snackbar('نجاح', 'تم تحديث الملف الشخصي بنجاح');
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء حفظ البيانات');
    } finally {
      isLoading = false;
      update();
    }
  }

  
  @override
  void onInit() {
    super.onInit();
    // جلب البيانات الأولية (مثال)
    name = 'اسم المستخدم';
    phone = '1234567890';
    address = 'عنوان المستخدم';
    update(); // تحديث الواجهة عند التهيئة
  }

  // دالة للتحقق من صحة الحقول
  // bool validateFields() {
  //   if (name.isEmpty) {
  //     Get.snackbar('خطأ', 'الرجاء إدخال الاسم');
  //     return false;
  //   }
  //   if (phone.isEmpty) {
  //     Get.snackbar('خطأ', 'الرجاء إدخال رقم الهاتف');
  //     return false;
  //   }
  //   if (address.isEmpty) {
  //     Get.snackbar('خطأ', 'الرجاء إدخال العنوان');
  //     return false;
  //   }
  //   return true;
  // }
}
