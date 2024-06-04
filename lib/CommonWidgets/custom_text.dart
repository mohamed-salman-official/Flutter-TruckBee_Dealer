import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final int? maxLine;
  final bool? softWrap;
  final String? semanticLbl;
  final TextAlign? alignment;
  final TextDirection? textDirection;
  final double? scaleFactor;
  final TextWidthBasis? widthBasis;
  final Color? textColor;
  final Color? bgColor;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final double? decorationThickness;
  final double? textSize;
  final String? textFamily;
  final FontWeight? textWeight;
  final FontStyle? textStyle;
  final double? textHeight;
  final TextLeadingDistribution? leadingDistribution;
  final double? textSpacing;
  final TextOverflow? textOverflow;
  final bool? isElevated;
  final double? wordSpacing;
  final String? keyText;
  final int? maxTextLength;

  CustomText(this.text,
      {Key? key,
      this.maxLine = 1,
      this.softWrap = false,
      this.semanticLbl = "",
      this.alignment = TextAlign.center,
      this.textDirection = TextDirection.ltr,
      this.scaleFactor,
      this.widthBasis,
      this.textColor = Colors.black,
      this.bgColor = Colors.transparent,
      this.textDecoration = TextDecoration.none,
      this.decorationColor = Colors.black,
      this.decorationThickness = 1.0,
      this.textSize = 14.0,
      this.textFamily = "Roboto",
      this.textWeight = FontWeight.normal,
      this.textStyle = FontStyle.normal,
      this.textHeight = 0.0,
      this.textSpacing = 1.0,
      this.leadingDistribution,
      this.textOverflow = TextOverflow.ellipsis,
      this.isElevated = false,
      this.wordSpacing,
      this.keyText = "",
      this.maxTextLength = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxTextLength! > 0
          ? (text!.length > maxTextLength!
              ? addEllipsis(text!.substring(0, (maxTextLength! - 2))).tr
              : text!.tr)
          : text!.tr,
      key: Key(keyText!),
      maxLines: maxLine,
      selectionColor: Colors.blue,
      softWrap: softWrap,
      semanticsLabel: semanticLbl,
      textAlign: alignment,
      textDirection: textDirection,
      textScaleFactor: scaleFactor,
      textWidthBasis: widthBasis,
      style: TextStyle(
        backgroundColor: bgColor,
        color: textColor,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
        fontSize: textSize,
        fontFamily: textFamily,
        fontWeight: textWeight,
        fontStyle: textStyle,
        height: textHeight,
        leadingDistribution: leadingDistribution,
        letterSpacing: textSpacing,
        locale: Locale('en_US'),
        overflow: textOverflow,
        shadows: isElevated!
            ? [
                BoxShadow(
                  color: textColor!.withOpacity(1),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                )
              ]
            : null,
        textBaseline: TextBaseline.ideographic,
        wordSpacing: wordSpacing,
      ),
    );
  }

  String addEllipsis(String value) {
    return "$value..";
  }
}
