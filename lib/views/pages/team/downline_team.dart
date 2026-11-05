// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:intl/intl.dart';
// import 'package:rnn_yaatra/constants/colors.dart';
// import 'package:rnn_yaatra/models/get_down_line_model.dart';
// import 'package:rnn_yaatra/utils/double_helper.dart';
// import 'package:rnn_yaatra/utils/screen_helper.dart';
// import 'package:rnn_yaatra/utils/spacings.dart';
// import 'package:rnn_yaatra/utils/txt_styles.dart';
// import 'package:rnn_yaatra/view_models/team_view_model.dart';
// import 'package:rnn_yaatra/widgets/app_bar.dart';
// import 'package:rnn_yaatra/widgets/dilougs.dart';
// import 'package:rnn_yaatra/widgets/show_bottomsheet_filter.dart';

// import '../../../helpers/navigation_helper.dart';

// class DownlineTeam extends ConsumerStatefulWidget {
//   const DownlineTeam({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _DownlineTeamState();
// }

// class _DownlineTeamState extends ConsumerState<DownlineTeam> {

//   final TextEditingController _fromDateController = TextEditingController();
//   final TextEditingController _toDateController = TextEditingController();
//   final TextEditingController _directionController = TextEditingController();
//   final TextEditingController _directionValueController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // String today = DateFormat('dd MMM yyyy').format(DateTime.now());
//       // _fromDateController.text = today;
//       // _toDateController.text = today;
//       _directionController.text = "LEFT";
//       _directionValueController.text = "1";

//       _fetchData();
//     });
//   }

//   void _fetchData() {
//     ref.read(getTeamViewModelGlobalNotifier.notifier).getDownLineTeam(
//       from: _fromDateController.text,
//       to: _toDateController.text,
//       direction: _directionValueController.text,
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
//         controller.text = DateFormat('dd MMM yyyy').format(picked);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final teamState = ref.watch(getTeamViewModelGlobalNotifier);
//     final isLoading = teamState.isLoadingDownlineTeam;
//     final reportData = teamState.downlineTeamModel?.data ?? [];

//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Total Team(${_directionController.text})",
//         onBackPressed: (){
//           context.pop();
//         },
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 15.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AddVerticalSpacing(15.0),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: AppColor.WHITE,
//                       border: Border.all(color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.2)),
//                       borderRadius: BorderRadius.circular(16.0)
//                     ),
//                     width: ScreenHelper().get_width(context),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: 12.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xFF0D47A1),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(16),
//                                     bottomRight: Radius.circular(16),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Icon(Iconsax.filter_search5,color: AppColor.WHITE,size: 20.0),
//                                     AddHorizontalSpacing(5.0),
//                                     Text("Filter",style: StyleHelper.popinsStyle(fontSize: 15.0,fontWeight: FontWeight.w600,color: AppColor.WHITE)),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         AddVerticalSpacing(10.0),
//                         Padding(
//                           padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text("Date From:",style: StyleHelper.popinsStyle(fontSize: 13.0,fontWeight: FontWeight.w600)),
//                                         AddVerticalSpacing(5.0),
//                                         InkWell(
//                                           onTap: () => _selectDate(context, _fromDateController),
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               border: Border.all(color: AppColor.GREY_LIGHT),
//                                               borderRadius: BorderRadius.circular(12.0)
//                                             ),
//                                             padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
//                                             child: Row(
//                                               children: [
//                                                 Icon(Iconsax.calendar5,color: AppColor.TEXT_GREY,size: 22.0,),
//                                                 AddHorizontalSpacing(8.0),
//                                                 Expanded(
//                                                   child: Text(_fromDateController.text.isEmpty ? "--SELECT--" : _fromDateController.text,
//                                                     style: StyleHelper.popinsStyle(fontSize: 12.0,color: AppColor.TEXT_DARK),),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   AddHorizontalSpacing(15.0),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text("Date To:",style: StyleHelper.popinsStyle(fontSize: 13.0,fontWeight: FontWeight.w600)),
//                                         AddVerticalSpacing(5.0),
//                                         InkWell(
//                                           onTap: () => _selectDate(context, _toDateController),
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               border: Border.all(color: AppColor.GREY_LIGHT),
//                                               borderRadius: BorderRadius.circular(12.0)
//                                             ),
//                                             padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
//                                             child: Row(
//                                               children: [
//                                                 Icon(Iconsax.calendar5,color: AppColor.TEXT_GREY,size: 22.0,),
//                                                 AddHorizontalSpacing(8.0),
//                                                 Expanded(
//                                                   child: Text(_toDateController.text.isEmpty ? "--SELECT--" : _toDateController.text,
//                                                     style: StyleHelper.popinsStyle(fontSize: 12.0,color: AppColor.TEXT_DARK),),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               AddVerticalSpacing(15.0),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Direction:",style: StyleHelper.popinsStyle(fontSize: 13.0,fontWeight: FontWeight.w600)),
//                                   AddVerticalSpacing(5.0),
//                                   InkWell(
//                                     onTap: () {
//                                       List itemList = [
//                                         {"title": "LEFT", "value": "1"},
//                                         {"title": "RIGHT", "value": "2"},
//                                       ];
//                                       AppNav.to(
//                                         buildContext: context,
//                                         ShowFilterBottomsheetPageRiverpod(
//                                           itemList: itemList,
//                                           filterKeyName: "title",
//                                           showKeyName: "title",
//                                           inputTitle: "Select Direction",
//                                           title: "Select Direction",
//                                           response: (res) {
//                                             setState(() {
//                                               _directionController.text = res['title'];
//                                               _directionValueController.text = res['value'];
//                                             });
//                                           },
//                                         ),
//                                       );
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: AppColor.GREY_LIGHT),
//                                         borderRadius: BorderRadius.circular(12.0)
//                                       ),
//                                       padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
//                                       child: Row(
//                                         children: [
//                                           Icon(Icons.directions,color: AppColor.TEXT_GREY,size: 22.0,),
//                                           AddHorizontalSpacing(8.0),
//                                           Expanded(
//                                             child: Text(_directionController.text.isEmpty ? "--SELECT--" : _directionController.text,
//                                               style: StyleHelper.popinsStyle(fontSize: 14.0,color: AppColor.TEXT_DARK),),
//                                           ),
//                                           Icon(Icons.arrow_drop_down,color: AppColor.GREY_MEDIUM,)
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),

//                               AddVerticalSpacing(15.0),
//                               InkWell(
//                                 onTap: _fetchData,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: AppColor.PRIMARY_COLOR,
//                                     borderRadius: BorderRadius.circular(12.0)
//                                   ),
//                                   width: ScreenHelper().get_width(context),
//                                   padding: EdgeInsets.symmetric(vertical: 10.0),
//                                   child: RichText(
//                                     textAlign: TextAlign.center,
//                                     text: TextSpan(
//                                       children: [
//                                         TextSpan(
//                                           text: "Filter  ",
//                                           style: StyleHelper.popinsStyle(fontSize: 14.0,color: AppColor.WHITE,fontWeight: FontWeight.w500)
//                                         ),
//                                         WidgetSpan(
//                                           alignment: PlaceholderAlignment.middle,
//                                           child: Icon(Iconsax.filter_search5,color: AppColor.WHITE,size: 18.0,)
//                                         ),
//                                       ]
//                                     ),
//                                   )
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   AddVerticalSpacing(10.0),
//                   isLoading 
//                     ? Center(child: ProgressDialog().showLoadingDot())
//                     : DownLineTeamListWidget(reportData: reportData, directionName: _directionController.text),
                  
//                   AddVerticalSpacing(60.0),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
 

// class DownLineTeamListWidget extends StatefulWidget {
//   final List<DownLineData> reportData;
//   final String directionName;

//   const DownLineTeamListWidget({
//     Key? key,
//     required this.reportData,
//     required this.directionName,
//   }) : super(key: key);

//   @override
//   State<DownLineTeamListWidget> createState() => _DownLineTeamListWidgetState();
// }

// class _DownLineTeamListWidgetState extends State<DownLineTeamListWidget> {
//   late List<DownLineData> _filteredData;
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _filteredData = widget.reportData;
//   }

//   @override
//   void didUpdateWidget(covariant DownLineTeamListWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if(oldWidget.reportData != widget.reportData){
//       _filteredData = widget.reportData;
//     }
//   }

//   void _filterData(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         _filteredData = widget.reportData;
//       } else {
//         _filteredData = widget.reportData.where((item) {
//           final q = query.toLowerCase();
//           return (item.userId?.toLowerCase().contains(q) ?? false) ||
//               (item.userName?.toLowerCase().contains(q) ?? false) ||
//               (item.regDate?.toLowerCase().contains(q) ?? false);
//         }).toList();
//       }
//     });
//   }

//   double get _totalAmount {
//     return _filteredData.fold(0.0, (sum, item) => sum + DoubleHelper.convert_string_to_double(string: item.topupAmount));
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
//                 color: Colors.black.withValues(alpha: 0.1),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFE8F0FE),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Total ${widget.directionName} Team Payment',
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF1967D2),
//                       ),
//                     ),
//                     Text(
//                       '₹ ${_totalAmount.toStringAsFixed(2)}',
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF0D47A1),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 10),
//               TextField(
//                 controller: _searchController,
//                 onChanged: _filterData,
//                 style: const TextStyle(fontSize: 13),
//                 decoration: InputDecoration(
//                   hintText: 'Search User ID, Name...',
//                   hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
//                   prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF0D47A1)),
//                   contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
//                   filled: true,
//                   fillColor: const Color(0xFFF8F9FA),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ],
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
//                   final topupAmt = DoubleHelper.convert_string_to_double(string: item.topupAmount);
//                   final isTopupDone = topupAmt > 0;

//                   return Container(
//                     padding: const EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14),
//                       border: Border.all(
//                         color: isTopupDone
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
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                                         decoration: BoxDecoration(
//                                           color: const Color(0xFF0D47A1),
//                                           borderRadius: BorderRadius.circular(6),
//                                         ),
//                                         child: Text(
//                                           item.userId ?? "",
//                                           style: const TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 11,
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 6),
//                                       Container(
//                                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                                         decoration: BoxDecoration(
//                                           color: isTopupDone
//                                               ? const Color(0xFFE6F4EA)
//                                               : const Color(0xFFFFEBEE),
//                                           borderRadius: BorderRadius.circular(6),
//                                         ),
//                                         child: Text(
//                                           isTopupDone ? 'TOPUP DONE' : 'INACTIVE',
//                                           style: TextStyle(
//                                             color: isTopupDone
//                                                 ? const Color(0xFF137333)
//                                                 : const Color(0xFFC62828),
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 6),
//                                   Text(
//                                     item.userName ?? "",
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF202124),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Text(
//                               '₹ ${topupAmt.toStringAsFixed(2)}',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: isTopupDone ? const Color(0xFF137333) : AppColor.TEXT_DARK,
//                               ),
//                             ),
//                           ],
//                         ),

//                         const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 10),
//                           child: Divider(height: 1, color: Color(0xFFF1F3F4)),
//                         ),

//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.1),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Joining Date:',
//                                     style: TextStyle(fontSize: 10, color: AppColor.TEXT_DARK,fontWeight: FontWeight.w600),
//                                   ),
//                                   Text(
//                                     item.regDate ?? "",
//                                     style: const TextStyle(
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.w600,
//                                       color: Color(0xFF202124),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               if (item.activationDate != null && item.activationDate!.isNotEmpty) ...[
//                                 const SizedBox(height: 4),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Activation Date:',
//                                       style: TextStyle(fontSize: 10, color: AppColor.TEXT_DARK,fontWeight: FontWeight.w600),
//                                     ),
//                                     Text(
//                                       item.activationDate!,
//                                       style: const TextStyle(
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.w600,
//                                         color: Color(0xFF137333),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ],
//                           ),
//                         ),
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
//       child: Column(
//         children: [
//           const Icon(Icons.group_outlined, size: 48, color: Color(0xFFBDBDBD)),
//           const SizedBox(height: 8),
//           Text(
//             'No members found in ${widget.directionName} Team',
//             style: const TextStyle(fontSize: 13, color: Color(0xFF757575), fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }
