import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/services/account_services.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/widgets/app_bar.dart';
import 'package:rnn_yaatra/widgets/buttons.dart';
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/snack_bar.dart';
import 'package:rnn_yaatra/widgets/text_fields.dart';

class RaiseTicketScreen extends ConsumerStatefulWidget {
  const RaiseTicketScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RaiseTicketScreenState();
}

class _RaiseTicketScreenState extends ConsumerState<RaiseTicketScreen> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final AccountServices _accountServices = AccountServices();

  Future<void> _submitTicket() async {
    final subject = _subjectController.text.trim();
    final message = _messageController.text.trim();

    if (subject.isEmpty) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "Please enter Subject!",
      );
      return;
    }

    if (message.isEmpty) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "Please enter Message!",
      );
      return;
    }

    ProgressDialog().show(context, ref);

    try {
      final res = await _accountServices.composeMessage(
        subject: subject,
        message: message,
      );


      if (!mounted) return;
      ProgressDialog().hide(context, ref);

      if (res.status == true) {
        AlertToast.show_message_dialog(
          title: "Success",
          message: res.message ?? "Ticket submitted successfully!",
        );
        setState(() {
          _subjectController.clear();
          _messageController.clear();
        });
        context.pop();
      } else {
        AlertToast.show_message_dialog(
          title: "Submission Failed",
          message: res.message ?? "Failed to submit ticket. Please try again.",
        );
      }
    } catch (e) {
      if (mounted) {
        ProgressDialog().hide(context, ref);
        AlertToast.show_message_dialog(
          title: "Error",
          message: "An error occurred while submitting ticket.",
        );
      }
    }
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Raise Ticket",
        onBackPressed: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpacing(10.0),
            Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
                    spreadRadius: 2.0,
                    offset: const Offset(0, 2),
                    blurRadius: 6.0,
                  )
                ],
              ),
              width: ScreenHelper().get_width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF0D47A1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Iconsax.ticket5, color: Colors.white, size: 16),
                              SizedBox(width: 6),
                              Text(
                                "Submit Support Ticket",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AddVerticalSpacing(15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Subject", style: StyleHelper.popinsStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: _subjectController,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Subject",
                          icon:  Icon(Iconsax.document_text, color: AppColor.TEXT_GREY, size: 20.0),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Message", style: StyleHelper.popinsStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: _messageController,
                          is_textarea: true,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Message / Support Description",
                          icon:  Icon(Iconsax.message_text, color: AppColor.TEXT_GREY, size: 20.0),
                        ),

                        AddVerticalSpacing(25.0),
                        primaryButton(
                          title: "Submit Ticket",
                          onTap: _submitTicket,
                        ),
                      ],
                    ),
                  ),
                  AddVerticalSpacing(20.0),
                ],
              ),
            ),
            AddVerticalSpacing(20.0),
          ],
        ),
      ),
    );
  }
}
