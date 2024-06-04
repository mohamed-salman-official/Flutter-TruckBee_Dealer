import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/SupportFiles/asset_config.dart';
import 'package:truckbee_flut/SupportFiles/colors.dart';

import '../../SupportFiles/sizeconfig.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: primaryColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 25),
                              child: Image.asset(
                                MEMBERSHIP_SIDE_LOGO,
                                height: 25,
                                width: SizeConfig.screenW! / 3,
                              ),
                            ),
                            Container(
                              height: SizeConfig.screenH! * 0.18,
                              width: SizeConfig.screenW! / 3,
                              padding: EdgeInsets.all(15),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: lineColor,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Image.asset(
                                  MEMBERSHIP_LOGO,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 25),
                              child: Image.asset(
                                MEMBERSHIP_SIDE_LOGO,
                                height: 25,
                                width: SizeConfig.screenW! / 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Container(
                          color: Colors.white,
                          width: SizeConfig.screenW,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "Activate Dealer Pro",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: POPPINS_MEDIUM,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Access all features of dealer, personal chat with driver , customer and customize booking.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, fontFamily: POPPINS_REGULAR),
                              ),
                              SizedBox(height: 20),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: SizeConfig.screenW,
                                    color: lineColor,
                                    height: 2,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: SizeConfig.screenW! / 3,
                                    height: 30,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      gradient: LinearGradient(
                                        begin: AlignmentDirectional.centerStart,
                                        end: Alignment.centerRight,
                                        colors: [redLenearStart, redLenearEnd],
                                      ),
                                    ),
                                    child: Text(
                                      "ONE TIME OFFER",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: POPPINS_REGULAR,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                "If you choose dealer pro membership you will get 50% discount",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, fontFamily: POPPINS_REGULAR),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: SizeConfig.screenW!,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      backgroundColor: lineColor),
                                  child: Text(
                                    "₹ 399/6 Months (₹ 99/ Month)",
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: SizeConfig.screenW!,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      backgroundColor: lineColor),
                                  child: Text(
                                    "₹ 999/12 Months (₹ 79/ Month)",
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                color: Colors.white,
                                width: SizeConfig.screenW,
                                alignment: AlignmentDirectional.centerStart,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 65,
                                      height: 50,
                                      child: FlutterImageStack(
                                        imageSource: ImageSource.asset,
                                        imageList: [
                                          LANDING_BANNER_IMAGE_1,
                                          LANDING_BANNER_IMAGE_2,
                                          LANDING_BANNER_IMAGE_3,
                                        ],
                                        totalCount: 3,
                                        itemRadius:
                                            100, // Radius of each images
                                        itemCount:
                                            3, // Maximum number of images to be shown in stack
                                        itemBorderWidth:
                                            3, // Border width around the images
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        "150+ users used this transport",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: POPPINS_REGULAR,
                                            color: primaryColor),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 2.5,
                                          left: 7.5,
                                          right: 7.5,
                                          bottom: 2.5),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Container(
                                        child: Text(
                                          "4.8",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: POPPINS_REGULAR,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: SizeConfig.screenW!,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      backgroundColor: secondaryColor),
                                  child: Text(
                                    "Activate Now",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              // SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
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
