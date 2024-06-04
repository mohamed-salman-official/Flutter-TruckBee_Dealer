import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/ModelClasses/booking_cancelled_list_model.dart';
import 'package:truckbee_flut/ModelClasses/booking_confirmed_list_model.dart';
import 'package:truckbee_flut/ModelClasses/booking_waiting_list_model.dart';

import '../CommonWidgets/custom_widgets.dart';
import '../ModelClasses/booking_details_model.dart';
import '../ModelClasses/login_model.dart';
import '../SupportFiles/common_utils.dart';
import 'api_service.dart';

enum RefreshTokenTypes { accountInfo, userInfo }

String truckBeeBaseURL = "https://truckbee.hoffensoft.com:8810/api";

class NetworkProvider {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<void> login({
    required LogInModel logInDetails,
    Function()? beforeSend,
    Function(UserData data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    if (await check()) {
      NetworkRequest(
        apiUrl: ApiConstants.LOGIN_URL,
        requestBody: logInDetails.toJson(),
      ).post(
        beforeSend: () => {if (beforeSend != null) beforeSend()},
        onSuccess: (data) {
          Map<String, dynamic> value =
              json.decode(data.toString()) as Map<String, dynamic>;
          if (value["message"].toLowerCase().contains("success") &&
              value["error"] == false) {
            UserData userData = UserData.fromJson(value["results"]);
            onSuccess!(userData);
          } else {
            onError!(PxException(value['message']));
          }
        },
        onError: (error) {
          onError!(PxException(error.toString()));
        },
      );
    } else {
      onError!(PxException("No network connection available"));
      if (Get.isDialogOpen!) {
        Get.back();
      }
      showNetworkAlert(Get.context!);
    }
  }

  // Future<void> getBookingList({
  //   required String dealerId,
  //   Function()? beforeSend,
  //   Function(BookingDetailsModel data)? onSuccess,
  //   Function(dynamic error)? onError,
  // }) async {
  //   if (await check()) {
  //     NetworkRequest(apiUrl: ApiConstants.GET_BOOKING_LIST_URL + "$dealerId")
  //         .get(
  //       beforeSend: () => {if (beforeSend != null) beforeSend()},
  //       onSuccess: (data) {
  //         BookingDetailsModel messageResponse = BookingDetailsModel.fromJson(
  //             json.decode(data.toString()) as Map<String, dynamic>);
  //         onSuccess!(messageResponse);
  //       },
  //       onError: (error) {
  //         onError!(PxException(error.toString()));
  //       },
  //     );
  //   } else {
  //     onError!(PxException("No network connection available"));
  //     if (Get.isDialogOpen!) {
  //       Get.back();
  //     }
  //     showNetworkAlert(Get.context!);
  //   }
  // }

//get booking waiting list
  Future<void> getBookingWaitingList({
    required String? status,
    Function()? beforeSend,
    Function(BookingWaitingListModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    if (await check()) {
      NetworkRequest(
        apiUrl: ApiConstants.BOOKING_WAITING_URL + "${status}",
      ).get(
        beforeSend: () => {if (beforeSend != null) beforeSend()},
        onSuccess: (data) {
          print("onSuccess");
          BookingWaitingListModel messageResponse =
              BookingWaitingListModel.fromJson(
                  json.decode(data.toString()) as Map<String, dynamic>);
          onSuccess!(messageResponse);
        },
        onError: (error) {
          print("onError");
          onError!(PxException(error.toString()));
        },
      );
    } else {
      onError!(PxException("No network connection available"));
      if (Get.isDialogOpen!) {
        Get.back();
      }
      showNetworkAlert(Get.context!);
    }
  }

//get booking confirmed list
  Future<void> getBookingConfirmedList({
    required String? status,
    Function()? beforeSend,
    Function(BookingConfirmedListModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    if (await check()) {
      NetworkRequest(
        apiUrl: ApiConstants.BOOKING_WAITING_URL + "${status}",
      ).get(
        beforeSend: () => {if (beforeSend != null) beforeSend()},
        onSuccess: (data) {
          // print("onSuccess");
          BookingConfirmedListModel messageResponse =
              BookingConfirmedListModel.fromJson(
                  json.decode(data.toString()) as Map<String, dynamic>);
          onSuccess!(messageResponse);
        },
        onError: (error) {
          // print("onError");
          onError!(PxException(error.toString()));
        },
      );
    } else {
      onError!(PxException("No network connection available"));
      if (Get.isDialogOpen!) {
        Get.back();
      }
      showNetworkAlert(Get.context!);
    }
  }

//get dealer booking cancelled list
  Future<void> getBookingCancelledList({
    required String? status,
    Function()? beforeSend,
    Function(BookingCancelledListModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    if (await check()) {
      NetworkRequest(
        apiUrl: ApiConstants.BOOKING_WAITING_URL + "${status}",
      ).get(
        beforeSend: () => {if (beforeSend != null) beforeSend()},
        onSuccess: (data) {
          // print("onSuccess");
          BookingCancelledListModel messageResponse =
              BookingCancelledListModel.fromJson(
                  json.decode(data.toString()) as Map<String, dynamic>);
          onSuccess!(messageResponse);
        },
        onError: (error) {
          // print("onError");
          onError!(PxException(error.toString()));
        },
      );
    } else {
      onError!(PxException("No network connection available"));
      if (Get.isDialogOpen!) {
        Get.back();
      }
      showNetworkAlert(Get.context!);
    }
  }

  Future<void> getBookingDetailsByID({
    required String bookingID,
    Function()? beforeSend,
    Function(BookingDetailsResults data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    if (await check()) {
      NetworkRequest(
        apiUrl: "${ApiConstants.BOOKING_DETAILS_BY_ID_URL}$bookingID",
      ).get(
        beforeSend: () => {if (beforeSend != null) beforeSend()},
        onSuccess: (data) {
          Map<String, dynamic> value =
              json.decode(data.toString()) as Map<String, dynamic>;
          if (value["message"].toLowerCase().contains("success") &&
              value["error"] == false) {
            BookingDetailsResults bookingDetailsResult =
                BookingDetailsResults.fromJson(
                    value["results"] as Map<String, dynamic>);
            onSuccess!(bookingDetailsResult);
          } else {
            onError!(PxException(value['message']));
          }
        },
        onError: (error) {
          onError!(PxException(error.toString()));
        },
      );
    } else {
      onError!(PxException("No network connection available"));
      if (Get.isDialogOpen!) {
        Get.back();
      }
      showNetworkAlert(Get.context!);
    }
  }
}

class PxException implements Exception {
  String message;
  dynamic error;

  PxException(this.message, [this.error]);
}
