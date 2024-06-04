import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckbee_flut/Screens/ProfileScreen/edit_profile_controller.dart';

import '../../CommonWidgets/custom_text_field.dart';
import '../../SupportFiles/asset_config.dart';
import '../../SupportFiles/colors.dart';
import '../../SupportFiles/sizeconfig.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  final EditProfileController controller = Get.put(EditProfileController());
  EditProfileScreen({super.key});

  File? selectedImage;

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      this.selectedImage = imageTemp;
      controller.update();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      this.selectedImage = imageTemp;
      controller.update();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                spacing: 20,
                alignment: WrapAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("Profile Photo",
                        style:
                            TextStyle(fontFamily: POPPINS_BOLD, fontSize: 20)),
                  ),
                  ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        pickImageFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      pickImageFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

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
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          child: IconButton(
                              icon: ImageIcon(
                                AssetImage(BACK_ICON),
                              ),
                              iconSize: 50,
                              onPressed: () {
                                Get.back(); // And this!
                              }),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                                fontFamily: POPPINS_MEDIUM, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    color: lineColor,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: SizeConfig.screenH! * 0.225,
                            width: SizeConfig.screenW!,
                            color: Colors.white,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  child: CircleAvatar(
                                      radius: 75,
                                      backgroundImage: selectedImage != null
                                          ? Image.file(selectedImage!).image
                                          : Image.asset(LANDING_BANNER_IMAGE_1)
                                              .image),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: secondaryColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 5, color: Colors.white)),
                                    child: IconButton(
                                      icon: Icon(Icons.camera_alt),
                                      color: Colors.white,
                                      iconSize: 30,
                                      onPressed: () {
                                        _showPicker(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: SizeConfig.screenW,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                profileTextField(
                                  label: 'Name',
                                  isDOBField: true,
                                  placeHolder: 'Enter Name',
                                  isOtpField: false,
                                ),
                                profileTextField(
                                  label: 'Date Of Birth',
                                  isDOBField: true,
                                  placeHolder: 'Select DOB',
                                  isOtpField: false,
                                ),
                                profileTextField(
                                  label: 'Email ID',
                                  isDOBField: true,
                                  placeHolder: 'Enter Email ID',
                                  isOtpField: false,
                                ),
                                profileTextField(
                                  label: 'Mobile Number',
                                  isDOBField: true,
                                  placeHolder: 'Enter Mobile Number',
                                  isOtpField: false,
                                ),
                                profileTextField(
                                  label: 'Emergency Mobile Number',
                                  isDOBField: true,
                                  placeHolder: 'Enter Emergency Mobile Number',
                                  isOtpField: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: SizeConfig.screenH! * 0.1,
                    width: SizeConfig.screenW,
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: SizeConfig.screenW! / 2 - 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            onPressed: () {
                              cancelProfileAction(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: POPPINS_MEDIUM,
                                  color: secondaryColor),
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenW! / 2 - 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            onPressed: () {
                              saveProfileAction(context);
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: POPPINS_MEDIUM,
                                  color: secondaryColor),
                            ),
                          ),
                        ),
                      ],
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

  saveProfileAction(BuildContext context) {
    print("editProfileAction");
  }

  cancelProfileAction(BuildContext context) {
    print("cancelProfileAction");
  }
}

class profileTextField extends StatelessWidget {
  final String label;
  final bool isOtpField;
  final bool isDOBField;
  final String placeHolder;

  const profileTextField({
    super.key,
    required this.label,
    required this.isDOBField,
    required this.placeHolder,
    required this.isOtpField,
  });

  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: POPPINS_REGULAR,
            fontSize: 15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomTextField(
            backgroundColor: lineColor,
            isRquired: true,
            enabledBorderRadius: 10,
            focusedBorderRadius: 10,
            enabledBorderColor: Colors.transparent,
            focusedBorderColor: Colors.transparent,
            errorBorderColor: Colors.red,
            errorBorderRadius: 10,
            keyboard: TextInputType.emailAddress,
            hintText: placeHolder,
            hintColor: Colors.grey,
            keyboardAction: TextInputAction.next,
            maxLength: 60,
            maxLines: 1,
            changeEvent: (value) {
              controller.update();
            },
          ),
        ),
      ],
    );
  }
}
