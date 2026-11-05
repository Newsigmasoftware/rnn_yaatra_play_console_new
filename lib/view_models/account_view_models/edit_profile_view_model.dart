// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rnn_yaatra/notifiers_interfaces/account_interfaces/edit_profile_interface.dart';
import 'package:rnn_yaatra/services/account_services.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/view_models/account_view_models/get_profile_detail_view_model.dart';
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/snack_bar.dart';

class EditProfileViewModel {

  final pageStateProvider = NotifierProvider<EditProfileViewModelNotifier,EditProfileInterface>(EditProfileViewModelNotifier.new); 

  final txt_name = TextEditingController();
  final txt_email = TextEditingController();
  final txt_phone = TextEditingController();
  final txt_gender = TextEditingController();
  final txt_aadhaar_no = TextEditingController();
  final txt_pan_no = TextEditingController();
  final txt_address = TextEditingController();
  final txt_nominee = TextEditingController();
  final txt_nominee_relation = TextEditingController();
  final txt_nominee_relation_value = TextEditingController();
  final txt_acc_holder_name = TextEditingController();
  final txt_bank_name = TextEditingController();
  final txt_bank_value = TextEditingController();
  final txt_bank_branch = TextEditingController();
  final txt_account_no = TextEditingController();
  final txt_ifsc_code = TextEditingController();

  final AccountServices accountServices = AccountServices();

  Future editProfile(WidgetRef ref, BuildContext context) async { 
    try {
      
      var pageState = ref.read(pageStateProvider);

      if (StringsHelper.is_empty_or_null(txt_name.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter Full Name!"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_email.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter Email!"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_phone.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter Phone!"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_gender.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Select Gender!"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_aadhaar_no.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter Aadhar No.!"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_pan_no.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter Pan No.!"
        );
        return;
      }
      
      if (StringsHelper.is_empty_or_null(txt_address.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter Address!"
        );
        return;
      }

      var profileDetail = ref.read(getProfileViewModelNotifier).getProfileDetailResponseModel;
      String currentPhoto = pageState.selectedProfile ?? profileDetail?.data?.photo ?? "";

      if (StringsHelper.is_empty_or_null(currentPhoto)) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Select Profile Image.!"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_nominee.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter Nominee Name!"
        );
        return;
      }
      
      if (StringsHelper.is_empty_or_null(txt_nominee_relation.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter Nominee Relation!"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_acc_holder_name.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter Account Holder Name!"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_bank_name.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Select Bank Name!"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_account_no.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter Account No.!"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_ifsc_code.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Enter IFSC Code.!"
        );
        return;
      }
      ProgressDialog().show(context, ref);
      final res = await accountServices.update_profile(
        name: txt_name.text,
        email: txt_email.text,
        phone: txt_phone.text,
        gender: txt_gender.text,
        aadharNo: txt_aadhaar_no.text,
        panNo: txt_pan_no.text,
        address: txt_address.text,
        photo: currentPhoto,
        nomineeName: txt_nominee.text,
        nomineeRelation: txt_nominee_relation_value.text,
        accountHolderName: txt_acc_holder_name.text,
        bankName: txt_bank_value.text,
        bankBranch: txt_bank_branch.text,
        accountNo: txt_account_no.text,
        ifscCode: txt_ifsc_code.text,
      );
      if (context.mounted) {
        ProgressDialog().hide(context, ref);
      }
      if (res != null) {
        bool isSuccess = res['status'] == true ||
            res['status'] == "true" ||
            res['status'] == 1 ||
            res['status'] == "1" ||
            res['status'] == "success" ||
            (res['message'] != null &&
                res['message'].toString().toLowerCase().contains("success"));

        String msg = res['message'] ?? res['msg'] ?? "Profile Updated Successfully";

        if (isSuccess) {
          if (context.mounted) {
            await AlertToast.show_message_dialog(
              context: context,
              title: "Success",
              message: msg,
              onClose: () {
                if (context.mounted) {
                  context.pop();
                }
              },
            );
          }
        } else {
          if (context.mounted) {
            AlertToast.show_message_dialog(
              context: context,
              title: "Failed",
              message: msg,
            );
          }
        }
      } else {
        if (context.mounted) {
          AlertToast.show_message_dialog(
            context: context,
            title: "Error",
            message: "Something went wrong. Please check your internet connection.",
          );
        }
      }

    } catch (e) {
      if (context.mounted) {
        ProgressDialog().hide(context, ref);
      }
      PrintLogs().print_console_error(message: "EDIT PROFILE VIEW MODEL - EDIT PROFILE",e: e.toString());
    }
  }

}

class EditProfileViewModelNotifier extends Notifier<EditProfileInterface> {

  @override
  EditProfileInterface build() {
    return EditProfileInterface();
  }

  setProfile({String? image}) {
    state = state.copyWith(
      profileImage: image
    );
  }

  setLoading(bool value) {
    state = state.copyWith(
      isLoading: value
    );
  }

}
