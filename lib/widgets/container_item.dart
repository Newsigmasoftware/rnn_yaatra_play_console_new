// ignore_for_file: non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';

Column not_found_widget_scope({title,height,width}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        // child: SvgPicture.asset("assets/images/no-result-found.svg",height: height ?? 140.0,width: width ?? 140.0)
        // child: SvgPicture.network("https://www.1mg.com/images/no-result-found.svg",height: 100.0,width: 100.0,)
        child: Lottie.asset(
          "assets/lottie/404animation.json",
          decoder: LottieComposition.decodeZip,
          height: height ?? 300.0,
          width: width ?? 300.0
        ),
      ),
      Text(
        title ?? "Data Not Found.",
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColor.TEXT_GREY,fontSize: 15,fontWeight: FontWeight.w600),
      ),
    ],
  );
}


InkWell CustomInkWell({Widget? child,onTap}) { 
  return InkWell(
    onTap: onTap ?? (){},
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    child: child,
  );
}
 

Future<T?> showCustomBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
  bool enableDrag = true,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    isScrollControlled: true,
    backgroundColor: backgroundColor ?? AppColor.WHITE,
    elevation: elevation ?? 10.0,
    shape: shape ?? RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext ctx) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,  
      ),
      child: child,
    ),
  );
}


Widget blured_container(BuildContext context,{Widget? child, List<Color>? colors}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(18.0),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Container(
        width: ScreenHelper().get_width(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: colors ?? [
              AppColor.WHITE,
              AppColor.WHITE.withValues(alpha: 0.5),
            ]
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
        child: child ?? SizedBox()
      ),
    ),
  );
}


Widget item_row_widget({String? title,String? value,TextStyle? textStyle,onTap}) {
  return Row(
    children: [
      Expanded(child: Text(title ?? "",style: GoogleFonts.poppins(fontSize: 14.0,fontWeight: FontWeight.w600),)),
      AddHorizontalSpacing(5.0),
      Expanded(
        child: CustomInkWell(
          onTap: onTap,
          child: Text(StringsHelper.is_empty_or_null(value ?? "") ? "N/A" : value ?? "",style: textStyle ?? GoogleFonts.poppins(fontSize: 15.0,fontWeight: FontWeight.w500),)),
      ),
    ],
  );
}


Widget row_item_widget({String? title1,String? value1,String? title2,String? value2,TextStyle? value2Style,onTapValue2, TextStyle? value1Style,Widget? value2Widget}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title1 ?? "",style: GoogleFonts.poppins(fontSize: 13.0,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
            AddVerticalSpacing(3.0),
            Text(StringsHelper.is_empty_or_null("$value1") ? "N/A" : value1 ?? "",style: value1Style ?? GoogleFonts.poppins(fontSize: 14.0,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
          ],
        ),
      ),
      StringsHelper.is_empty_or_null("$title2") ? SizedBox() : AddHorizontalSpacing(10.0),
      value2Widget != null ? Expanded(
        child: value2Widget,
      ) : StringsHelper.is_empty_or_null("$title2") ? SizedBox() : Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title2 ?? "",style: GoogleFonts.poppins(fontSize: 13.0,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
            AddVerticalSpacing(3.0),
            CustomInkWell(
              onTap: onTapValue2,
              child: Text(StringsHelper.is_empty_or_null("$value2") ? "N/A" : value2 ?? "",style: value2Style ?? GoogleFonts.poppins(fontSize: 14.0,fontWeight: FontWeight.w500),textAlign: TextAlign.left,)),
          ],
        ),
      ),
    ],
  );
}

Widget count_text({String? text}) {
  return Text(text ?? "",style: GoogleFonts.poppins(fontSize: 15.0,fontWeight: FontWeight.w600,color: AppColor.RED),);
}


Widget rowItemMenu({String? title,String? subtitle,Widget? icon,Color? color}){
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color?.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          height: 40.0,
          width: 40.0,
          child: icon ?? SizedBox()
        ),
        AddHorizontalSpacing(12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ?? "",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w500)),
              Text(subtitle ?? "",style: StyleHelper.popinsStyle(fontSize: 11.0,fontWeight: FontWeight.w400,color: AppColor.TEXT_GREY)),
            ],
          ),
        ),
        Icon(Icons.arrow_forward_ios,size: 18.0,color: AppColor.TEXT_GREY,)
      ],
    );
  }