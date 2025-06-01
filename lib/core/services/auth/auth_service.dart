import 'package:get/get.dart';
import 'package:orderly/core/classes/api_client.dart';
import 'package:orderly/core/classes/staterequest.dart';
import 'package:orderly/core/constant/App_link.dart';

class AuthService  {
  final ApiClient apiClient = ApiClient();

  Future<Staterequest> signup({
    required String name,
    required String phone,
    required String password,
    required String address,
  }) async {
    try {
      ApiResponse<dynamic> postResponse = await apiClient.postData(
        url: '$serverLink/auth/register',
        data: {
          'name': name.trim(),
          'phone': phone.trim(),
          'password': password.trim(),
          'type': 'CUSTOMER',
          'address': address.trim(),
        },
      );
      print('POST Response Data: ${postResponse.data}');
      if (postResponse.statusCode == 201 &&
          postResponse.data["state"] == "success") {
        Get.snackbar("تم", "تم إنشاء الحساب بنجاح");
        return Staterequest.success;
      } else {
        Get.snackbar("خطأ", postResponse.data["msg"] ?? "فشل التسجيل");
        return Staterequest.failure;
      }
    } catch (error) {
      print("Signup error: $error");
      Get.snackbar("خطأ", "حدث خطأ غير متوقع: $error");
      return Staterequest.failure;
    }
  }


  Future<Staterequest> loginUser({
    required String phone,
    required String password,
  }) async {
    try {
      ApiResponse<dynamic> postResponse = await apiClient.postData(
        url: '$serverLink/auth/login',
        data: {
          'phone': phone.trim(),
          'password': password.trim(),
        },
      );

      print('POST Response Data: ${postResponse.data}');
      if ((postResponse.statusCode == 200 || postResponse.statusCode == 201) &&
          postResponse.data["state"] == "success") {
        Get.snackbar("تم", "تم تسجيل الدخول بنجاح");
        return Staterequest.success;
      } else {
        Get.snackbar("خطأ", postResponse.data["msg"] ?? "فشل تسجيل الدخول");
        return Staterequest.failure;
      }
    } catch (error) {
      print("Login error: $error");
      Get.snackbar("خطأ", "حدث خطأ غير متوقع: $error");
      return Staterequest.failure;
    }
  }
  

  Future<Staterequest> forgotPassword({
    required String phone,
  }) async {
    try {
      final response = await apiClient.postData(
        url: '$serverLink/auth/forgot-password',
        data: {
          'phone': phone.trim(),
        },
      );

      print("Response: ${response.data}");

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data["state"] == "success") {
        Get.snackbar("تم", response.data["msg"] ?? "تم إرسال رمز التحقق");
        return Staterequest.success;
      } else {
        Get.snackbar("خطأ", response.data["msg"] ?? "فشل في إرسال الرمز");
        return Staterequest.failure;
      }
    } catch (e) {
      print("Forgot password error: $e");
      Get.snackbar("خطأ", "حدث خطأ غير متوقع: $e");
      return Staterequest.failure;
    }
  }
Future<Staterequest> resetPassword({
    required String phone,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final response = await apiClient.postData(
        url: '$serverLink/auth/reset-password',
        data: {
          "phone": phone.trim(),
          "otp": otp.trim(),
          "newPassword": newPassword.trim(),
        },
      );

      if (response.statusCode == 200 && response.data["state"] == "success") {
        return Staterequest.success;
      } else {
        Get.snackbar("خطأ", response.data["msg"] ?? "فشل التحقق من الرمز");
        return Staterequest.failure;
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء تغيير كلمة السر");
      return Staterequest.failure;
    }
  }

Future<Staterequest> getProfile() async {
    try {
      ApiResponse<dynamic> response = await apiClient.getData(
        url: '$serverLink/auth/profile',
      );

      print("GET Profile Response: ${response.data}");

      if (response.statusCode == 200 && response.data["state"] == "success") {
        // إذا حبيت ترجع البيانات نفسها بدل Staterequest، ممكن تعدل return type
        return Staterequest.success;
      } else {
        Get.snackbar("خطأ", response.data["msg"] ?? "فشل في جلب البيانات");
        return Staterequest.failure;
      }
    } catch (e) {
      print("Get profile error: $e");
      Get.snackbar("خطأ", "حدث خطأ أثناء جلب البيانات");
      return Staterequest.failure;
    }
  }

  Future<Staterequest> logout() async {
    try {
      ApiResponse<dynamic> response = await apiClient.postData(
        url: '$serverLink/auth/logout',
        data: {}, // إذا ما في داتا، بترسل جسم فاضي
      );

      print("Logout Response: ${response.data}");

      if (response.statusCode == 200 && response.data["state"] == "success") {
        Get.snackbar("تم", "تم تسجيل الخروج بنجاح");
        // احذف التوكن من التخزين المحلي هنا إن كنت تستخدمه
        return Staterequest.success;
      } else {
        Get.snackbar("خطأ", response.data["msg"] ?? "فشل تسجيل الخروج");
        return Staterequest.failure;
      }
    } catch (e) {
      print("Logout error: $e");
      Get.snackbar("خطأ", "حدث خطأ أثناء تسجيل الخروج");
      return Staterequest.failure;
    }
  }


}
