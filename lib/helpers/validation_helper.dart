import 'package:flutter/material.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/widgets/snack_bar.dart';

class ValidationHelper {

  static bool isEmptyField({String? key,String? message}) {
    if(StringsHelper.is_empty_or_null("$key")){
       AlertToast.show_message_dialog(
        title: "VALIDATION",
        message: message ?? "Please fill all required field."
      );
      return true;
    }
    return false;
  }

  static bool isEmptyProject(BuildContext context, {String? projectID}) {
    if(StringsHelper.is_empty_or_null("$projectID")){
       AlertToast.show_message_dialog(
        context: context,
        title: "VALIDATION",
        message: "Please Select Project!"
      );
      return true;
    }
    return false;
  }

  static bool isEmptyScheme(BuildContext context, {String? schemeID}) {
    if(StringsHelper.is_empty_or_null("$schemeID")){
       AlertToast.show_message_dialog(
        context: context,
        title: "VALIDATION",
        message: "Please Select Scheme!"
      );
      return true;
    }
    return false;
  }

  static bool isEmptyStatus(BuildContext context, {String? schemeID}) {
    if(StringsHelper.is_empty_or_null("$schemeID")){
       AlertToast.show_message_dialog(
        context: context,
        title: "VALIDATION",
        message: "Please Select Scheme!"
      );
      return true;
    }
    return false;
  }


  /// Returns true if [fileNameOrUrl] is a path or URL that appears to be an image,
  /// by checking its file extension (case-insensitive).
  static bool isImage(String? fileNameOrUrl) {
    if (fileNameOrUrl == null) return false;
    final lower = fileNameOrUrl.toLowerCase();
    return lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.png') ||
        lower.endsWith('.gif') ||
        lower.endsWith('.bmp') ||
        lower.endsWith('.webp') ||
        lower.endsWith('.tiff') ||
        lower.endsWith('.heic');
  }


  static bool isEmptyList({List? list}) {
    if(list == null || (list).isEmpty){
      return true;
    }
    return false;
  }

}