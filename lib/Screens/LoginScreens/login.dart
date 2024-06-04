import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckbee_flut/ModelClasses/login_model.dart';
import 'package:truckbee_flut/Navigations/route_config.dart';
import 'package:truckbee_flut/Screens/LoginScreens/login_controller.dart';
import 'package:truckbee_flut/SupportFiles/asset_config.dart';
import 'package:truckbee_flut/SupportFiles/colors.dart';

import '../../CommonWidgets/custom_text_field.dart';
import '../../SupportFiles/sizeconfig.dart';
import '../../SupportFiles/string_files.dart';

class LoginScreen extends GetView<LogInController> {
  final LogInController controller = Get.put(LogInController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      init: LogInController(),
      builder: (controller) {
        SizeConfig().init(context);
        return Scaffold(
          body: Container(
            width: SizeConfig.screenW,
            height: SizeConfig.screenH,
            color: primaryColor,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SafeArea(
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
                            loginWelcome,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            loginDescription,
                            style: TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.53)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: (SizeConfig.screenH! * 0.41),
                      width: (SizeConfig.screenW!),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextField(
                              textEditingController: controller.emailController,
                              isRquired: true,
                              outlineBorderRadius: 10,
                              enabledBorderRadius: 10,
                              focusedBorderRadius: 10,
                              errorBorderColor: secondaryColor,
                              errorBorderRadius: 10,
                              keyboard: TextInputType.emailAddress,
                              hintText: enterEmailHint,
                              hintColor: Colors.grey,
                              keyboardAction: TextInputAction.next,
                              maxLength: 60,
                              maxLines: 1,
                              changeEvent: (value) {
                                controller.update();
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextField(
                              isRquired: true,
                              textEditingController:
                                  controller.passwordController,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              contentPadding: const EdgeInsets.only(
                                  left: 10.0,
                                  bottom: 0.0,
                                  top: 0.0,
                                  right: 10.0),
                              outlineBorderRadius: 10,
                              enabledBorderRadius: 10,
                              focusedBorderRadius: 10,
                              errorBorderColor: secondaryColor,
                              errorBorderRadius: 10,
                              keyboard: TextInputType.visiblePassword,
                              hintText: enterPasswordHint,
                              hintColor: Colors.grey,
                              keyboardAction: TextInputAction.done,
                              isProtected: controller.passwordVisible,
                              maxLines: 1,
                              maxLength: 50,
                              suffixIcon: IconButton(
                                key: ValueKey("password_show_hide_icon"),
                                icon: Icon(
                                  controller.passwordVisible == true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  controller.passwordVisible =
                                      !controller.passwordVisible;
                                  controller.update();
                                },
                              ),
                              changeEvent: (value) {
                                controller.update();
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: (double.infinity),
                            height: 50,
                            child: ElevatedButton(
                                child: Text(
                                  loginButton,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: secondaryColor),
                                onPressed: () {
                                  loginAction(context);
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: (SizeConfig.screenH! * 0.1),
                      width: (SizeConfig.screenW!),
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                          child: Text(
                            forgetPasswordButton,
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.grey,
                                color: Colors.grey),
                          ),
                          onPressed: () =>
                              Get.toNamed(RouteName.FORGOT_PASSWORD_ROUTE)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  loginAction(BuildContext context) {
    if (controller.emailController.text.isNotEmpty &&
        controller.passwordController.text.isNotEmpty) {
      LogInModel modelData = LogInModel(
          email: controller.emailController.text,
          password: controller.passwordController.text);
      controller.loginAPICall(modelData, context);
    } else {
      controller.showAlert(context, "Email & Password fields are required");
    }
  }
}
