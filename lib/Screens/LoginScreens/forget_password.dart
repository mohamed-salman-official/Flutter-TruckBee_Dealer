import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/SupportFiles/asset_config.dart';

import '../../Navigations/route_config.dart';
import '../../SupportFiles/colors.dart';
import '../../SupportFiles/sizeconfig.dart';
import '../../SupportFiles/string_files.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: SizeConfig.screenW,
        height: SizeConfig.screenH,
        color: primaryColor,
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  height: (SizeConfig.screenH! * 0.45),
                  width: (SizeConfig.screenW!),
                  child: Column(
                    children: [
                      Image.asset(
                        LOGO,
                        height: 100,
                        width: SizeConfig.screenW! / 2,
                      ),
                      SizedBox(height: 20),
                      Text(
                        forgetPasswordTitle,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        forgetPasswordDescription,
                        style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.53)),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: (SizeConfig.screenH! * 0.5),
                  width: (SizeConfig.screenW!),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: enterEmailHint,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: (double.infinity),
                        height: 50,
                        child: ElevatedButton(
                          child: Text(
                            sendOTPButton,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor,
                          ),
                          onPressed: () =>
                              Get.toNamed(RouteName.OTP_VERIFICATION_ROUTE),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: TextButton(
                          child: Text(
                            backToLoginButton,
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                color: Colors.white.withOpacity(0.8)),
                          ),
                          onPressed: () => Get.back(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
