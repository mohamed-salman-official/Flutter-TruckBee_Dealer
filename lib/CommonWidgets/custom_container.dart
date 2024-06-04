import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? childWidget;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Color? boxColor;
  final bool? isGradient;
  final List<Color> gradientColors;
  final double? borderRound;
  final Color? borderColor;
  final double? borderWidth;
  final BorderStyle? borderStyle;
  final bool? isElevated;
  final Color? shadowColor;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;
  final double? width;
  final double? height;
  final String? image;
  final bool? hasConstraints;
  final String? semanticText;

  CustomContainer(
      {Key? key,
      this.childWidget,
      this.padding = const EdgeInsets.all(0.0),
      this.margin = const EdgeInsets.all(0.0),
      this.alignment = Alignment.center,
      this.boxColor = Colors.transparent,
      this.isGradient = false,
      this.gradientColors = const <Color>[Color(0xFFDEADAD), Color(0xFFFFFFF)],
      this.borderRound = 0,
      this.borderColor,
      this.borderWidth = 0.5,
      this.borderStyle = BorderStyle.solid,
      this.isElevated = false,
      this.shadowColor,
      this.minHeight = 100.0,
      this.maxHeight = 100,
      this.minWidth = 0.0,
      this.maxWidth = double.infinity,
      this.width,
      this.height,
      this.image,
      this.hasConstraints = false,
      this.semanticText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticText,
      child: Container(
          constraints: hasConstraints!
              ? BoxConstraints(
                  minWidth: minWidth!,
                  maxWidth: maxWidth!,
                  minHeight: minHeight!,
                  maxHeight: maxHeight!,
                )
              : null,
          width: width,
          height: height,
          alignment: alignment,
          decoration: BoxDecoration(
              border: borderColor != null
                  ? Border.all(
                      color: borderColor!,
                      width: borderWidth!,
                      style: borderStyle!,
                    )
                  : null,
              borderRadius: BorderRadius.circular(borderRound!),
              boxShadow: isElevated!
                  ? [
                      BoxShadow(
                        color: shadowColor != null
                            ? shadowColor!.withOpacity(0.3)
                            : boxColor!.withOpacity(0.3),
                        offset: const Offset(
                          1.0,
                          1.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: 2.0,
                      )
                    ]
                  : null,
              color: boxColor,
              gradient: isGradient!
                  ? LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: gradientColors,
                    )
                  : null,
              image: image != null
                  ? DecorationImage(
                      image: AssetImage(image!),
                      fit: BoxFit.cover,
                    )
                  : null),
          margin: margin,
          padding: padding,
          child: childWidget),
    );
  }
}
