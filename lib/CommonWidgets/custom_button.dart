import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? boxColor;
  final bool? isGradient;
  final List<Color> gradientColors;
  final double? borderRound;
  final Color? borderColor;
  final double? borderWidth;
  final BorderStyle? borderStyle;
  final double? strokeAlign;
  final bool? isElevated;
  final String? text;
  final ImageIcon? prefixIcon;
  final ImageIcon? suffixIcon;
  final MainAxisAlignment? textHorizontalAlignment;
  final CrossAxisAlignment? textVerticalAlignment;
  final MainAxisSize? buttonSize;
  final Color? textColor;
  final double? textSize;
  final String? textFamily;
  final FontStyle? textStyle;
  final FontWeight? textWeight;
  final TextDecoration? textLineDecoration;
  final double? textHeight;
  final VoidCallback? clickFunction;
  final double? minWidth;
  final String? semanticText;
  final String? keyText;

  CustomButton(
      { //Key? key,
      this.padding = const EdgeInsets.all(0.0),
      this.margin = const EdgeInsets.all(0.0),
      this.boxColor = Colors.blue,
      this.isGradient = false,
      this.gradientColors = const <Color>[Color(0xFFDEADAD), Color(0xFFFFFFF)],
      this.borderRound = 0,
      this.borderColor = Colors.blue,
      this.borderWidth = 0.5,
      this.borderStyle = BorderStyle.solid,
      this.strokeAlign = 0.0,
      this.isElevated = false,
      this.text = "button Name",
      this.prefixIcon,
      this.suffixIcon,
      this.textHorizontalAlignment = MainAxisAlignment.center,
      this.textVerticalAlignment = CrossAxisAlignment.center,
      this.buttonSize = MainAxisSize.min,
      this.textColor = Colors.black,
      this.textSize = 12.0,
      this.textFamily = "Roboto",
      this.textStyle = FontStyle.normal,
      this.textWeight = FontWeight.normal,
      this.textLineDecoration = TextDecoration.none,
      this.textHeight = 1.0,
      this.clickFunction,
      this.minWidth,
      this.keyText = "",
      this.semanticText});
  // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        constraints:
            minWidth != null ? BoxConstraints(minWidth: minWidth!) : null,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            color: boxColor,
            gradient: isGradient!
                ? LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: gradientColors,
                  )
                : null,
            border: Border.all(
                color: borderColor!,
                width: borderWidth!,
                style: borderStyle!,
                strokeAlign: strokeAlign!),
            borderRadius: BorderRadius.circular(borderRound!),
            boxShadow: isElevated!
                ? [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    )
                  ]
                : null),
        child: Row(
          mainAxisAlignment: textHorizontalAlignment!,
          mainAxisSize: buttonSize!,
          crossAxisAlignment: textVerticalAlignment!,
          children: [
            prefixIcon != null
                ? Padding(padding: EdgeInsets.all(5.0), child: prefixIcon!)
                : Container(),
            //Adding semanticslabel
            // JIRA Ticket: NEXT-146, Sprint-4. Modified by : Jaisriraman Balan
            Text(
              text!,
              key: Key(keyText!),
              semanticsLabel: semanticText,
              style: TextStyle(
                  color: textColor,
                  fontSize: textSize,
                  fontFamily: textFamily,
                  fontWeight: textWeight,
                  fontStyle: textStyle,
                  decoration: textLineDecoration,
                  height: textHeight),
            ),
            suffixIcon != null
                ? Padding(padding: EdgeInsets.all(5.0), child: suffixIcon!)
                : Container()
          ],
        ),
      ),
      onTap: clickFunction,
    );
  }
}
