import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../APIServices/network_provider.dart';
import '../../CommonWidgets/gif_progress_loader.dart';
import '../../ModelClasses/booking_details_model.dart';

class BookingDetailsController extends GetxController
    with WidgetsBindingObserver {
  BookingDetailsResults bookingDetailsData = BookingDetailsResults();
  List<bool> expandableArray = [true, false, false, false];
  //bool isLoading = true;
  bool isApiLoaded = false;
  RxBool isLoading = false.obs;

  String? bookingID = "";
  bool? isButtonEnable = false;

  Future<void> onInit() async {
    super.onInit();
    bookingID = Get.arguments[0] ?? "";
    isButtonEnable = Get.arguments[1] ?? false;

    bookingDetailsAPICall();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onReady() {
    enableLoader();
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

  openDialPad(String phoneNumber) async {
    Uri url = Uri(scheme: "tel", path: phoneNumber);
    print(url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  sendMessage(BuildContext context, String phoneNumber) async {
    try {
      if (Platform.isAndroid) {
        String uri = 'sms:$phoneNumber';
        await launchUrl(Uri.parse(uri));
      } else if (Platform.isIOS) {
        String uri = 'sms:$phoneNumber';
        await launchUrl(Uri.parse(uri));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Some error occurred. Please try again!'),
        ),
      );
    }
  }

  String convertStringDateToDifferentFormat(
      String? inputDateType, String? outputDateType, String? dateString) {
    DateTime parseDate = DateFormat(inputDateType).parse(dateString!);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat(outputDateType);
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  bookingDetailsAPICall() {
    NetworkProvider().getBookingDetailsByID(
        bookingID: bookingID ?? "",
        onSuccess: (data) {
          bookingDetailsData = data;
          isApiLoaded = true;
          dismissLoader();
          update();
        },
        onError: (error) {
          isApiLoaded = true;
          dismissLoader();
          update();
        });
  }
}
