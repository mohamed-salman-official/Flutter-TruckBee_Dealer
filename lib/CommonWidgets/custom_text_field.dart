import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truckbee_flut/SupportFiles/asset_config.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final bool? enabled;
  final bool? autoCorrect;
  final bool? autoFocus;
  final Color? backgroundColor;
  final TextEditingController? textEditingController;
  final double? cursorHeight;
  final Color? cursorColor;
  final double? cursorRadius;
  final double? cursorWidth;
  final Color? textColor;
  final double? textSize;
  final String? textFamily;
  final FontStyle? textStyle;
  final FontWeight? textWeight;
  final TextDecoration? textLineDecoration;
  final double? textHeight;
  final String? hintText;
  final double? outlineBorderWidth;
  final Color? outlineBorderColor;
  final double? outlineBorderRadius;
  final double? enabledBorderWidth;
  final Color? enabledBorderColor;
  final double? enabledBorderRadius;
  final double? focusedBorderWidth;
  final Color? focusedBorderColor;
  final double? focusedBorderRadius;
  final double? disabledBorderWidth;
  final Color? disabledBorderColor;
  final double? disabledBorderRadius;
  final double? errorBorderWidth;
  final Color? errorBorderColor;
  final double? errorBorderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final dynamic? maxLines;
  final int? minLines;
  final bool? isProtected;

  // final String? obscuringText;
  final ValueChanged<String>? changeEvent;
  final VoidCallback? doneEvent;
  final ValueChanged<String>? submitEvent;
  final GestureTapCallback? tapEvent;
  final ValueChanged<String?>? savedEvent;
  final TapRegionCallback? tapOutsideEvent;
  final int? maxLength;
  final int? minLength;
  final TextInputType keyboard;
  final TextInputAction keyboardAction;
  final bool? isRquired;
  final String? errorType;
  final IconButton? suffixIcon;
  final IconButton? prefixIcon;
  final AutovalidateMode? autoValidateMode;
  final FormFieldValidator<String>? validatorFunction;
  final String? semanticText;
  final Color? hintColor;
  final String? initialValue;

  CustomTextField(
      {Key? key,
      this.focusNode,
      this.hintColor,
      this.enabled = true,
      this.autoFocus = false,
      this.autoCorrect = false,
      this.backgroundColor = Colors.white,
      this.textEditingController,
      this.cursorColor = Colors.black,
      this.cursorHeight,
      this.cursorWidth = 2.0,
      this.cursorRadius = 0.0,
      this.textColor = Colors.black,
      this.textStyle = FontStyle.normal,
      this.textHeight = 1.0,
      this.textLineDecoration = TextDecoration.none,
      this.textWeight = FontWeight.normal,
      this.textFamily = POPPINS_REGULAR,
      this.textSize = 14,
      this.hintText = "Enter field name",
      this.outlineBorderColor = Colors.black,
      this.outlineBorderRadius = 0.0,
      this.outlineBorderWidth = 1.0,
      this.enabledBorderColor = Colors.black,
      this.enabledBorderRadius = 0.0,
      this.enabledBorderWidth = 1.0,
      this.focusedBorderColor = Colors.blue,
      this.focusedBorderRadius = 0.0,
      this.focusedBorderWidth = 1.0,
      this.disabledBorderColor = Colors.grey,
      this.disabledBorderRadius = 0.0,
      this.disabledBorderWidth = 1.0,
      this.errorBorderColor = Colors.red,
      this.errorBorderRadius = 0.0,
      this.errorBorderWidth = 1.0,
      this.contentPadding = const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      this.maxLength = 10,
      this.minLength = 10,
      this.maxLines = null,
      this.minLines = 1,
      this.isProtected = false,
      // this.obscuringText = "●",
      this.changeEvent,
      this.doneEvent,
      this.submitEvent,
      this.tapEvent,
      this.savedEvent,
      this.tapOutsideEvent,
      this.keyboardAction = TextInputAction.done,
      this.keyboard = TextInputType.text,
      this.isRquired = false,
      this.errorType,
      this.suffixIcon,
      this.prefixIcon,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.validatorFunction,
      this.semanticText,
      this.initialValue})
      : super(key: key);

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticText,
      child: Container(
        child: TextFormField(
          focusNode: focusNode,
          enabled: enabled,
          autocorrect: autoCorrect!,
          autofocus: autoFocus!,
          autovalidateMode: autoValidateMode,
          cursorColor: cursorColor,
          controller: textEditingController,
          cursorHeight: cursorHeight,
          cursorRadius: Radius.circular(cursorRadius!),
          cursorWidth: cursorWidth!,
          style: TextStyle(
              color: textColor,
              fontSize: textSize,
              fontStyle: textStyle,
              fontWeight: textWeight,
              fontFamily: textFamily,
              decoration: textLineDecoration),
          decoration: InputDecoration(
              filled: true,
              fillColor: backgroundColor,
              hintText: hintText,
              hintStyle: TextStyle(color: hintColor),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: outlineBorderWidth!,
                    color: outlineBorderColor!,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(outlineBorderRadius!),
                  gapPadding: 4.0),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: enabledBorderWidth!,
                    color: enabledBorderColor!,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(enabledBorderRadius!),
                  gapPadding: 4.0),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: focusedBorderWidth!,
                    color: focusedBorderColor!,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(focusedBorderRadius!),
                  gapPadding: 4.0),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: disabledBorderWidth!,
                    color: disabledBorderColor!,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(disabledBorderRadius!),
                  gapPadding: 4.0),
              contentPadding: contentPadding,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: errorBorderWidth!,
                    color: errorBorderColor!,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(errorBorderRadius!),
                  gapPadding: 4.0),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: errorBorderWidth!,
                    color: errorBorderColor!,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(errorBorderRadius!),
                  gapPadding: 4.0),
              suffixIcon: suffixIcon != null ? suffixIcon : null,
              prefixIcon: prefixIcon != null ? prefixIcon : null),
          maxLines: maxLines,
          minLines: minLines,
          obscureText: isProtected!,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
          ],
          // obscuringCharacter: obscuringText!,
          onChanged: changeEvent,
          onTap: tapEvent,
          onEditingComplete: doneEvent,
          onFieldSubmitted: submitEvent,
          onSaved: savedEvent,
          onTapOutside: tapOutsideEvent,
          keyboardType: keyboard,
          textInputAction: keyboardAction,
          validator: isRquired! ? validatorFunction : null,
          initialValue: initialValue,
        ),
      ),
    );
  }

  checkEmailFormat(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
