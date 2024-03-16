import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/authentication/login/ui/loginScreen.dart';
import 'package:hello_dish_driver/screens/home/dashboard_screen.dart';
import 'package:hello_dish_driver/utils/shared_pref..dart';

class SplashController extends GetxController {
  int? userId = 0;

  @override
  void onInit() {
    SharedPref.shared.getPref();
    var isLoggedIn = SharedPref.shared.pref?.getInt(PrefKeys.isLoggedIn);

    Future.delayed(const Duration(seconds: 3), () {
      if (isLoggedIn == 1) {
        Get.offAll(const DashboardScreen());
      } else {
        Get.offAll(const LoginScreen());
      }
    });

    super.onInit();
  }
}
