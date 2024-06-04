import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../SupportFiles/asset_config.dart';
import '../../SupportFiles/colors.dart';
import '../../SupportFiles/sizeconfig.dart';
import 'health_insurance_controller.dart';

class HealthInsuranceScreen extends GetView<HealthInsuranceController> {
  final HealthInsuranceController controller =
      Get.put(HealthInsuranceController());
  HealthInsuranceScreen({super.key});

  final List _inboxTitle = [
    "Support Executive",
    "Govintha Samy",
    "Siva Bahrathi",
    "Saravana Kumar"
  ];
  final List _inboxDes = [
    "Help us to improve Bookings",
    "Customer",
    "Customer",
    "Customer"
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthInsuranceController>(
      init: HealthInsuranceController(),
      builder: (controller) {
        SizeConfig().init(context);
        return Scaffold(
          body: Container(
            width: SizeConfig.screenW,
            height: SizeConfig.screenH,
            color: primaryColor,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    height: SizeConfig.screenH! * 0.1,
                    width: SizeConfig.screenW,
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      child: Text(
                        "Bookings",
                        style:
                            TextStyle(fontFamily: POPPINS_MEDIUM, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: lineColor,
                  ),
                  Expanded(
                    child: Container(
                      // height: SizeConfig.screenH! * 0.525,
                      width: SizeConfig.screenW,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      color: Colors.white,
                      // child: ListView.separated(
                      //   separatorBuilder: (context, index) => Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 15),
                      //     child: Divider(
                      //       color: dividerColor.withOpacity(0.18),
                      //     ),
                      //   ),
                      //   itemCount: _inboxTitle.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return inboxListItems(
                      //       title: _inboxTitle[index],
                      //       value: _inboxDes[index],
                      //     );
                      //   },
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
