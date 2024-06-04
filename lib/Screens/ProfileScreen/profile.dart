import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Navigations/route_config.dart';
import '../../SupportFiles/asset_config.dart';
import '../../SupportFiles/colors.dart';
import '../../SupportFiles/sizeconfig.dart';
import 'profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  final ProfileController controller = Get.put(ProfileController());
  ProfileScreen({super.key});

  final List _profileTitle = [
    "Email ID",
    "Phone Number",
    "GSTIN Number",
    "No of Trucks",
    "No of Drivers",
    "Emergency Phone Number"
  ];
  final List _profileDes = [
    "johndoe@gmail.com",
    "+91 54545345343",
    "AVPV7667366367",
    "220",
    "20",
    "-"
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
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
                    height: SizeConfig.screenH! * 0.075,
                    width: SizeConfig.screenW,
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontFamily: POPPINS_MEDIUM,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    height: SizeConfig.screenH! * 0.175,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(LANDING_BANNER_IMAGE_1),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John Doe",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: POPPINS_MEDIUM),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "ARS Truck Service",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.64),
                                    fontSize: 18,
                                    fontFamily: POPPINS_REGULAR),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "DL6365436",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.64),
                                    fontSize: 18,
                                    fontFamily: POPPINS_REGULAR),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // height: SizeConfig.screenH! * 0.525,
                      width: SizeConfig.screenW,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                      ),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(
                            color: dividerColor.withOpacity(0.18),
                          ),
                        ),
                        itemCount: _profileTitle.length,
                        itemBuilder: (BuildContext context, int index) {
                          return profileListItems(
                            title: _profileTitle[index],
                            value: _profileDes[index],
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: SizeConfig.screenH! * 0.115,
                    width: SizeConfig.screenW,
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: secondaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          editProfileAction(context);
                        },
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: POPPINS_MEDIUM,
                              color: secondaryColor),
                        ),
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

  editProfileAction(BuildContext context) {
    Get.toNamed(RouteName.EDITPROFILE_ROUTE);
  }
}

class profileListItems extends StatelessWidget {
  final String title;
  final String value;

  const profileListItems({super.key, required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontFamily: POPPINS_REGULAR, fontSize: 14, color: primaryColor),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
                fontFamily: POPPINS_REGULAR, fontSize: 14, color: primaryColor),
          ),
        ],
      ),
    );
  }
}
