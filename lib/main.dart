import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/Navigations/route_config.dart';

import 'ModelClasses/token_info.dart';
import 'SupportFiles/common_utils.dart';
import 'SupportFiles/preference_manager.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Get.putAsync(() => SharedPreferenceUtils.init());
  runApp(truckBee());
  FlutterNativeSplash.remove();
}

class truckBee extends StatelessWidget {
  const truckBee({super.key});

  String getRouteName(String role) {
    if (role == "1") {
      return RouteName.NAVIGATION_CONTROLLER_ROUTE;
    } else {
      return RouteName.LOGIN_ROUTE;
    }
  }

  @override
  Widget build(BuildContext context) {
    UserInfo userInfo = Session().getUserSession();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Truck Bee",
      initialRoute: getRouteName(userInfo.userRole ?? ""),
      getPages: RouteCollection.routeCollections,
      defaultTransition: Transition.rightToLeft,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
