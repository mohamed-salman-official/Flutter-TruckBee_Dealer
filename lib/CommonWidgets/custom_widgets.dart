import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'alert_dialog.dart';

class iOSDatePicker extends StatelessWidget {
  const iOSDatePicker({super.key});

  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'iOSDatePicker';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}

//---------Network Alert dialog : START ----------
showNetworkAlert(BuildContext context) async {
  /*await Future.delayed(const Duration(milliseconds: 50), () {
    Navigator.of(Get.overlayContext!).pop();
  });*/
  CustomAlert(
    context,
    titleText: TitleText(
        name: "globals.alertNoInternetTitleText.tr",
        sematics: "",
        key: 'forgot_title_text'),
    contentText: ContentText(
        name: "globals.alertNoInternetContentText.tr",
        sematics: "",
        key: 'forgot_description_text'),
    okButton: OKButton(
        name: "globals.alertOkButtonText.tr",
        sematics: "",
        action: () {
          Get.back();
        },
        key: 'forgot_alert_ok_btn'),
    valKey: 'forgot_alert',
  );
}
//---------Network Alert dialog : END ----------
