import 'package:flutter/material.dart';

import '../constants/AppDimens.dart';


class Utils {
  static Text getText(
      String text, {
        double? fontSize,
        FontWeight? fontWidth,
        Color? color,
        String? fontFamily,
        TextAlign? textAlign,
        TextOverflow? textOverflow,
        TextDecoration decoration = TextDecoration.none,
        bool? italic = false,
        Color? decorationColor,
        double? decorationThickness,
        int? maxLine,
        double? lineSpacing = AppDimens.lineSpace,
      }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWidth,
        color: color,
        fontFamily: fontFamily,
        decoration: decoration,
        fontStyle: italic! ? FontStyle.italic : FontStyle.normal,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
        height: lineSpacing,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
    );
  }
}
