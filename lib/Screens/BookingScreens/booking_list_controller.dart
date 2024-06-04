import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:truckbee_flut/ModelClasses/booking_cancelled_list_model.dart';
import 'package:truckbee_flut/ModelClasses/booking_confirmed_list_model.dart';

import '../../APIServices/network_provider.dart';
import '../../CommonWidgets/gif_progress_loader.dart';
import '../../ModelClasses/booking_waiting_list_model.dart';
import '../../SupportFiles/globals.dart' as globals;

class BookingListController extends GetxController with WidgetsBindingObserver {
  List<BookingWaitingListResults> waitingList = <BookingWaitingListResults>[];
  List<BookingConfirmedListResults> confirmedList =
      <BookingConfirmedListResults>[];
  List<BookingCancelledListResults> cancelledList =
      <BookingCancelledListResults>[];

  RxBool isLoading = false.obs;
  Future<void> onInit() async {
    super.onInit();
    getBookingWaitingList();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onReady() {
    enableLoader();
  }

  getBookingWaitingList() {
    // enableLoader();
    NetworkProvider().getBookingWaitingList(
        status: '${globals.customerId}/waiting',
        onSuccess: (data) async {
          waitingList.clear();
          if (data.results != null && data.results!.isNotEmpty) {
            print(data.results.toString());
            waitingList = data.results!;
          }
          getBookingConfirmedList();
          update();
        },
        onError: (error) {
          dismissLoader();
          update();
        });
  }

  getBookingConfirmedList() {
    // enableLoader();
    NetworkProvider().getBookingConfirmedList(
        status: '${globals.customerId}/confirmed',
        onSuccess: (data) async {
          confirmedList.clear();
          if (data.results != null && data.results!.isNotEmpty) {
            confirmedList = data.results!;
          }
          dismissLoader();
          update();
        },
        onError: (error) {
          dismissLoader();
          update();
        });
  }

  getBookingCancelledList() {
    // enableLoader();
    NetworkProvider().getBookingCancelledList(
        status: '${globals.customerId}/cancelled',
        onSuccess: (data) async {
          cancelledList.clear();
          if (data.results != null && data.results!.isNotEmpty) {
            cancelledList = data.results!;
          }
          dismissLoader();
          update();
        },
        onError: (error) {
          dismissLoader();
          update();
        });
  }

  String convertBookingDateFormat(
      String? inputDateType, String? outputDateType, String? dateString) {
    var convertedDate = dateString?.split('T');
    DateTime parseDate = DateFormat(inputDateType).parse(convertedDate![0]);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat(outputDateType);
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }

  enableLoader() {
    isLoading = true.obs;
    Get.dialog(gifLoadingOverlay());
  }

  dismissLoader() {
    if (isLoading.value) {
      isLoading = false.obs;
      Get.back();
    }
  }
}
