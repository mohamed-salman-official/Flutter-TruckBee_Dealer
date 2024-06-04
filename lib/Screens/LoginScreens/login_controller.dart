import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckbee_flut/ModelClasses/login_model.dart';

import '../../APIServices/network_provider.dart';
import '../../CommonWidgets/alert_dialog.dart';
import '../../CommonWidgets/gif_progress_loader.dart';
import '../../Navigations/route_config.dart';
import '../../SupportFiles/globals.dart' as globals;

class LogInController extends GetxController with WidgetsBindingObserver {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;
  RxBool isLoading = false.obs;

  Future<void> onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  viewLoader() {
    isLoading = true.obs;
    Get.dialog(gifLoadingOverlay());
  }

  dismissLoader() {
    if (isLoading.isTrue) {
      isLoading = false.obs;
      update();
      Get.back();
    }
  }

  loginAPICall(LogInModel modelData, BuildContext context) async {
    viewLoader();
    NetworkProvider().login(
      logInDetails: modelData,
      onSuccess: (success) async {
        dismissLoader();
        // TruckBee.saveStringValue(TruckBee.CUSTOMER_ID, "${success.user!.id!}");
        globals.customerId = success.user?.id!;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userRole', "${success.role}");
        prefs.setString('userId', success.user?.id);
        Get.toNamed(RouteName.NAVIGATION_CONTROLLER_ROUTE);
      },
      onError: (error) {
        dismissLoader();
        PxException exception = error;
        String message = exception.message;
        showAlert(context, message);
      },
    );
  }

  showAlert(BuildContext context, String message) {
    CustomAlert(context,
        titleText: TitleText(name: "OOPS", key: 'oops'),
        contentText: ContentText(name: message, key: 'key'),
        okButton: OKButton(
          name: "OK",
          sematics: 'ok',
          action: () {
            Get.back();
          },
          key: 'key',
        ),
        valKey: 'key');
  }
}
