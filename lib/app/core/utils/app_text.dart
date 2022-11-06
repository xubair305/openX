import 'package:openx/common_libs.dart';

class AppText {
  static Widget heading1(String data,
      {double? getfontSize, Color? color, TextAlign? textAlign}) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: getfontSize ?? 22,
        color: color,
      ),
      textAlign: textAlign,
    );
  }

  static Widget heading2(String data,
      {double? getfontSize,
      Color? color,
      FontWeight? fontWeight,
      TextAlign? textAlign,
      int? maxLines,
      TextOverflow? overflow}) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: getfontSize ?? 20,
        color: color,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  static Widget heading3(
    String data, {
    TextAlign? textAlign,
    Color? color,
    double? getfontSize,
    FontWeight? fontWeight,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      data,
      style: TextStyle(
        fontSize: getfontSize ?? 18,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w200,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  static Widget heading4(String data,
      {TextAlign? textAlign,
      Color? color,
      FontWeight? fontWeight,
      double? getfontSize,
      int? maxLines,
      TextOverflow? overflow}) {
    return Text(
      data,
      style: TextStyle(
          fontSize: getfontSize ?? 16, color: color, fontWeight: fontWeight),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  static Widget paragraph(
    String data, {
    bool isUnderline = false,
    bool isSelectable = false,
    TextAlign? textAlign,
    Color? color,
    FontWeight? fontWeight,
    int? maxLines,
    TextDecoration? decoration,
    double? getfontSize,
    TextOverflow? overflow,
  }) {
    final style = TextStyle(
      fontSize: getfontSize ?? 15,
      decoration: isUnderline ? TextDecoration.underline : decoration,
      color: color,
      fontWeight: fontWeight,
    );
    return isSelectable
        ? SelectableText(
            data,
            style: style,
            maxLines: maxLines,
            textAlign: textAlign,
          )
        : Text(
            data,
            style: style,
            maxLines: maxLines,
            textAlign: textAlign,
            overflow: overflow,
          );
  }

  static Widget smallParagraph(
    String data, {
    bool isUnderline = false,
    bool isSelectable = false,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    double? getfontSize,
    TextDecoration? decoration,
    FontWeight? fontWeight,
  }) {
    final style = TextStyle(
      fontSize: getfontSize ?? 13,
      decoration: isUnderline ? TextDecoration.underline : decoration,
      color: color,
      fontWeight: fontWeight,
    );
    return isSelectable
        ? SelectableText(
            data,
            style: style,
            maxLines: maxLines ?? 2,
          )
        : Text(
            data,
            style: style,
            maxLines: maxLines ?? 2,
            overflow: overflow ?? TextOverflow.ellipsis,
          );
  }
}
