// import 'package:html/parser.dart' as html_parser;

// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:rnn_yaatra/utils/double_helper.dart';

class StringsHelper{

  static get_avatar_letter({String? string}){
    if(string.toString().trim().isNotEmpty){
      var name = string.toString().trim().contains(" ") ? string.toString()[0].toString().toUpperCase() : string.toString().substring(0,1).toUpperCase();
      return name.toString().toUpperCase();
    }
    return "";
  }

  static String get_single_data_from_comma_strings({String? string}){
    if(string.toString().isNotEmpty){
      if(string.toString().toLowerCase().contains(",")){
        var url = string.toString().split(",")[0];
        return url;
      }else{
        return string.toString();
      }
    }
    return "";
  }

  static List get_list_data_from_comma_strings({String? string}){
    List data = [];
    if(string.toString().isNotEmpty){
      if(string.toString().toLowerCase().contains(",")){
        for (var i = 0; i < string.toString().split(",").length; i++) {
          data.add(string.toString().split(",")[i]);
        }
        // var url = string.toString().split(",")[0];
        return data;
      }else{
        data.add(string.toString());
        return data;
      }
    }
    return data;
  }

  static String convert_double_to_string({String? string}) {
    if(string.toString().isNotEmpty){
      if(string.toString().contains(".")){
        double number = double.parse(string.toString());
        return number.toStringAsFixed(0);
      }else{
        return string.toString();
      }
    }
    return "";
  }

  static bool is_empty_or_null(String string){
    if(string.toString().toLowerCase() == "null" || string.toString().removeAllWhitespace.isEmpty){
      return true;
    }else{
      return false;
    }
  }

  // static String parseHtmlToString(String htmlString) {
  //   final document = html_parser.parse(htmlString);
  //   return document.body?.text ?? '';
  // }

  static bool validateAadharNumber(String? aadharNumber) {
    if (aadharNumber == null || aadharNumber.isEmpty) {
      return false;
    }
    // Remove any whitespace
    String cleanedAadhar = aadharNumber.replaceAll(' ', '');
    // Check if it contains exactly 12 digits
    if (cleanedAadhar.length != 12) {
      return false;
    }
    // Check if it contains only digits
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanedAadhar)) {
      return false;
    }
    return true;
  }


  static bool validatePanCardNumber(String? panCardNumber) {
    if (panCardNumber == null || panCardNumber.isEmpty) {
      return false;
    }
    // PAN card number must be exactly 10 characters long
    if (panCardNumber.length != 10) {
      return false;
    }
    // PAN card number format: AAAAA9999A (5 uppercase letters, 4 digits, 1 uppercase letter)
    final RegExp panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
    return panRegex.hasMatch(panCardNumber);
  }

  String formatKeyName(String key) {
    if (key.isEmpty) return key;
    
    final formatted = key.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );

    return formatted[0].toUpperCase() + formatted.substring(1);
  }


  static String formatNumberIndian(int? number) {
    if (number == null) return "";
    String numStr = number.toString();
    if (numStr.length <= 3) {
      return numStr;
    }
    int lastThreeLength = 3;
    String lastThree = numStr.substring(numStr.length - lastThreeLength);
    String otherNumbers = numStr.substring(0, numStr.length - lastThreeLength);
    List<String> result = [];
    while (otherNumbers.length > 2) {
      result.insert(0, otherNumbers.substring(otherNumbers.length - 2));
      otherNumbers = otherNumbers.substring(0, otherNumbers.length - 2);
    }
    if (otherNumbers.isNotEmpty) {
      result.insert(0, otherNumbers);
    }
    return (result.isEmpty ? "" : result.join(",") + ",") + lastThree;
  }

  /// Accepts num (int/double), and formats integer part in Indian style, keeps decimal (if any, for string input).
  static String formatIndianNumberDynamic(dynamic numberInput) {
    if (numberInput == null) return "";
    String cleaned = "";
    int? intPart;
    String? decimalPart;

    if (numberInput is int) {
      return formatNumberIndian(numberInput);
    } else if (numberInput is double) {
      List<String> parts = numberInput.toStringAsFixed(2).split(".");
      intPart = int.tryParse(parts[0]);
      decimalPart = parts.length > 1 ? parts[1] : null;
    } else if (numberInput is String) {
      cleaned = numberInput.replaceAll(",", "").trim();
      if (cleaned.contains(".")) {
        List<String> parts = cleaned.split(".");
        intPart = int.tryParse(parts[0]);
        decimalPart = parts.length > 1 ? parts[1] : null;
      } else {
        intPart = int.tryParse(cleaned);
      }
    } else {
      return numberInput.toString();
    }

    if (intPart == null) return numberInput.toString();

    String formatted = formatNumberIndian(intPart);

    if (decimalPart != null && decimalPart.isNotEmpty) {
      return "$formatted.$decimalPart";
    }
    return formatted;
  }
 
  static String formatIndianNumberString(String? numberStr) {
    try {
      if (numberStr == null || numberStr.toLowerCase().trim() == "null" || numberStr.trim().isEmpty) {
        return "0";
      }
      try {
        final numValue = num.tryParse(numberStr.replaceAll(",", "").trim());
        if (numValue == null || numValue.isNaN || numValue.isInfinite) {
          return "0";
        }
      } catch (e) {
        return "0";
      }
      return formatIndianNumberDynamic(numberStr);
    } catch (e) {
      return numberStr.toString();
    }
  }

  static bool is_null_or_empty({String? string}) {
    if(string.toString().toLowerCase() == "null" || string.toString() == "" || string.toString().isEmpty){
      return true;
    }
    return false;
  }


  // static String get_language_code({String? lang}) {
  //   if(is_empty_or_null("$lang")){
  //     return "";
  //   }
  //   if(lang == Languages.English.name) {
  //     return "en";
  //   }
  //   if(lang == Languages.Hindi.name) {
  //     return "hi";
  //   }
  //   return "";
  // }


  static String formatShortIndianNumber(String number) {
    if (StringsHelper.is_empty_or_null(number)) return "";
    double n = DoubleHelper.convert_string_to_double(string: number);
    String suffix = "";
    double value = n;

    if (n >= 10000000) {
      value = n / 10000000;
      suffix = " Cr";
    } else if (n >= 100000) {
      value = n / 100000;
      suffix = " Lakh";
    } else if (n >= 1000) {
      value = n / 1000;
      suffix = "K";
    } else {
      value = n;
    }

    String stringValue;
    if (suffix != "") {
      if (value % 1 == 0) {
        stringValue = value.toStringAsFixed(0);
      } else if (value * 10 % 1 == 0) {
        stringValue = value.toStringAsFixed(1);
      } else {
        stringValue = value.toStringAsFixed(2);
      }
      return "$stringValue$suffix";
    } else {
      return value.toStringAsFixed(0);
    }
  }


  static String getGreetingBasedOnTime({DateTime? dateTime}) {
    final DateTime now = dateTime ?? DateTime.now();
    final hour = now.hour;
    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

}