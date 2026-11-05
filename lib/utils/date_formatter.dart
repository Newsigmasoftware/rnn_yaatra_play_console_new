// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';

class DateFormatter { 
  final DateTime now = DateTime.now();
  static convert_createdat_to_string({date}){
    final DateFormat formatter = DateFormat('dd-MMM-yyyy');
    DateTime dateTime = DateTime.parse(date);
    final String formatted_date = formatter.format(dateTime);
    return formatted_date;  
  }

  static convert_date_to_string({date}){
    final DateFormat formatter = DateFormat('dd-MMM-yyyy');
    DateTime tempDate = DateFormat("dd-MM-yyyy").parse(date);
    // DateTime dateTime = DateTime.parse(date.toString());
    final String formatted_date = formatter.format(tempDate);
    return formatted_date;  
  }

  static convert_date_picker_to_DD_MM_YYYY({date}){
    final DateFormat formatter = DateFormat('dd-mm-yyyy');
    DateTime tempDate = DateFormat("yyyy-mm-dd").parse(date);
    // DateTime dateTime = DateTime.parse(date.toString());
    final String formatted_date = formatter.format(tempDate);
    return formatted_date;  
  }

  static convert_date_to_DD_MM_YYYY({date}){
    final DateFormat formatter = DateFormat('yyyy-mm-dd');
    DateTime tempDate = DateFormat("dd-mm-yyyy").parse(date);
    // DateTime dateTime = DateTime.parse(date.toString());
    final String formatted_date = formatter.format(tempDate);
    return formatted_date;  
  }

  static remove_T_from_date({date}) {
    if(date.toString().trim().contains("T")){
      return "${date.toString().trim().split("T").first} ${date.toString().trim().split("T").last}";
    }else{
      return date.toString().trim();
    }
  }

  static remove_T_from_date_get_first({date}) {
    if(date.toString().trim().contains("T")){
      return date.toString().trim().split("T").first;
    }else{
      return date.toString().trim();
    }
  }

  static convert_YYYY_MM_DD_to_DD_M_YYYY_SEARCH({pickedDate}) {
    DateTime date = DateFormat("yyyy-mm-dd").parse(pickedDate.toString());
    // mm/dd/yyyy
    String formattedDate = DateFormat("dd/mm/yyyy").format(date);
    return formattedDate; 
  }

  
  static String formatTimeAgo({required String date}) {
    try {
      final DateTime parsedDate = DateTime.parse(date);
      final DateTime now = DateTime.now();
      final Duration difference = now.difference(parsedDate);

      if (difference.isNegative) {
        // If the date is in the future, "X ago" phrasing doesn't strictly apply.
        // We can return "just now" if it's very close to the current time (e.g., within 10 seconds in the future).
        // Otherwise, for dates significantly in the future, it's better to return a standard date format.
        final Duration absoluteDifference = difference.abs();
        if (absoluteDifference.inSeconds < 10) {
          return "just now"; // Very close to now, either past or future
        }
        // For dates significantly in the future, return a standard formatted date.
        // Using an existing formatter from the class for consistency.
        return convert_createdat_to_string(date: date);
      }

      // Date is in the past or exactly now
      if (difference.inSeconds < 10) {
        return "just now";
      } else if (difference.inMinutes < 1) {
        return "${difference.inSeconds} sec${difference.inSeconds == 1 ? '' : 's'} ago";
      } else if (difference.inMinutes < 60) {
        return "${difference.inMinutes} min${difference.inMinutes == 1 ? '' : 's'} ago";
      } else if (difference.inHours < 24) {
        return "${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago";
      } else if (difference.inDays < 7) {
        return "${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago";
      } else if (difference.inDays < 30) { // Approximately a month
        final int weeks = (difference.inDays / 7).round();
        return "$weeks week${weeks == 1 ? '' : 's'} ago";
      } else if (difference.inDays < 365) { // Approximately a year
        final int months = (difference.inDays / 30).round();
        return "$months month${months == 1 ? '' : 's'} ago";
      } else {
        final int years = (difference.inDays / 365).round();
        return "$years year${years == 1 ? '' : 's'} ago";
      }
    } catch (e) {
      // In case of parsing error or other issues, return the original date string
      // as a fallback, or an empty string/error message.
      return date;
    }
  }


  static String formatDateTimeSafe(dynamic dateStr) {
    try {
      if (StringsHelper.is_empty_or_null(dateStr)) return "";

      DateTime parsedDate;

      if (dateStr is DateTime) {
        parsedDate = dateStr;
      } else {
        parsedDate = DateTime.parse(dateStr.toString());
      }

      return DateFormat('dd/MM/yyyy hh:mm:ss a').format(parsedDate);
    } catch (e) {
      return dateStr?.toString() ?? "";
    }
  }


  /// Formats a [date] (DateTime or parseable string) into "01-Jan-2025".
  static String formatDateToDayMonthYear(dynamic date) {
    try {
      DateTime parsedDate;
      if (date is DateTime) {
        parsedDate = date;
      } else if (date != null && date.toString().isNotEmpty) {
        parsedDate = DateTime.parse(date.toString());
      } else {
        return "";
      }
      final months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      String day = parsedDate.day.toString().padLeft(2, '0');
      String month = months[parsedDate.month - 1];
      String year = parsedDate.year.toString();
      return "$day-$month-$year";
    } catch (e) {
      return date?.toString() ?? "";
    }
  }

}