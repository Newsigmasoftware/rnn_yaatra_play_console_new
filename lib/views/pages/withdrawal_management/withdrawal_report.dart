// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:intl/intl.dart';
// import 'package:rnn_yaatra/constants/colors.dart';
// import 'package:rnn_yaatra/helpers/navigation_helper.dart';
// import 'package:rnn_yaatra/models/account_models/get_withdrawal_request_list_response_model.dart';
// import 'package:rnn_yaatra/services/account_services.dart';
// import 'package:rnn_yaatra/utils/double_helper.dart';
// import 'package:rnn_yaatra/utils/screen_helper.dart';
// import 'package:rnn_yaatra/utils/spacings.dart';
// import 'package:rnn_yaatra/utils/txt_styles.dart';
// import 'package:rnn_yaatra/widgets/app_bar.dart';
// import 'package:rnn_yaatra/widgets/dilougs.dart';
// import 'package:rnn_yaatra/widgets/show_bottomsheet_filter.dart';

// class WithdrawalReport extends ConsumerStatefulWidget {
//   const WithdrawalReport({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _WithdrawalReportState();
// }

// class _WithdrawalReportState extends ConsumerState<WithdrawalReport> {
//   final TextEditingController _fromDateController = TextEditingController();
//   final TextEditingController _toDateController = TextEditingController();
//   final TextEditingController _statusController = TextEditingController();
//   final TextEditingController _statusValueController = TextEditingController();

//   final AccountServices _accountServices = AccountServices();
//   bool _isLoading = false;
//   List<WithdrawalRequestListData> _withdrawalList = [];

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _fetchWithdrawalRequestList();
//     });
//   }

//   Future<void> _fetchWithdrawalRequestList() async {
//     setState(() {
//       _isLoading = true;
//     });

//     String from = _fromDateController.text.trim();
//     String to = _toDateController.text.trim();
//     if (from == "--SELECT--") from = "";
//     if (to == "--SELECT--") to = "";

//     String status = _statusValueController.text.trim();

//     try {
//       final res = await _accountServices.getWithdrawalRequestList(

//         from: from,
//         to: to,
//         status: status,
//       );
//       if (mounted) {
//         setState(() {
//           _withdrawalList = res.data ?? [];
//         });
//       }
//     } catch (e) {
//       if (mounted) {
//         setState(() {
//           _withdrawalList = [];
//         });
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
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
//   void dispose() {
//     _fromDateController.dispose();
//     _toDateController.dispose();
//     _statusController.dispose();
//     _statusValueController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Payment Records",
//         onBackPressed: () {
//           context.pop();
//         },
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
//                               Icon(Iconsax.filter_search5, color: AppColor.WHITE, size: 20.0),
//                               AddHorizontalSpacing(5.0),
//                               Text("Filter", style: StyleHelper.popinsStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: AppColor.WHITE)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   AddVerticalSpacing(10.0),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Date From:", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
//                                   AddVerticalSpacing(5.0),
//                                   InkWell(
//                                     onTap: () => _selectDate(context, _fromDateController),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: AppColor.GREY_LIGHT),
//                                         borderRadius: BorderRadius.circular(12.0)
//                                       ),
//                                       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//                                       child: Row(
//                                         children: [
//                                           Icon(Iconsax.calendar5, color: AppColor.TEXT_GREY, size: 22.0),
//                                           AddHorizontalSpacing(8.0),
//                                           Expanded(
//                                             child: Text(
//                                               _fromDateController.text.isEmpty ? "--SELECT--" : _fromDateController.text,
//                                               style: StyleHelper.popinsStyle(fontSize: 12.0, color: AppColor.TEXT_DARK),
//                                             ),
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
//                                   Text("Date To:", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
//                                   AddVerticalSpacing(5.0),
//                                   InkWell(
//                                     onTap: () => _selectDate(context, _toDateController),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: AppColor.GREY_LIGHT),
//                                         borderRadius: BorderRadius.circular(12.0)
//                                       ),
//                                       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//                                       child: Row(
//                                         children: [
//                                           Icon(Iconsax.calendar5, color: AppColor.TEXT_GREY, size: 22.0),
//                                           AddHorizontalSpacing(8.0),
//                                           Expanded(
//                                             child: Text(
//                                               _toDateController.text.isEmpty ? "--SELECT--" : _toDateController.text,
//                                               style: StyleHelper.popinsStyle(fontSize: 12.0, color: AppColor.TEXT_DARK),
//                                             ),
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
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Status:", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
//                                   AddVerticalSpacing(5.0),
//                                   InkWell(
//                                     onTap: () {
//                                       List itemList = [
//                                         {"title": "All", "value": ""},
//                                         {"title": "Pending", "value": "Pending"},
//                                         {"title": "Approved / Paid", "value": "Approved"},
//                                         {"title": "Reject", "value": "Reject"},
//                                       ];
//                                       AppNav.to(
//                                         buildContext: context,
//                                         ShowFilterBottomsheetPageRiverpod(
//                                           itemList: itemList,
//                                           filterKeyName: "title",
//                                           showKeyName: "title",
//                                           inputTitle: "Select Status",
//                                           title: "Select Status",
//                                           response: (res) {
//                                             setState(() {
//                                               _statusController.text = res['title'] ?? "";
//                                               _statusValueController.text = res['value'] ?? "";
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
//                                       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//                                       child: Row(
//                                         children: [
//                                           Icon(Icons.swap_vert, color: AppColor.TEXT_GREY, size: 22.0),
//                                           AddHorizontalSpacing(8.0),
//                                           Expanded(
//                                             child: Text(
//                                               _statusController.text.isEmpty ? "--SELECT--" : _statusController.text,
//                                               style: StyleHelper.popinsStyle(fontSize: 12.0, color: AppColor.TEXT_DARK),
//                                             ),
//                                           ),
//                                           Icon(Icons.arrow_drop_down, color: AppColor.GREY_MEDIUM)
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
//                           onTap: _fetchWithdrawalRequestList,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: AppColor.PRIMARY_COLOR,
//                               borderRadius: BorderRadius.circular(12.0)
//                             ),
//                             width: ScreenHelper().get_width(context),
//                             padding: const EdgeInsets.symmetric(vertical: 10.0),
//                             child: RichText(
//                               textAlign: TextAlign.center,
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: "Filter  ",
//                                     style: StyleHelper.popinsStyle(fontSize: 14.0, color: AppColor.WHITE, fontWeight: FontWeight.w500)
//                                   ),
//                                   WidgetSpan(
//                                     alignment: PlaceholderAlignment.middle,
//                                     child: Icon(Iconsax.filter_search5, color: AppColor.WHITE, size: 18.0)
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
//             AddVerticalSpacing(15.0),
//             _isLoading
//                 ? Center(child: ProgressDialog().showLoadingDot())
//                 : WithdrawalDetailListWidget(
//                     reportData: List.generate(_withdrawalList.length, (index) {
//                       final item = _withdrawalList[index];
//                       double netAmt = DoubleHelper.convert_string_to_double(string: item.paybleAmount);
//                       double totalAmt = DoubleHelper.convert_string_to_double(string: item.totalIncome);
//                       if (netAmt == 0.0 && totalAmt > 0.0) {
//                         netAmt = totalAmt;
//                       }

//                       return WithdrawalDetailData(
//                         sNo: index + 1,
//                         date: item.generateDate?.isNotEmpty == true ? item.generateDate! : (item.fromdate ?? ''),
//                         amount: totalAmt,
//                         adminCharge: DoubleHelper.convert_string_to_double(string: item.adminCharge),
//                         tds: DoubleHelper.convert_string_to_double(string: item.tds),
//                         netAmount: netAmt,
//                         status: item.status ?? 'Pending',
//                         approveDate: item.paymentDate ?? '',
//                         transactionId: item.transactionID ?? '',
//                         accountHolderName: (item.accountHolderName?.isNotEmpty == true) ? item.accountHolderName! : (item.userName ?? ''),
//                         bankName: item.bankName ?? 'NA',
//                       );
//                     }),
//                   ),
//             AddVerticalSpacing(60.0),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class WithdrawalDetailListWidget extends StatefulWidget {
//   final List<WithdrawalDetailData> reportData;

//   const WithdrawalDetailListWidget({
//     Key? key,
//     required this.reportData,
//   }) : super(key: key);

//   @override
//   State<WithdrawalDetailListWidget> createState() => _WithdrawalDetailListWidgetState();
// }

// class _WithdrawalDetailListWidgetState extends State<WithdrawalDetailListWidget> {
//   late List<WithdrawalDetailData> _filteredData;
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _filteredData = widget.reportData;
//   }

//   @override
//   void didUpdateWidget(covariant WithdrawalDetailListWidget oldWidget) {
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
//           return item.date.toLowerCase().contains(q) ||
//               item.status.toLowerCase().contains(q) ||
//               item.transactionId.toLowerCase().contains(q) ||
//               item.accountHolderName.toLowerCase().contains(q) ||
//               item.bankName.toLowerCase().contains(q);
//         }).toList();
//       }
//     });
//   }

//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'approved':
//       case 'paid':
//         return const Color(0xFF137333);
//       case 'reject':
//       case 'rejected':
//         return const Color(0xFFC62828);
//       case 'pending':
//       default:
//         return const Color(0xFFB06000);
//     }
//   }

//   Color _getStatusBgColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'approved':
//       case 'paid':
//         return const Color(0xFFE6F4EA);
//       case 'reject':
//       case 'rejected':
//         return const Color(0xFFFFEBEE);
//       case 'pending':
//       default:
//         return const Color(0xFFFEF7E0);
//     }
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
//           child: TextField(
//             controller: _searchController,
//             onChanged: _filterData,
//             style: const TextStyle(fontSize: 13),
//             decoration: InputDecoration(
//               hintText: 'Search Txn ID, Bank, Name, Date...',
//               hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
//               prefixIcon: Icon(Icons.search, size: 20, color: AppColor.TEXT_DARK),
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
//                   final statusColor = _getStatusColor(item.status);
//                   final statusBg = _getStatusBgColor(item.status);

//                   return Container(
//                     padding: const EdgeInsets.all(14),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14),
//                       border: Border.all(color: const Color(0xFFE0E0E0)),
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
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Net Payable Amount',
//                                   style: TextStyle(
//                                     fontSize: 11,
//                                     color: AppColor.TEXT_GREY,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 2),
//                                 Text(
//                                   '₹ ${item.netAmount.toStringAsFixed(2)}',
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xFF137333),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: statusBg,
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               child: Text(
//                                 item.status.toUpperCase(),
//                                 style: TextStyle(
//                                   color: statusColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 11,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),

//                         const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 10),
//                           child: Divider(height: 1, color: Color(0xFFF1F3F4)),
//                         ),

//                         Container(
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFFF8F9FA),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               _buildAmountColumn('Requested', item.amount),
//                               _buildAmountColumn('Admin Charge', item.adminCharge, isDeduction: true),
//                               _buildAmountColumn('TDS', item.tds, isDeduction: true),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             const Icon(Icons.account_balance_outlined, size: 16, color: Color(0xFF5F6368)),
//                             const SizedBox(width: 6),
//                             Expanded(
//                               child: Text(
//                                 '${item.bankName} - ${item.accountHolderName}',
//                                 style: const TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xFF202124),
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),

//                         const SizedBox(height: 6),

//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 item.transactionId.isNotEmpty ? 'Txn ID: ${item.transactionId}' : 'Txn ID: N/A',
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   color: AppColor.TEXT_DARK,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               'Date: ${item.date}',
//                               style: TextStyle(
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColor.TEXT_DARK,
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

//   Widget _buildAmountColumn(String label, double val, {bool isDeduction = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 10, color: AppColor.TEXT_DARK),
//         ),
//         const SizedBox(height: 2),
//         Text(
//           '${isDeduction ? "-" : ""}₹ ${val.toStringAsFixed(2)}',
//           style: TextStyle(
//             fontSize: 11,
//             fontWeight: FontWeight.w600,
//             color: isDeduction ? const Color(0xFFC62828) : const Color(0xFF202124),
//           ),
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
//           Icon(Icons.payments_outlined, size: 48, color: Color(0xFFBDBDBD)),
//           SizedBox(height: 8),
//           Text(
//             'No Payment Records details available',
//             style: TextStyle(fontSize: 13, color: Color(0xFF757575), fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class WithdrawalDetailData {
//   final int sNo;
//   final String date;
//   final double amount;
//   final double adminCharge;
//   final double tds;
//   final double netAmount;
//   final String status;
//   final String approveDate;
//   final String transactionId;
//   final String accountHolderName;
//   final String bankName;

//   WithdrawalDetailData({
//     required this.sNo,
//     required this.date,
//     required this.amount,
//     required this.adminCharge,
//     required this.tds,
//     required this.netAmount,
//     required this.status,
//     required this.approveDate,
//     required this.transactionId,
//     required this.accountHolderName,
//     required this.bankName,
//   });
// }
