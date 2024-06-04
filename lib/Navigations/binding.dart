import 'package:get/get.dart';
import 'package:truckbee_flut/Screens/Dashboard/dashboard_controller.dart';

import '../Screens/BookingDetailsScreen/booking_details_controller.dart';
import '../Screens/LoginScreens/login_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenBinding());
  }
}

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController());
  }
}

class DashBoardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
  }
}

class BookingDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingDetailsController());
  }
}
