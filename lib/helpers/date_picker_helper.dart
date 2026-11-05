import 'package:flutter/material.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/widgets/snack_bar.dart'; 


class DatePickerHelper {

  DateTime selectedDate = DateTime.now();

  pickDate(BuildContext context,{String? selected_date,response,DateTime? first_date}) async {
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColor.PRIMARY_COLOR, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColor.PRIMARY_COLOR, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: selectedDate,
        firstDate: first_date ?? DateTime(1900, 8),
        // lastDate: selectedDate
        lastDate: DateTime(2101)
      );
    if (picked != null && picked != selectedDate) {
      if(selected_date != null){
        selected_date = picked.toString().split(" ")[0].toString();
      }
      if(response != null){
        response(picked.toString().split(" ")[0].toString());
      }
    }
  }


  static bool check_if_from_date_is_greater_then_to(BuildContext context, {String? fromDate,String? to_date}) {
    if (!StringsHelper.is_empty_or_null("$to_date")) {
      DateTime? selectedFromDate = DateTime.tryParse(fromDate ?? "");
      DateTime? toDateTime = DateTime.tryParse(to_date!);

      if (selectedFromDate != null &&
          toDateTime != null &&
          selectedFromDate.isAfter(toDateTime)) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "From Date cannot be later than To Date."
        );
        // show_error_dialog(context, "From Date cannot be later than To Date.");
        return true;
      }else{
        return false;
      }
    }
    return false;
  }


  // pick_month({RxString? selected_date,response,lastDate}) async{
  //    final DateTime? picked = await showMonthPicker(
  //       builder: (context, child) {
  //         return Theme(
  //           data: Theme.of(context).copyWith(
  //             colorScheme: ColorScheme.light(
  //               primary: AppColor.PRIMARY_COLOR, // header background color
  //               onPrimary: Colors.white, // header text color
  //               onSurface: Colors.black, // body text color
  //             ),
  //             textButtonTheme: TextButtonThemeData(
  //               style: TextButton.styleFrom(
  //                 foregroundColor: AppColor.PRIMARY_COLOR, // button text color
  //               ),
  //             ),
  //           ),
  //           child: child!,
  //         );
  //       },
  //       context: Get.context!,
  //       initialDate: DateTime(selectedDate.year,selectedDate.month),
  //       firstDate: DateTime(1970),
  //       lastDate: DateTime(selectedDate.year,selectedDate.month)
  //     );
  //    if (picked != null && picked != selectedDate) {
  //     if(selected_date != null){
  //       // var month_year = picked.toString().split(" ")[0].toString().split("-")[0].toString()+"-"+picked.toString().split(" ")[0].toString().split("-")[1].toString();
  //       var month_year = picked.toString().split(" ")[0].toString();
  //       selected_date.value = month_year;
  //     }
  //     if(response != null){
  //       var month_year = picked.toString().split(" ")[0].toString();
  //       // var month_year = picked.toString().split(" ")[0].toString().split("-")[0].toString()+"-"+picked.toString().split(" ")[0].toString().split("-")[1].toString();
  //       response(month_year);
  //     }
  //   }
  // }

  // pick_year({RxString? selected_date,response,lastDate}) async{
  //    final DateTime? picked = await showMonthPicker(
  //       builder: (context, child) {
  //         return Theme(
  //           data: Theme.of(context).copyWith(
  //             colorScheme: ColorScheme.light(
  //               primary: AppColor.PRIMARY_COLOR, // header background color
  //               onPrimary: Colors.white, // header text color
  //               onSurface: Colors.black, // body text color
  //             ),
  //             textButtonTheme: TextButtonThemeData(
  //               style: TextButton.styleFrom(
  //                 foregroundColor: AppColor.PRIMARY_COLOR, // button text color
  //               ),
  //             ),
  //           ),
  //           child: child!,
  //         );
  //       },
  //       context: Get.context!,
  //       initialDate: DateTime(selectedDate.year),
  //       firstDate: DateTime(1970),
  //       lastDate: DateTime(selectedDate.year)
  //     );
  //    if (picked != null && picked != selectedDate) {
  //     if(selected_date != null){
  //       // var month_year = picked.toString().split(" ")[0].toString().split("-")[0].toString()+"-"+picked.toString().split(" ")[0].toString().split("-")[1].toString();
  //       var month_year = picked.toString().split(" ")[0].toString();
  //       selected_date.value = month_year;
  //     }
  //     if(response != null){
  //       var month_year = picked.toString().split(" ")[0].toString();
  //       // var month_year = picked.toString().split(" ")[0].toString().split("-")[0].toString()+"-"+picked.toString().split(" ")[0].toString().split("-")[1].toString();
  //       response(month_year);
  //     }
  //   }
  // }

}