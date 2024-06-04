import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/Navigations/route_config.dart';
import 'package:truckbee_flut/SupportFiles/asset_config.dart';
import 'package:truckbee_flut/SupportFiles/colors.dart';

import '../../SupportFiles/sizeconfig.dart';
import '../../SupportFiles/string_files.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.screenH! * 0.10,
                width: SizeConfig.screenW,
                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    icon: Image.asset(BACK_ICON),
                    onPressed: () => Get.back(),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: SizeConfig.screenH! * 0.8,
                  width: SizeConfig.screenW,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.screenH! * 0.2,
                        width: SizeConfig.screenW,
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Image.asset(
                            OTP_SCREEN_LOGO,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: SizeConfig.screenH! * 0.1,
                            width: SizeConfig.screenW,
                            alignment: Alignment.center,
                            child: Text(
                              verificationCodeTitle,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            height: SizeConfig.screenH! * 0.05,
                            width: SizeConfig.screenW,
                            alignment: Alignment.center,
                            child: Text(
                              yourEmailDescription,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: SizeConfig.screenH! * 0.04,
                            width: SizeConfig.screenW,
                            alignment: Alignment.center,
                            child: Text(
                              yourEmailText,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            child: Text(
              "Next",
              style: TextStyle(fontSize: 20),
            ),
          ),
          onPressed: () => Get.toNamed(RouteName.NEW_PASSWORD_ROUTE)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
