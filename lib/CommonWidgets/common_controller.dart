import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../SupportFiles/asset_config.dart';
import 'alert_dialog.dart';
import 'custom_container.dart';

class CommonController {
  //To validate the password
  bool validateString(
      TextEditingController controller1, TextEditingController controller2) {
    if ((controller1.text.isEmpty || controller2.text.isEmpty) ||
        (controller1.text.isNotEmpty &&
            controller2.text.isNotEmpty &&
            controller2.text == controller1.text)) {
      return true;
    } else {
      return false;
    }
  }

  showAlert(BuildContext context, String message, [String title = "Alert!!"]) {
    CustomAlert(context,
        titleText: TitleText(name: title, key: 'oops'),
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

  Widget logOutWidget(BuildContext context, int iconColor) {
    return CustomContainer(
      padding: const EdgeInsets.all(4),
      childWidget: CustomContainer(
        childWidget: Visibility(
          child: Transform.scale(
            scale: 1.25,
            child: IconButton(
              icon: Image.asset(
                NOTIFICATION_ICON,
                color: Colors.white,
              ),
              color: Colors.white,
              onPressed: () {
                CustomAlert(context,
                    titleText: TitleText(
                        name: "", sematics: "", key: 'logout_alert_title_text'),
                    contentText: ContentText(
                        name: "Are you sure you want to logout?",
                        sematics: "",
                        key: 'logout_alert_description_text'),
                    okButton: OKButton(
                        name: "YES",
                        action: () async {
                          // Session().logout();
                        },
                        sematics: "YES",
                        key: 'logout_yes_alert_btn'),
                    cancelButton: CancelButton(
                        name: "NO",
                        action: () {
                          Get.back();
                        },
                        sematics: "NO",
                        key: 'logout_no_alert_btn'),
                    valKey: 'logout_alert');
              },
            ),
          ),
        ),
      ),
    );
  }
}
