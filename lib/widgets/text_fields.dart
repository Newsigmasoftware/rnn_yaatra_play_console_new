// ignore_for_file: deprecated_member_use, non_constant_identifier_names
import 'package:rnn_yaatra/main.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:flutter/material.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart'; 

Widget input_text_field({isDisable,hint_text,icon,keyboardType,controller,suffix_icon,obscureText,onChanged,is_textarea,bg_color,hint_style,text_style,maxLength,onEditingComplete,focusNode,shadowColor,readOnly,isShadowHide,borderColor}){
  return IgnorePointer(
    ignoring: (isDisable ?? false) || (readOnly ?? false),
    child: Container(
      decoration: BoxDecoration(
        color: bg_color ?? Colors.transparent,
        // color:  isDisable == true ? AppColor.GREY_LIGHT : bg_color ?? AppColor.WHITE.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor ?? AppColor.GREY_LIGHT,
        ),
        boxShadow: isShadowHide == true ? [] : [
          BoxShadow(
            color: shadowColor ?? AppColor.GREY_LIGHT.withValues(alpha: 0.5),
            spreadRadius: 1,
            blurRadius: 5.0,
            offset: Offset(0, 2)
          )
        ]
      ),
      height: is_textarea == true ? null : 45.0,
      padding: EdgeInsets.only(right: 16,left: 11,top:  is_textarea == true ? 10 : 0,bottom: is_textarea == true ? 0 : 10),
      // padding: EdgeInsets.only(right: 16,left: 11,top:  is_textarea == true ? 10 : 0,bottom: is_textarea == true ? 0 : 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon == null ? const SizedBox() : Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.WHITE,
                  borderRadius: BorderRadius.circular(5)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: Center(
                child: icon ?? const SizedBox()
              ),
            ),
          ),
          icon == null ? const SizedBox() : AddHorizontalSpacing(5),
          Expanded(child: TextFormField(
            autofocus: false,
            readOnly: readOnly ?? false,
            enabled: isDisable == true ? false : true,
            // focusNode: FocusNode(canRequestFocus: false,),
            focusNode: focusNode,
            onEditingComplete: onEditingComplete,
            keyboardType: keyboardType ?? TextInputType.text,
            controller: controller,
            obscureText: obscureText ?? false,
            onChanged: onChanged,
            maxLength: maxLength,
            maxLines: is_textarea == true ? 5 : 1,
            style: text_style,
            decoration: InputDecoration(
              counterText: "",
              border: InputBorder.none,
              hintText: hint_text ?? "",
              hintStyle: hint_style ?? const TextStyle(fontSize: 14),
            ),
          )),
          suffix_icon ?? SizedBox(),
        ],
      ),
    ),
  );
}

// Widget input_text_field({isDisable,hint_text,icon,keyboardType,controller,suffix_icon,obscureText,onChanged,is_textarea,bg_color,hint_style,text_style,maxLength,onEditingComplete,focusNode,shadowColor,readOnly}){
//   return IgnorePointer(
//     ignoring: (isDisable ?? false) || (readOnly ?? false),
//     child: Container(
//       decoration: BoxDecoration(
//         color: bg_color ?? Colors.transparent,
//         // color:  isDisable == true ? AppColor.GREY_LIGHT : bg_color ?? AppColor.WHITE.withOpacity(0.6),
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: AppColor.GREY_LIGHT,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: shadowColor ?? AppColor.GREY_LIGHT.withValues(alpha: 0.5),
//             spreadRadius: 1,
//             blurRadius: 5.0,
//             offset: Offset(0, 2)
//           )
//         ]
//       ),
//       height: is_textarea == true ? null : 45.0,
//       padding: EdgeInsets.only(right: 16,left: 11,top:  is_textarea == true ? 10 : 0,bottom: is_textarea == true ? 0 : 0),
//       // padding: EdgeInsets.only(right: 16,left: 11,top:  is_textarea == true ? 10 : 0,bottom: is_textarea == true ? 0 : 3),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         // mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // icon == null ? const SizedBox() : Padding(
//           //   padding: const EdgeInsets.only(top: 8),
//           //   child: Container(
//           //     decoration: BoxDecoration(
//           //         color: AppColor.WHITE,
//           //         borderRadius: BorderRadius.circular(5)
//           //     ),
//           //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
//           //     child: Center(
//           //       child: icon ?? const SizedBox()
//           //     ),
//           //   ),
//           // ),
//           // icon == null ? const SizedBox() : AddHorizontalSpacing(10),
//           Expanded(child: TextFormField(
//             autofocus: false,
//             readOnly: readOnly ?? false,
//             enabled: isDisable == true ? false : true,
//             // focusNode: FocusNode(canRequestFocus: false,),
//             focusNode: focusNode,
//             onEditingComplete: onEditingComplete,
//             keyboardType: keyboardType ?? TextInputType.text,
//             controller: controller,
//             obscureText: obscureText ?? false,
//             onChanged: onChanged,
//             maxLength: maxLength,
//             maxLines: is_textarea == true ? 5 : 1,
//             style: text_style,
//             decoration: InputDecoration(
//               counterText: "",
//               border: InputBorder.none,
//               hintText: hint_text ?? "",
//               hintStyle: hint_style ?? const TextStyle(fontSize: 14),
//             ),
//           )),
//           suffix_icon ?? SizedBox(),
//         ],
//       ),
//     ),
//   );
// }

Widget inputRequiredText({String? text, bool? isRequired,Color? textColor,fontSize,TextStyle? style}) {
  return RichText(
    text: TextSpan(
        text: text ?? "",
        style: style ?? TextStyle(color: textColor ?? AppColor.BLACK,fontSize: fontSize ?? 15,fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            text: isRequired == true ? " *" : "",
            style: TextStyle(color: Colors.red,fontSize: fontSize ?? 15),
          )
        ]
    ),
  );
}

Widget input_dropdown({hint_text,List? list,onChanged,show_key}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.GREY_LIGHT,
        )
    ),
    padding: const EdgeInsets.only(left: 10,right: 10),
    child: DropdownButtonHideUnderline(
      child: DropdownButton(
        isExpanded: true,
        hint: Text(hint_text ?? "",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
        items: list?.map((value) {
          return DropdownMenuItem(
            value: value[show_key].toString(),
            child: Text(value[show_key].toString(),style: const TextStyle(color: AppColor.BLACK,fontWeight: FontWeight.w400),),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}


Widget input_text_field_border({controller,hintText,icon,suffix_icon}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.GREY_LIGHT),
      borderRadius: BorderRadius.circular(15.0),
    ),
    padding: EdgeInsets.symmetric(horizontal: 13),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            style: GoogleFonts.poppins(fontSize: 14),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: icon ?? Icon(Iconsax.calendar,color: AppColor.TEXT_GREY),
              hintText: hintText ?? "YYYY-MM-DD",
              hintStyle: GoogleFonts.poppins(fontSize: 13)
            ),
          ),
        ),
        suffix_icon ?? SizedBox(),
      ],
    ),
  );
}


// Widget input_filter_bottomsheet({ icon,title,search_input_title,required RxList item_list,required show_key_name,required filter_key_name,response }){
//   return InkWell(
//     onTap: (){
//       show_filter_bottomsheet(
//         title: title ?? "",
//         input_title: search_input_title ?? "",
//         item_list: item_list,
//         show_key_name: show_key_name,
//         filter_key_name: filter_key_name,
//         response: response,
//       );
//     },
//   child: Container(
//     decoration: BoxDecoration(
//       color: AppColor.PRIMARY_COLOR.withOpacity(0.06),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     width: Get.width,
//     padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: AppColor.WHITE,
//               borderRadius: BorderRadius.circular(5)
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
//             child: Center(
//               child: icon
//             ),
//           ),
//         AddHorizontalSpacing(10),
//         Expanded(child: Text(title ?? "",style: TextStyle(fontSize: 14,color: AppColor.TEXT_GREY),),),
//         Icon(Icons.arrow_drop_down,color: AppColor.GREY_MEDIUM,),
//       ],
//     ),
//   ),
//   );
// }



Widget txt_field_widget({String? title,String? hintText,Widget? icon,TextEditingController? controller,bool? readOnly,Widget? suffixIcon,TextInputType? textInputType,onChanged,maxLength,bool? isRequired,bool? isTextArea,obsecureText,
Color? cardColor}) {
    return IgnorePointer(
      ignoring: readOnly ?? false,
      child: Container(
        decoration: BoxDecoration(
          color: cardColor ??  AppColor.WHITE,
          borderRadius: BorderRadius.circular(12.0),
        ),
        // padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 6.0,bottom: 3.0),
        child: Row(
          crossAxisAlignment: isTextArea == true ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            icon ?? SizedBox(),
            AddHorizontalSpacing(10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputRequiredText(
                    text: title ?? "",
                    fontSize: 14.0,
                    style: StyleHelper.popinsStyle(fontSize: 13.0,color: AppColor.PRIMARY_COLOR_DARK,fontWeight: FontWeight.w600),
                    isRequired: isRequired
                  ),
                  SizedBox(
                    // height: 20.0,
                    width: ScreenHelper().get_width(navigatorKey.currentContext),
                    child: TextFormField(
                      obscureText: obsecureText == true ? true : false,
                      controller: controller,
                      readOnly: readOnly ?? false,
                      keyboardType: textInputType ?? TextInputType.text,
                      maxLength: maxLength,
                      maxLines: obsecureText == true
                      ? 1
                      : (isTextArea == true ? 3 : 1),
                      decoration: InputDecoration(
                        counterText: "",
                        isDense: true,
                        border: InputBorder.none,
                        hintText: hintText ?? "",
                        hintStyle: StyleHelper.popinsStyle(fontSize: 13.0,fontWeight: FontWeight.w500,color: AppColor.TEXT_GREY)
                      ),
                      onChanged: onChanged,
                    ),
                  ),
      
                ],
              ),
            ), 
            suffixIcon ?? SizedBox()
          ],
        ),
      ),
    );
  }