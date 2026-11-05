// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:intl/intl.dart';
// import 'package:rnn_yaatra/constants/colors.dart'; 
// import 'package:rnn_yaatra/models/get_team__model.dart';
// import 'package:rnn_yaatra/utils/double_helper.dart';
// import 'package:rnn_yaatra/utils/screen_helper.dart';
// import 'package:rnn_yaatra/utils/spacings.dart';
// import 'package:rnn_yaatra/utils/txt_styles.dart';
// import 'package:rnn_yaatra/view_models/team_view_model.dart';
// import 'package:rnn_yaatra/widgets/app_bar.dart';
// import 'package:rnn_yaatra/widgets/dilougs.dart';

// class DirectTeam extends ConsumerStatefulWidget {
//   const DirectTeam({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _DirectTeamState();
// }

// class _DirectTeamState extends ConsumerState<DirectTeam> {

//   final TextEditingController _fromDateController = TextEditingController();
//   final TextEditingController _toDateController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       ref.read(getTeamViewModelGlobalNotifier.notifier).get_direct_team(
//         from: _fromDateController.text,
//         to: _toDateController.text,
//       );
//     });
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
//     final isLoading = teamState.isLoadingDirectTeam;
//     final teamData = teamState.directTeamModel?.data ?? [];

//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Direct Team",
//         onBackPressed: (){
//           context.pop();
//         },
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AddVerticalSpacing(15.0),
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColor.WHITE,
//                 border: Border.all(color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.2)),
//                 borderRadius: BorderRadius.circular(16.0)
//               ),
//               width: ScreenHelper().get_width(context),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 12.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                           decoration: const BoxDecoration(
//                             color: Color(0xFF0D47A1),
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(16),
//                               bottomRight: Radius.circular(16),
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(Iconsax.filter_search5,color: AppColor.WHITE,size: 20.0),
//                               AddHorizontalSpacing(5.0),
//                               Text("Filter",style: StyleHelper.popinsStyle(fontSize: 15.0,fontWeight: FontWeight.w600,color: AppColor.WHITE)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   AddVerticalSpacing(10.0),
//                   Padding(
//                     padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Date From:",style: StyleHelper.popinsStyle(fontSize: 13.0,fontWeight: FontWeight.w600)),
//                                   AddVerticalSpacing(5.0),
//                                   InkWell(
//                                     onTap: () => _selectDate(context, _fromDateController),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: AppColor.GREY_LIGHT),
//                                         borderRadius: BorderRadius.circular(12.0)
//                                       ),
//                                       padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
//                                       child: Row(
//                                         children: [
//                                           Icon(Iconsax.calendar5,color: AppColor.TEXT_GREY,size: 22.0,),
//                                           AddHorizontalSpacing(8.0),
//                                           Expanded(
//                                             child: Text(_fromDateController.text.isEmpty ? "--SELECT--" : _fromDateController.text,
//                                               style: StyleHelper.popinsStyle(fontSize: 12.0,color: AppColor.TEXT_DARK),),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             AddHorizontalSpacing(15.0),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Date To:",style: StyleHelper.popinsStyle(fontSize: 13.0,fontWeight: FontWeight.w600)),
//                                   AddVerticalSpacing(5.0),
//                                   InkWell(
//                                     onTap: () => _selectDate(context, _toDateController),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: AppColor.GREY_LIGHT),
//                                         borderRadius: BorderRadius.circular(12.0)
//                                       ),
//                                       padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
//                                       child: Row(
//                                         children: [
//                                           Icon(Iconsax.calendar5,color: AppColor.TEXT_GREY,size: 22.0,),
//                                           AddHorizontalSpacing(8.0),
//                                           Expanded(
//                                             child: Text(_toDateController.text.isEmpty ? "--SELECT--" : _toDateController.text,
//                                               style: StyleHelper.popinsStyle(fontSize: 12.0,color: AppColor.TEXT_DARK),),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),

//                         AddVerticalSpacing(15.0),
//                         InkWell(
//                           onTap: () async {
//                             ref.read(getTeamViewModelGlobalNotifier.notifier).get_direct_team(
//                               from: _fromDateController.text,
//                               to: _toDateController.text,
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: AppColor.PRIMARY_COLOR,
//                               borderRadius: BorderRadius.circular(12.0)
//                             ),
//                             width: ScreenHelper().get_width(context),
//                             padding: EdgeInsets.symmetric(vertical: 10.0),
//                             child: RichText(
//                               textAlign: TextAlign.center,
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: "Filter  ",
//                                     style: StyleHelper.popinsStyle(fontSize: 14.0,color: AppColor.WHITE,fontWeight: FontWeight.w500)
//                                   ),
//                                   WidgetSpan(
//                                     alignment: PlaceholderAlignment.middle,
//                                     child: Icon(Iconsax.filter_search5,color: AppColor.WHITE,size: 18.0,)
//                                   ),
//                                 ]
//                               ),
//                             )
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             AddVerticalSpacing(10.0),
//             isLoading 
//               ? Center(child: ProgressDialog().showLoadingDot())
//               : DirectTeamListWidget(reportData: teamData),
            
//             AddVerticalSpacing(60.0),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DirectTeamListWidget extends StatefulWidget {
//   final List<Data> reportData;

//   const DirectTeamListWidget({
//     Key? key,
//     required this.reportData,
//   }) : super(key: key);

//   @override
//   State<DirectTeamListWidget> createState() => _DirectTeamListWidgetState();
// }

// class _DirectTeamListWidgetState extends State<DirectTeamListWidget> {
//   late List<Data> _filteredData;
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _filteredData = widget.reportData;
//   }

//   @override
//   void didUpdateWidget(covariant DirectTeamListWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if(oldWidget.reportData != widget.reportData){
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
//           return (item.userId?.toLowerCase().contains(q) ?? false) ||
//               (item.userName?.toLowerCase().contains(q) ?? false) ||
//               (item.sponsorId?.toLowerCase().contains(q) ?? false) ||
//               (item.regDate?.toLowerCase().contains(q) ?? false);
//         }).toList();
//       }
//     });
//   }

//   double get _totalPackageAmount {
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
//                     const Text(
//                       'Total Package Amount',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF1967D2),
//                       ),
//                     ),
//                     Text(
//                       '₹ ${_totalPackageAmount.toStringAsFixed(2)}',
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
//                   hintText: 'Search User ID, Name, Sponsor ID...',
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
//                   final packageAmt = DoubleHelper.convert_string_to_double(string: item.topupAmount);
//                   final isPaid = packageAmt > 0;

//                   return Container(
//                     padding: const EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14),
//                       border: Border.all(
//                         color: isPaid
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
//                                       AddHorizontalSpacing(6.0),

//                                       // Container(
//                                       //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                                       //   decoration: BoxDecoration(
//                                       //     color: isPaid
//                                       //         ? const Color(0xFFE6F4EA)
//                                       //         : const Color(0xFFFFEBEE),
//                                       //     borderRadius: BorderRadius.circular(6),
//                                       //   ),
//                                       //   child: Text(
//                                       //     isPaid ? 'ACTIVE' : 'UNPAID',
//                                       //     style: TextStyle(
//                                       //       color: isPaid
//                                       //           ? const Color(0xFF137333)
//                                       //           : const Color(0xFFC62828),
//                                       //       fontWeight: FontWeight.bold,
//                                       //       fontSize: 10,
//                                       //     ),
//                                       //   ),
//                                       // ),
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
//                               '₹ ${packageAmt.toStringAsFixed(2)}',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: isPaid ? const Color(0xFF137333) : AppColor.TEXT_DARK,
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
//                             Text(
//                               'Sponsor ID: ',
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 color: AppColor.TEXT_DARK,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               item.sponsorId ?? "",
//                               style: const TextStyle(
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF202124),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFFF8F9FA),
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
//                                     const Text(
//                                       'Activation Date:',
//                                       style: TextStyle(fontSize: 10, color: Color(0xFF5F6368)),
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
//       child: const Column(
//         children: [
//           Icon(Icons.people_outline, size: 48, color: Color(0xFFBDBDBD)),
//           SizedBox(height: 8),
//           Text(
//             'No direct team members found',
//             style: TextStyle(fontSize: 13, color: Color(0xFF757575), fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }
