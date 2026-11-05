import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleHelper{

  static TextStyle popinsStyle({
    TextStyle? textStyle,
    background,backgroundColor,color,decoration,decorationColor,decorationStyle,decorationThickness,fontFeatures,
    fontSize, fontStyle,fontWeight,foreground,height,letterSpacing,locale,shadows,textBaseline,wordSpacing
  }) {
    return GoogleFonts.poppins(
      background: background,
      backgroundColor: backgroundColor,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontFeatures: fontFeatures,
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      foreground: foreground,
      height: height,
      letterSpacing: letterSpacing,
      locale: locale,
      shadows: shadows,
      textBaseline: textBaseline,
      wordSpacing: wordSpacing,
      textStyle: textStyle,

    );
  }


  static TextStyle jostStyle({
    TextStyle? textStyle,
    background,backgroundColor,color,decoration,decorationColor,decorationStyle,decorationThickness,fontFeatures,
    fontSize, fontStyle,fontWeight,foreground,height,letterSpacing,locale,shadows,textBaseline,wordSpacing
  }) {
    return GoogleFonts.jost(
      background: background,
      backgroundColor: backgroundColor,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontFeatures: fontFeatures,
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      foreground: foreground,
      height: height,
      letterSpacing: letterSpacing,
      locale: locale,
      shadows: shadows,
      textBaseline: textBaseline,
      wordSpacing: wordSpacing,
      textStyle: textStyle,

    );
  }

}