import 'package:flutter/material.dart';
import 'package:truckbee_flut/SupportFiles/colors.dart';

import 'custom_text.dart';

class CustomAlert {
  final TitleText? titleText;
  final ContentText? contentText;
  final OKButton? okButton;
  final CancelButton? cancelButton;
  final String? valKey;

  CustomAlert(BuildContext context,
      {this.titleText,
      this.contentText,
      this.okButton,
      this.cancelButton,
      required this.valKey}) {
    AlertDialog alert = AlertDialog(
        key: ValueKey(valKey!),
        // backgroundColor:
        // Color(globals.background).withOpacity(globals.customPopupOpacity),
        title: Visibility(
          visible: titleText!.name!.isEmpty ? false : true,
          child: Text(titleText!.name!,
              key: ValueKey(titleText!.key!),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                // fontFamily: "${globals.primaryFont}",
              ),
              textAlign: TextAlign.center),
        ),
        content: Text(contentText!.name!,
            key: ValueKey(contentText!.key!),
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.0,
              // fontFamily: "${globals.secondaryFont}",
            ),
            textAlign: TextAlign.center),
        actions: [
          if (okButton != null)
            ElevatedButton(
                key: ValueKey(okButton!.key!),
                style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: okButton!.action,
                child: CustomText(okButton!.name!,
                    semanticLbl: okButton!.sematics!,
                    textColor: Colors.black,
                    textSize: 15.0,
                    textWeight: FontWeight.bold,
                    // textFamily: "${globals.primaryFont}",
                    alignment: TextAlign.center,
                    maxTextLength: 14)),
          if (cancelButton != null)
            ElevatedButton(
                key: ValueKey(cancelButton!.key!),
                style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: cancelButton!.action,
                child: CustomText(cancelButton!.name!,
                    semanticLbl: cancelButton!.name,
                    textColor: Colors.black,
                    textSize: 15.0,
                    textWeight: FontWeight.bold,
                    // textFamily: "${globals.primaryFont}",
                    alignment: TextAlign.center,
                    maxTextLength: 14))
        ],
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ));

    showDialog(
        // barrierColor: Color(globals.background).withOpacity(0.40),
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(child: alert, onWillPop: () async => false);
        });
  }
}

class TitleText {
  String? name;
  String? key;
  String? sematics;
  TitleText({this.name, required this.key, this.sematics});
}

class ContentText {
  String? name;
  String? key;
  String? sematics;
  ContentText({this.name, required this.key, this.sematics});
}

class OKButton {
  String? name;
  VoidCallback? action;
  String? key;
  String? sematics;
  OKButton({this.name, this.action, required this.key, this.sematics});
}

class CancelButton {
  String? name;
  VoidCallback? action;
  String? key;
  String? sematics;
  CancelButton({this.name, this.action, required this.key, this.sematics});
}
