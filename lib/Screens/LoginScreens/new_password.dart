import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/Screens/LoginScreens/login.dart';

import '../../SupportFiles/asset_config.dart';
import '../../SupportFiles/colors.dart';
import '../../SupportFiles/sizeconfig.dart';
import '../../SupportFiles/string_files.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;
  }

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
                height: SizeConfig.screenH! * 0.15,
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
                scrollDirection: Axis.vertical,
                child: Container(
                  width: SizeConfig.screenW!,
                  height: SizeConfig.screenH! * 0.81,
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
                            NEW_PASSWORD_SCREEN_LOGO,
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
                              newPasswordTitle,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            height: SizeConfig.screenH! * 0.12,
                            width: SizeConfig.screenW,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: passwordVisible,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: lineColor,
                                  filled: true,
                                  hintText: enterNewPasswordHint,
                                  suffixIconConstraints:
                                      BoxConstraints(maxWidth: 45),
                                  suffixIcon: IconButton(
                                    padding: EdgeInsets.only(right: 20),
                                    icon: Image.asset(passwordVisible
                                        ? OPENED_EYE_ICON
                                        : CLOSED_EYE_ICON),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.screenH! * 0.12,
                            width: SizeConfig.screenW,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: lineColor,
                                  filled: true,
                                  hintText: enterConfirmPasswordHint,
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.screenH! * 0.15,
                            width: SizeConfig.screenW,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              child: TextButton(
                                child: Text(
                                  newPasswordLoginButton,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: secondaryColor),
                                onPressed: () =>
                                    Get.offAll(() => LoginScreen()),
                              ),
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
    );
  }
}
