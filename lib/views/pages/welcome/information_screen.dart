// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:rnn_yaatra/constants/colors.dart';
// import 'package:rnn_yaatra/constants/constants.dart';
// import 'package:rnn_yaatra/helpers/navigation_helper.dart';
// import 'package:rnn_yaatra/utils/spacings.dart';
// import 'package:rnn_yaatra/utils/txt_styles.dart';
// import 'package:rnn_yaatra/widgets/buttons.dart';


// class ImportantInformationScreen extends StatelessWidget {
//   const ImportantInformationScreen({super.key});

//   static const Color primaryColor = AppColor.PRIMARY_COLOR;
//   static const Color accentColor = AppColor.SECONDARY_COLOR;
//   static const Color backgroundColor = Color(0xFFF6F8FC);
//   static const Color textColor = Color(0xFF172033);
//   static const Color secondaryTextColor = Color(0xFF667085);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       // appBar: AppBar(
//       //   elevation: 0,
//       //   backgroundColor: Colors.white,
//       //   surfaceTintColor: Colors.white,
//       //   leading: IconButton(
//       //     onPressed: () => Navigator.pop(context),
//       //     icon: const Icon(
//       //       Icons.arrow_back_ios_new_rounded,
//       //       size: 20,
//       //       color: primaryColor,
//       //     ),
//       //   ),
//       //   title: const Text(
//       //     'Important Information',
//       //     style: TextStyle(
//       //       color: primaryColor,
//       //       fontSize: 19,
//       //       fontWeight: FontWeight.w700,
//       //     ),
//       //   ),
//       // ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Align(
//               //   alignment: Alignment.center,
//               //   child: CustomInkWell(
//               //     onTap: (){
//               //       context.pop();
//               //     },
//               //     child: CircleAvatar(
//               //       radius: 25.0,
//               //       backgroundColor: AppColor.BLACK,
//               //       child: Icon(Icons.close,color: AppColor.WHITE,size: 24.0),
//               //     ),
//               //   ),
//               // ),

//               Row(
//                 children: [
//                   back_button_primary_bg(
//                     isRounded: true,
//                     onTap: (){
//                       context.pop();
//                     }
//                   ),
//                   AddHorizontalSpacing(15.0),
//                   Expanded(
//                     child: Text("Important Information",style: StyleHelper.popinsStyle(fontSize: 15.0,color: AppColor.PRIMARY_COLOR,fontWeight: FontWeight.w600)),
//                   ),
//                 ],
//               ),
//               AddVerticalSpacing(15.0),

//               _buildHeroCard(),
              
//               AddVerticalSpacing(18.0),
          
//               _buildSection(
//                 icon: Icons.info_outline_rounded,
//                 title: 'About ${AppConstants.APP_NAME}',
//                 child: const Text(
//                   '${AppConstants.APP_NAME} is a business and travel services platform designed to help registered associates manage customer-related business activities, travel service bookings, commission records and other account-related information provided by the company.',
//                   style: _bodyStyle,
//                 ),
//               ),
          
//               _buildSection(
//                 icon: Icons.account_balance_outlined,
//                 title: 'Not a Banking or Investment Platform',
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildHighlight(
//                       icon: Icons.block_rounded,
//                       text:
//                           '${AppConstants.APP_NAME} is not a bank, financial institution, investment platform, deposit scheme, savings account, loan service or securities/investment product.',
//                     ),
//                     AddVerticalSpacing(12.0),
//                     const Text(
//                       'Users are not required to invest money with ${AppConstants.APP_NAME} with the promise of receiving guaranteed returns, interest or investment profits.',
//                       style: _bodyStyle,
//                     ),
//                   ],
//                 ),
//               ),
          
//               _buildSection(
//                 icon: Icons.flight_takeoff_rounded,
//                 title: 'Customer Booking & Business Activity',
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Customers may purchase eligible plans or travel services offered by the company and make bookings according to the applicable terms and conditions.',
//                       style: _bodyStyle,
//                     ),
//                     AddVerticalSpacing(12.0),
//                     const Text(
//                       'Where applicable, registered associates may receive commission, incentives or other business-related earnings from eligible customer bookings or business activities as determined by the company.',
//                       style: _bodyStyle,
//                     ),
//                     AddVerticalSpacing(12.0),
//                     _buildInfoBanner(
//                       'Commission or incentives are related to business activity and are not investment returns, interest or guaranteed profits.',
//                     ),
//                   ],
//                 ),
//               ),
          
//               _buildSection(
//                 icon: Icons.payments_outlined,
//                 title: 'Commission & Earnings',
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Any commission, incentive or earning information displayed in the application represents records provided by the company based on applicable business rules and eligible transactions or bookings.',
//                       style: _bodyStyle,
//                     ),
//                     AddVerticalSpacing(12.0),
//                     const Text(
//                       'Commission or incentive amounts may vary depending on the applicable terms, eligibility and business activity.',
//                       style: _bodyStyle,
//                     ),
//                     AddVerticalSpacing(12.0),
//                     _buildWarningBanner(
//                       'No fixed or guaranteed income or return is promised through the application.',
//                     ),
//                   ],
//                 ),
//               ),
          
//               _buildSection(
//                 icon: Icons.account_balance_wallet_outlined,
//                 title: 'Wallet & Payout Information',
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Any wallet, balance or payout-related information available in the application is provided for recording and managing eligible business-related amounts and payouts.',
//                       style: _bodyStyle,
//                     ),
//                     AddVerticalSpacing(12.0),
//                     _buildHighlight(
//                       icon: Icons.info_outline_rounded,
//                       text:
//                           'These features should not be considered or interpreted as a bank account, deposit account or investment account.',
//                     ),
//                   ],
//                 ),
//               ),
          
//               _buildSection(
//                 icon: Icons.verified_user_outlined,
//                 title: 'Important Note',
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Please review the applicable company terms, eligibility conditions and booking policies before participating in any business activity or requesting a payout.',
//                       style: _bodyStyle,
//                     ),
//                     AddVerticalSpacing(14.0),
//                     _buildFinalNote(),
//                   ],
//                 ),
//               ),
          
//               AddVerticalSpacing(8.0),

              

//               // Center(
//               //   child: Text(
//               //     'RNN Yaatra',
//               //     style: TextStyle(
//               //       color: primaryColor.withOpacity(.55),
//               //       fontSize: 13,
//               //       fontWeight: FontWeight.w600,
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Consumer(
//           builder: (context, ref, child) {
//             var prop = AppNav.get_prop_request(context: context);
//             if(prop.isRedirectBack == true){
//               return Padding(
//                 padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 10.0,top: 5.0),
//                 child: primaryButton(
//                   title: "Continue",
//                   onTap: (){
//                     context.pop();
//                   }
//                 ),
//               );
//             }
//             return SizedBox();
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildHeroCard() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             primaryColor,
//             Color(0xFF0752B9),
//           ],
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: primaryColor.withOpacity(.18),
//             blurRadius: 20,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             right: -15,
//             top: -20,
//             child: Container(
//               height: 100,
//               width: 100,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white.withOpacity(.07),
//               ),
//             ),
//           ),
//           Positioned(
//             right: 35,
//             bottom: -35,
//             child: Container(
//               height: 90,
//               width: 90,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: accentColor.withOpacity(.10),
//               ),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 48,
//                 width: 48,
//                 decoration: BoxDecoration(
//                   color: accentColor,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: const Icon(
//                   Icons.travel_explore_rounded,
//                   color: Colors.white,
//                   size: 27,
//                 ),
//               ),
//               AddVerticalSpacing(16.0),
//               const Text(
//                 AppConstants.APP_NAME,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 25,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//               AddVerticalSpacing(6.0),
//               Text(
//                 'Business & Travel Services',
//                 style: TextStyle(
//                   color: Colors.white.withOpacity(.82),
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               AddVerticalSpacing(16.0),
//               Container(
//                 height: 3,
//                 width: 45,
//                 decoration: BoxDecoration(
//                   color: accentColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               AddVerticalSpacing(14.0),
//               Text(
//                 'Please read this information carefully before using the business and payout features.',
//                 style: TextStyle(
//                   color: Colors.white.withOpacity(.88),
//                   height: 1.5,
//                   fontSize: 13.5,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSection({
//     required IconData icon,
//     required String title,
//     required Widget child,
//   }) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(bottom: 14),
//       padding: const EdgeInsets.all(17),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: const Color(0xFFE8ECF3),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(.035),
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   color: primaryColor.withOpacity(.08),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Icon(
//                   icon,
//                   color: primaryColor,
//                   size: 21,
//                 ),
//               ),
//               AddHorizontalSpacing(12.0),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 8),
//                   child: Text(
//                     title,
//                     style: const TextStyle(
//                       color: textColor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           AddVerticalSpacing(15.0),
//           child,
//         ],
//       ),
//     );
//   }

//   Widget _buildHighlight({
//     required IconData icon,
//     required String text,
//   }) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(13),
//       decoration: BoxDecoration(
//         color: primaryColor.withOpacity(.055),
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(
//           color: primaryColor.withOpacity(.10),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(
//             icon,
//             color: primaryColor,
//             size: 19,
//           ),
//           AddVerticalSpacing(10.0),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 color: textColor,
//                 fontSize: 13.2,
//                 height: 1.5,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoBanner(String text) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(13),
//       decoration: BoxDecoration(
//         color: accentColor.withOpacity(.09),
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(
//           color: accentColor.withOpacity(.25),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Icon(
//             Icons.lightbulb_outline_rounded,
//             color: accentColor,
//             size: 20,
//           ),
//           AddHorizontalSpacing(9.0),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 color: textColor,
//                 fontSize: 13,
//                 height: 1.5,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildWarningBanner(String text) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(13),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFF7E6),
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(
//           color: accentColor.withOpacity(.30),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Icon(
//             Icons.warning_amber_rounded,
//             color: accentColor,
//             size: 21,
//           ),
//           AddHorizontalSpacing(9.0),
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 color: textColor,
//                 fontSize: 13,
//                 height: 1.5,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFinalNote() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: primaryColor,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(
//             Icons.shield_outlined,
//             color: accentColor,
//             size: 23,
//           ),
//           AddHorizontalSpacing(11.0),
//           Expanded(
//             child: Text(
//               '${AppConstants.APP_NAME} does not provide investment advice or banking services through this application.',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 13.2,
//                 height: 1.55,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   static const TextStyle _bodyStyle = TextStyle(
//     color: secondaryTextColor,
//     fontSize: 13.5,
//     height: 1.6,
//     fontWeight: FontWeight.w400,
//   );
// }