import 'dart:convert';

import 'package:get/get.dart';
import 'package:truckbee_flut/Navigations/route_config.dart';
import 'package:truckbee_flut/SupportFiles/preference_manager.dart';

import '../../SupportFiles/globals.dart' as globals;
import '../ModelClasses/token_info.dart';

class ApiConstants {
  static const BASE_URL = 'https://truckbee.hoffensoft.com:8810/';
  // static String API_VERSION = '${globals.apiVersion}/';

  //Truckbee
  static String LOGIN_URL = '${BASE_URL}api/auth/login';
  static String GET_BOOKING_LIST_URL = '${BASE_URL}api/dealer/booking/';
  static String BOOKING_WAITING_URL = '${BASE_URL}api/booking/status/';
  static String BOOKING_DETAILS_BY_ID_URL = '${BASE_URL}api/booking/detail/';

  // static String GET_GARAGE_VEHICLE_LIST_URL = '${API_URL}api/customer/all/';
  // static String DEALER_TRUCK_LIST_URL = '${API_URL}api/truck/dealer/';
  // static String DEALER_DRIVER_LIST_URL = '${API_URL}api/driver/dealer/';
  // static String DRIVER_CURRENT_RIDE_URL = '${API_URL}api/booking/detail/';
  // static String BOOKING_DETAILS_BY_ID_URL = '${API_URL}api/booking/detail/';
}

class Session {
  static const _sessionInfo = 'session_info';

  setSession(TokenInfo tokenInfo) {
    SharedPreferenceUtils.setString(_sessionInfo, json.encode(tokenInfo));
  }

  Future clearSession() async {
    await setSession(TokenInfo());
  }

  TokenInfo getSession() {
    if (SharedPreferenceUtils.getString(_sessionInfo)!.isEmpty) {
      return TokenInfo();
    } else {
      return TokenInfo.fromJson(
          json.decode(SharedPreferenceUtils.getString(_sessionInfo)!));
    }
  }

  UserInfo getUserSession() {
    if (SharedPreferenceUtils.getString('userRole')!.isEmpty) {
      return UserInfo();
    } else {
      globals.customerId = SharedPreferenceUtils.getString('userId') ?? "";
      return UserInfo(
          userRole: SharedPreferenceUtils.getString('userRole')!,
          userId: SharedPreferenceUtils.getString('userId')!);
    }
  }

  logout() {
    SharedPreferenceUtils.reset();
    globals.customerId = "";
    Get.offAllNamed(RouteName.LOGIN_ROUTE);
  }
}
