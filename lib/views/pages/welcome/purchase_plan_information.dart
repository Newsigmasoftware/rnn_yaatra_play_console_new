import 'package:flutter/material.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/widgets/buttons.dart';

class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({super.key});

  static const Color primary = Color(0xFF043D97);
  static const Color accent = Color(0xFFEFA921);
  static const Color background = Color(0xFFF6F8FC);
  static const Color textDark = Color(0xFF172033);
  static const Color textGrey = Color(0xFF667085);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   surfaceTintColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: () => Navigator.pop(context),
      //     icon: const Icon(
      //       Icons.arrow_back_ios_new_rounded,
      //       color: primary,
      //       size: 20,
      //     ),
      //   ),
      //   title: const Text(
      //     'How It Works',
      //     style: TextStyle(
      //       color: primary,
      //       fontSize: 19,
      //       fontWeight: FontWeight.w700,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  back_button_primary_bg(
                    isRounded: true
                  ),
                  AddHorizontalSpacing(10.0),
                  Expanded(
                    child: Text("How It Works",style: StyleHelper.popinsStyle(fontSize: 16.0,fontWeight: FontWeight.w500,color: AppColor.PRIMARY_COLOR)),
                  ),
                ],
              ),
              AddVerticalSpacing(15.0),
              _buildHeaderCard(),

              AddVerticalSpacing(22.0),

              const Text(
                'How It Works',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: textDark,
                ),
              ),

              AddVerticalSpacing(5.0),

              const Text(
                'Follow these simple steps to purchase an eligible travel plan.',
                style: TextStyle(
                  fontSize: 13,
                  color: textGrey,
                  height: 1.4,
                ),
              ),

              AddVerticalSpacing(20.0),

              _buildStep(
                number: '01',
                icon: Icons.account_balance_wallet_outlined,
                title: 'Add Money to Wallet',
                description:
                    'If you do not have sufficient wallet balance, submit a request to add the required amount to your wallet.',
                isLast: false,
              ),

              _buildStep(
                number: '02',
                icon: Icons.admin_panel_settings_outlined,
                title: 'Admin Reviews Your Request',
                description:
                    'Your wallet top-up request is reviewed by the company administrator. The amount is added only after approval.',
                isLast: false,
              ),

              _buildStep(
                number: '03',
                icon: Icons.flight_takeoff_rounded,
                title: 'Select a Travel Plan',
                description:
                    'Once the required balance is available, browse the available travel plans and select the plan that suits your requirements.',
                isLast: false,
              ),

              _buildStep(
                number: '04',
                icon: Icons.shopping_bag_outlined,
                title: 'Purchase the Travel Plan',
                description:
                    'Purchase the selected travel plan using your available wallet balance, subject to applicable company terms and conditions.',
                isLast: false,
              ),

              _buildStep(
                number: '05',
                icon: Icons.password,
                title: 'Password',
                description: 'Enter your transaction password to securely confirm this purchase. \n\nYour password is used to authorize the purchase and add an additional layer of security.',
                isLast: false,
              ),
 

              // AddVerticalSpacing(18.0),

              // _buildCommissionCard(),

              AddVerticalSpacing(16.0),

              _buildEligibilityCard(),

              AddVerticalSpacing(16.0),

              _buildImportantNote(),

              AddVerticalSpacing(20.0),

              Center(
                child: Text(
                  AppConstants.APP_NAME,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor.PRIMARY_COLOR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primary,
            Color(0xFF0754B9),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: .18),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -35,
            top: -45,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: .06),
              ),
            ),
          ),

          Positioned(
            right: 20,
            bottom: -60,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accent.withValues(alpha: .10),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.flight_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),

              AddVerticalSpacing(16.0),

              const Text(
                'Your Travel Journey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),

              AddVerticalSpacing(5.0),

              Text(
                'Simple, transparent & easy to follow',
                style: TextStyle(
                  color: Colors.white,
                  // color: Colors.white.withValues(alpha: .82),
                  fontSize: 13.5,
                ),
              ),

              AddVerticalSpacing(17.0),

              Container(
                height: 3,
                width: 45,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              AddVerticalSpacing(14.0),

              Text(
                'Explore available travel plans and complete your purchase using your approved wallet balance.',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: .88),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required String number,
    required IconData icon,
    required String title,
    required String description,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 54,
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: primary.withValues(alpha: .15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 23,
                ),
              ),

              if (!isLast)
                Container(
                  width: 2,
                  height: 82,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: .55),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
            ],
          ),
        ),

        AddHorizontalSpacing(13.0),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFE7EBF2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .035),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      number,
                      style: TextStyle(
                        color: accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    AddHorizontalSpacing(8.0),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: textDark,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),

                AddVerticalSpacing(9.0),

                Text(
                  description,
                  style: const TextStyle(
                    color: textGrey,
                    fontSize: 12.8,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCommissionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: accent.withValues(alpha: .30),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),

          AddHorizontalSpacing(12.0),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Commission / Incentive',
                  style: TextStyle(
                    color: textDark,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                AddVerticalSpacing(6.0),

                Text(
                  'Commission or incentives are not automatic, guaranteed or fixed. Eligibility and the applicable amount are determined by the company according to its terms and conditions.',
                  style: TextStyle(
                    color: textGrey,
                    fontSize: 12.8,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEligibilityCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE7EBF2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: .08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.support_agent_rounded,
                  color: primary,
                ),
              ),
              AddHorizontalSpacing(11.0),
              const Expanded(
                child: Text(
                  'Discuss Eligibility',
                  style: TextStyle(
                    color: textDark,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),

          AddVerticalSpacing(13.0),

          const Text(
            'Any commission, incentive or related benefit is determined according to company policies. Please contact or discuss the applicable conditions with the company administrator for further information.',
            style: TextStyle(
              color: textGrey,
              fontSize: 12.8,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImportantNote() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .12),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Icon(
                  Icons.shield_outlined,
                  color: accent,
                  size: 21,
                ),
              ),
              AddHorizontalSpacing(11.0),
              const Text(
                'Important Note',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          AddVerticalSpacing(13.0),

          Text(
            'The wallet and travel-plan features are provided for managing eligible travel-service activities. Wallet balance is not a bank deposit, investment, savings account or guaranteed-return product.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: .88),
              fontSize: 12.8,
              height: 1.6,
            ),
          ),

          AddVerticalSpacing(12.0),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Text(
              '${AppConstants.APP_NAME} does not promise fixed or guaranteed income from purchasing a travel plan.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.8,
                height: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}