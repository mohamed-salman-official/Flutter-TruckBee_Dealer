import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController with WidgetsBindingObserver {
  Future<void> onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }
}
