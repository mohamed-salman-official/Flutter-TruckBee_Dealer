// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthInsuranceController extends GetxController
    with WidgetsBindingObserver {
  Future<void> onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }
}
