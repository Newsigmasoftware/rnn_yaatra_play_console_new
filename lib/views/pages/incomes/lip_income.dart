// // ignore_for_file: use_super_parameters

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:intl/intl.dart';
// import 'package:rnn_yaatra/constants/colors.dart';
// import 'package:rnn_yaatra/constants/constants.dart';
// import 'package:rnn_yaatra/constants/images.dart';
// import 'package:rnn_yaatra/utils/double_helper.dart';
// import 'package:rnn_yaatra/utils/screen_helper.dart';
// import 'package:rnn_yaatra/utils/spacings.dart';
// import 'package:rnn_yaatra/utils/txt_styles.dart';
// import 'package:rnn_yaatra/view_models/team_view_model.dart';
// import 'package:rnn_yaatra/widgets/buttons.dart';
// import 'package:rnn_yaatra/widgets/dilougs.dart';

// class LipIncome extends ConsumerStatefulWidget {
//   const LipIncome({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LipIncomeState();
// }

// class _LipIncomeState extends ConsumerState<LipIncome> {
//   final TextEditingController _fromDateController = TextEditingController();
//   final TextEditingController _toDateController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _fetchLipIncome();
//     });
//   }

//   void _fetchLipIncome() {
//     String from = _fromDateController.text.trim();
//     String to = _toDateController.text.trim();
//     if (from == "--SELECT--") from = "";
//     if (to == "--SELECT--") to = "";

//     ref.read(getTeamViewModelGlobalNotifier.notifier).lipiIncomeApi(
//       from: from,
//       to: to,
//     );
//   }

//   Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         controller.text = DateFormat('dd-MMM-yyyy').format(picked);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final teamState = ref.watch(getTeamViewModelGlobalNotifier);
//     final loadingState = teamState.isLoadingLiPiIncome;
//     final res = teamState.lipIncomeModel?.data ?? [];

//     final totalIncome = res.fold(0.0, (sum, item) => sum + DoubleHelper.convert_string_to_double(string: item.income ?? item.totalIncome));

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: back_button_primary_bg(
//             isRounded: true,
//             onTap: () {
//               context.pop();
//             }
//           ),
//         ),
//         title: Text("LIP Income Report", style: StyleHelper.popinsStyle(fontSize: 16.0, color: AppColor.TEXT_GREY, fontWeight: FontWeight.w600)),
//       ),
//       extendBodyBehindAppBar: true,
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: SizedBox(
//               height: 320.0,
//               width: ScreenHelper().get_width(context),
//               child: Stack(
//                 children: [
//                   Positioned.fill(child: Image.asset(AppImage.LOGIN_TOP, width: ScreenHelper().get_width(context), fit: BoxFit.cover)),
//                   Positioned.fill(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       width: ScreenHelper().get_width(context),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                           colors: [
//                             AppColor.WHITE,
//                             AppColor.WHITE.withValues(alpha: 0.1),
//                             AppColor.WHITE.withValues(alpha: 0.1),
//                           ]
//                         )
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: SafeArea(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(horizontal: 15.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AddVerticalSpacing(20.0),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: AppColor.WHITE,
//                         border: Border.all(color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.2)),
//                         borderRadius: BorderRadius.circular(16.0)
//                       ),
//                       width: ScreenHelper().get_width(context),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 12.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                                   decoration: const BoxDecoration(
//                                     color: Color(0xFF0D47A1),
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(16),
//                                       bottomRight: Radius.circular(16),
//                                     ),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Icon(Iconsax.filter_search5, color: AppColor.WHITE, size: 20.0),
//                                       AddHorizontalSpacing(5.0),
//                                       Text("Filter", style: StyleHelper.popinsStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: AppColor.WHITE)),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           AddVerticalSpacing(10.0),
//                           Padding(
//                             padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text("Date From:", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
//                                           AddVerticalSpacing(5.0),
//                                           InkWell(
//                                             onTap: () => _selectDate(context, _fromDateController),
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 border: Border.all(color: AppColor.GREY_LIGHT),
//                                                 borderRadius: BorderRadius.circular(12.0)
//                                               ),
//                                               padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Iconsax.calendar5, color: AppColor.TEXT_GREY, size: 22.0),
//                                                   AddHorizontalSpacing(8.0),
//                                                   Expanded(
//                                                     child: Text(
//                                                       _fromDateController.text.isEmpty ? "--SELECT--" : _fromDateController.text,
//                                                       style: StyleHelper.popinsStyle(fontSize: 12.0, color: AppColor.TEXT_DARK),
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     AddHorizontalSpacing(15.0),
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text("Date To:", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
//                                           AddVerticalSpacing(5.0),
//                                           InkWell(
//                                             onTap: () => _selectDate(context, _toDateController),
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 border: Border.all(color: AppColor.GREY_LIGHT),
//                                                 borderRadius: BorderRadius.circular(12.0)
//                                               ),
//                                               padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//                                               child: Row(
//                                                 children: [
//                                                   Icon(Iconsax.calendar5, color: AppColor.TEXT_GREY, size: 22.0),
//                                                   AddHorizontalSpacing(8.0),
//                                                   Expanded(
//                                                     child: Text(
//                                                       _toDateController.text.isEmpty ? "--SELECT--" : _toDateController.text,
//                                                       style: StyleHelper.popinsStyle(fontSize: 12.0, color: AppColor.TEXT_DARK),
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 AddVerticalSpacing(15.0),
//                                 InkWell(
//                                   onTap: _fetchLipIncome,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: AppColor.PRIMARY_COLOR,
//                                       borderRadius: BorderRadius.circular(12.0)
//                                     ),
//                                     width: ScreenHelper().get_width(context),
//                                     padding: EdgeInsets.symmetric(vertical: 10.0),
//                                     child: RichText(
//                                       textAlign: TextAlign.center,
//                                       text: TextSpan(
//                                         children: [
//                                           TextSpan(
//                                             text: "Filter  ",
//                                             style: StyleHelper.popinsStyle(fontSize: 14.0, color: AppColor.WHITE, fontWeight: FontWeight.w500)
//                                           ),
//                                           WidgetSpan(
//                                             alignment: PlaceholderAlignment.middle,
//                                             child: Icon(Iconsax.filter_search5, color: AppColor.WHITE, size: 18.0)
//                                           ),
//                                         ]
//                                       ),
//                                     )
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     AddVerticalSpacing(20.0),
//                     Container(
//                       height: 180.0,
//                       width: ScreenHelper().get_width(context),
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(AppImage.WALLET_CARD),
//                           fit: BoxFit.fill
//                         )
//                       ),
//                       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Total Income", style: StyleHelper.popinsStyle(color: AppColor.WHITE, fontWeight: FontWeight.w500, fontSize: 15.0)),
//                           AddVerticalSpacing(5.0),
//                           Text("${AppConstants.CURRENCY_SYMBOL} ${totalIncome.toStringAsFixed(2)}", style: StyleHelper.popinsStyle(fontSize: 25.0, color: AppColor.WHITE, fontWeight: FontWeight.w600)),
//                           AddHorizontalSpacing(5.0),
//                           Text("Selected period.", style: StyleHelper.popinsStyle(color: AppColor.WHITE, fontWeight: FontWeight.w400, fontSize: 12.0)),
//                         ],
//                       ),
//                     ),
//                     AddVerticalSpacing(15.0),
//                     loadingState
//                         ? Center(child: ProgressDialog().showLoadingDot())
//                         : LipIncomeListWidget(
//                             reportData: List.generate(res.length, (index) {
//                               final data = res[index];
//                               return LipIncomeData(
//                                 sNo: index + 1,
//                                 userId: data.userId ?? '',
//                                 ctoTurnover: DoubleHelper.convert_string_to_double(string: data.turnOver),
//                                 percentage: DoubleHelper.convert_string_to_double(string: data.percentage),
//                                 totalIncome: DoubleHelper.convert_string_to_double(string: data.totalIncome),
//                                 totalUserSipAmount: DoubleHelper.convert_string_to_double(string: data.totalUserSIPAmount),
//                                 sipRate: '${data.sIPRate ?? '0'}%',
//                                 userWiseSipIncome: DoubleHelper.convert_string_to_double(string: data.teamSIP),
//                                 income: DoubleHelper.convert_string_to_double(string: data.income ?? data.totalIncome),
//                                 entryDate: data.entrydate ?? '',
//                               );
//                             }),
//                           ),
//                     AddVerticalSpacing(50.0),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LipIncomeListWidget extends StatefulWidget {
//   final List<LipIncomeData> reportData;

//   const LipIncomeListWidget({
//     Key? key,
//     required this.reportData,
//   }) : super(key: key);

//   @override
//   State<LipIncomeListWidget> createState() => _LipIncomeListWidgetState();
// }

// class _LipIncomeListWidgetState extends State<LipIncomeListWidget> {
//   late List<LipIncomeData> _filteredData;
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _filteredData = widget.reportData;
//   }

//   @override
//   void didUpdateWidget(covariant LipIncomeListWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.reportData != widget.reportData) {
//       _filteredData = widget.reportData;
//       _searchController.clear();
//     }
//   }

//   void _filterData(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         _filteredData = widget.reportData;
//       } else {
//         _filteredData = widget.reportData.where((item) {
//           final q = query.toLowerCase();
//           return item.userId.toLowerCase().contains(q) ||
//               item.entryDate.toLowerCase().contains(q) ||
//               item.income.toString().contains(q) ||
//               item.sipRate.toLowerCase().contains(q);
//         }).toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.03),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: TextField(
//             controller: _searchController,
//             onChanged: _filterData,
//             style: const TextStyle(fontSize: 13),
//             decoration: InputDecoration(
//               hintText: 'Search by User ID, Date, Rate...',
//               hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
//               prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF0D47A1)),
//               contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
//               filled: true,
//               fillColor: const Color(0xFFF8F9FA),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//         _filteredData.isEmpty
//             ? _buildEmptyState()
//             : ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: _filteredData.length,
//                 separatorBuilder: (_, __) => const SizedBox(height: 12),
//                 itemBuilder: (context, index) {
//                   final item = _filteredData[index];
//                   return Container(
//                     padding: const EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14),
//                       border: Border.all(color: AppColor.SECONDARY_COLOR.withValues(alpha: 0.3)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withValues(alpha: 0.1),
//                           blurRadius: 6,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFB06000),
//                                     borderRadius: BorderRadius.circular(6),
//                                   ),
//                                   child: Text(
//                                     item.userId,
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 11,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFFEF7E0),
//                                     borderRadius: BorderRadius.circular(6),
//                                   ),
//                                   child: Text(
//                                     '${item.percentage}% CTO Rate',
//                                     style: const TextStyle(
//                                       color: Color(0xFFB06000),
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Text(
//                               '+ ₹ ${item.income.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF137333),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 10),
//                           child: Divider(height: 1, color: Color(0xFFF1F3F4)),
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildMetricTile(
//                                 label: 'CTO (TurnOver)',
//                                 value: '₹ ${item.ctoTurnover.toStringAsFixed(2)}',
//                               ),
//                             ),
//                             Expanded(
//                               child: _buildMetricTile(
//                                 label: 'Total Income Pool',
//                                 value: '₹ ${item.totalIncome.toStringAsFixed(2)}',
//                               ),
//                             ),
//                             Expanded(
//                               child: _buildMetricTile(
//                                 label: 'Total User SIP',
//                                 value: '₹ ${item.totalUserSipAmount.toStringAsFixed(2)}',
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFFF8F9FA),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'SIP Rate: ${item.sipRate}',
//                                 style: const TextStyle(
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xFF5F6368),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   'User Wise SIP: ₹ ${item.userWiseSipIncome.toStringAsFixed(2)}',
//                                   style: const TextStyle(
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xFF202124),
//                                   ),
//                                   textAlign: TextAlign.end,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Icon(Icons.calendar_today_outlined, size: 12, color: AppColor.PRIMARY_COLOR),
//                             const SizedBox(width: 4),
//                             Text(
//                               item.entryDate,
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 color: AppColor.PRIMARY_COLOR,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//       ],
//     );
//   }

//   Widget _buildMetricTile({
//     required String label,
//     required String value,
//   }) {
//     return Column(
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 10,
//             color: AppColor.TEXT_DARK,
//             fontWeight: FontWeight.w500,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 2),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 11,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF202124),
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }

//   Widget _buildEmptyState() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 32),
//       width: double.infinity,
//       child: const Column(
//         children: [
//           Icon(Icons.inbox_rounded, size: 48, color: Color(0xFFBDBDBD)),
//           SizedBox(height: 8),
//           Text(
//             'No LIP income data available',
//             style: TextStyle(fontSize: 13, color: Color(0xFF757575), fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class LipIncomeData {
//   final int sNo;
//   final String userId;
//   final double ctoTurnover;
//   final double percentage;
//   final double totalIncome;
//   final double totalUserSipAmount;
//   final String sipRate;
//   final double userWiseSipIncome;
//   final double income;
//   final String entryDate;

//   LipIncomeData({
//     required this.sNo,
//     required this.userId,
//     required this.ctoTurnover,
//     required this.percentage,
//     required this.totalIncome,
//     required this.totalUserSipAmount,
//     required this.sipRate,
//     required this.userWiseSipIncome,
//     required this.income,
//     required this.entryDate,
//   });
// }
