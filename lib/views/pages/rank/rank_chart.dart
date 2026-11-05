// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:rnn_yaatra/constants/colors.dart';
// import 'package:rnn_yaatra/constants/images.dart';
// import 'package:rnn_yaatra/utils/double_helper.dart';
// import 'package:rnn_yaatra/utils/screen_helper.dart';
// import 'package:rnn_yaatra/utils/spacings.dart';
// import 'package:rnn_yaatra/utils/txt_styles.dart';
// import 'package:rnn_yaatra/view_models/team_view_model.dart';
// import 'package:rnn_yaatra/widgets/buttons.dart';
// import 'package:rnn_yaatra/widgets/dilougs.dart';

// class RankChart extends ConsumerStatefulWidget {
//   const RankChart({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _RankChartState();
// }

// class _RankChartState extends ConsumerState<RankChart> {

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(getTeamViewModelGlobalNotifier.notifier).rankChartApi();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final teamState = ref.watch(getTeamViewModelGlobalNotifier);
//     final isLoading = teamState.isLoadingRankChart;
//     final rankData = teamState.rankChartModel?.data ?? [];

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
//         title: Text("Rank Chart", style: StyleHelper.popinsStyle(fontSize: 16.0, color: AppColor.TEXT_GREY, fontWeight: FontWeight.w600)),
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
//                     isLoading
//                         ? Center(child: ProgressDialog().showLoadingDot())
//                         : RankSalaryListWidget(
//                             reportData: List.generate(rankData.length, (index) {
//                               final data = rankData[index];
//                               return RankSalaryData(
//                                 rank: index + 1,
//                                 targetTeam: data.rankName ?? data.targetTeam ?? 'Slab-${index + 1}',
//                                 leftTeam: DoubleHelper.convert_string_to_double(string: data.leftTeam),
//                                 rightTeam: DoubleHelper.convert_string_to_double(string: data.rightTeam),
//                                 salaryAmount: DoubleHelper.convert_string_to_double(string: data.salaryAmount),
//                                 entryDate: data.entryDate ?? '-',
//                                 status: data.statusMobile ?? data.status ?? 'Not Achieved',
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

// class RankSalaryListWidget extends StatefulWidget {
//   final List<RankSalaryData> reportData;

//   const RankSalaryListWidget({
//     Key? key,
//     required this.reportData,
//   }) : super(key: key);

//   @override
//   State<RankSalaryListWidget> createState() => _RankSalaryListWidgetState();
// }

// class _RankSalaryListWidgetState extends State<RankSalaryListWidget> {
//   late List<RankSalaryData> _filteredData;
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _filteredData = widget.reportData;
//   }

//   @override
//   void didUpdateWidget(covariant RankSalaryListWidget oldWidget) {
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
//           return item.targetTeam.toLowerCase().contains(q) ||
//               item.status.toLowerCase().contains(q) ||
//               item.salaryAmount.toString().contains(q);
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
//               hintText: 'Search Slab, Salary, or Status...',
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
//                 separatorBuilder: (_, __) => const SizedBox(height: 10),
//                 itemBuilder: (context, index) {
//                   final item = _filteredData[index];
//                   final isAchieved = item.status.toLowerCase() == 'achieved';

//                   return Container(
//                     padding: const EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14),
//                       border: Border.all(
//                         color: isAchieved
//                             ? const Color(0xFFC8E6C9)
//                             : const Color(0xFFE0E0E0),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withValues(alpha: 0.03),
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
//                                 CircleAvatar(
//                                   radius: 12,
//                                   backgroundColor: const Color(0xFF0D47A1),
//                                   child: Text(
//                                     '${item.rank}',
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   item.targetTeam,
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xFF202124),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: isAchieved
//                                     ? const Color(0xFFE6F4EA)
//                                     : const Color(0xFFFFEBEE),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Text(
//                                 item.status,
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.bold,
//                                   color: isAchieved
//                                       ? const Color(0xFF137333)
//                                       : const Color(0xFFC62828),
//                                 ),
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
//                               flex: 2,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Team Progress (Left / Right)',
//                                     style: TextStyle(
//                                       fontSize: 10,
//                                       color: AppColor.TEXT_DARK,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     '${item.leftTeam.toStringAsFixed(0)}  /  ${item.rightTeam.toStringAsFixed(0)}',
//                                     style: const TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF0D47A1),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'Salary Reward',
//                                     style: TextStyle(
//                                       fontSize: 10,
//                                       color: AppColor.TEXT_DARK,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     '₹ ${item.salaryAmount.toStringAsFixed(0)}',
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF137333),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         if (item.entryDate.isNotEmpty && item.entryDate != '-') ...[
//                           const SizedBox(height: 8),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               const Icon(Icons.calendar_today_outlined, size: 11, color: Color(0xFF757575)),
//                               const SizedBox(width: 4),
//                               Text(
//                                 item.entryDate,
//                                 style: const TextStyle(
//                                   fontSize: 10,
//                                   color: Color(0xFF757575),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ],
//                     ),
//                   );
//                 },
//               ),
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
//             'No slab data available',
//             style: TextStyle(fontSize: 13, color: Color(0xFF757575), fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RankSalaryData {
//   final int rank;
//   final String targetTeam;
//   final double leftTeam;
//   final double rightTeam;
//   final double salaryAmount;
//   final String entryDate;
//   final String status;

//   RankSalaryData({
//     required this.rank,
//     required this.targetTeam,
//     required this.leftTeam,
//     required this.rightTeam,
//     required this.salaryAmount,
//     required this.entryDate,
//     required this.status,
//   });
// }
