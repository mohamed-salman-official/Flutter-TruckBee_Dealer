import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/Screens/InboxScreens/inbox_controller.dart';

import '../../SupportFiles/asset_config.dart';
import '../../SupportFiles/colors.dart';
import '../../SupportFiles/sizeconfig.dart';

class InboxScreen extends GetView<InboxController> {
  final InboxController controller = Get.put(InboxController());
  InboxScreen({super.key});

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
    return GetBuilder<InboxController>(
      init: InboxController(),
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
                        "Inbox",
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
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(
                            color: dividerColor.withOpacity(0.18),
                          ),
                        ),
                        itemCount: _inboxTitle.length,
                        itemBuilder: (BuildContext context, int index) {
                          return inboxListItems(
                            title: _inboxTitle[index],
                            value: _inboxDes[index],
                          );
                        },
                      ),
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

class inboxListItems extends StatelessWidget {
  final String title;
  final String value;

  const inboxListItems({super.key, required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: POPPINS_MEDIUM,
                      fontSize: 14,
                      color: primaryColor),
                ),
                Text(
                  value,
                  style: TextStyle(
                      fontFamily: POPPINS_REGULAR,
                      fontSize: 11,
                      color: primaryColor.withOpacity(0.65)),
                ),
              ],
            ),
          ),
          Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(LANDING_BANNER_IMAGE_1),
          ),
          SizedBox(width: 20),
          ImageIcon(
            AssetImage(RIGHT_ARROW_WHITE_ICON),
            color: Colors.black.withOpacity(0.4),
            size: 15,
          )
        ],
      ),
    );
  }
}
