import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../SupportFiles/asset_config.dart';
import '../../SupportFiles/colors.dart';
import '../../SupportFiles/sizeconfig.dart';

class NewMemberShipScreen extends StatefulWidget {
  const NewMemberShipScreen({super.key});

  @override
  State<NewMemberShipScreen> createState() => _NewMemberShipScreenState();
}

class _NewMemberShipScreenState extends State<NewMemberShipScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        width: SizeConfig.screenW,
        height: SizeConfig.screenH,
        color: primaryColor,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: SizeConfig.screenH! * 0.1,
                width: SizeConfig.screenW,
                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: IconButton(
                        icon: Image.asset(BACK_ICON_BLUE),
                        onPressed: () => Get.back(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Membership",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: POPPINS_MEDIUM,
                            color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.grey,
                    height: 500,
                    child: Text("Check"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
