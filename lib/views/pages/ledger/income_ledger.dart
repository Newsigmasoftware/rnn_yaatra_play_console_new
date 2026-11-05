// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:intl/intl.dart';
// import 'package:rnn_yaatra/constants/colors.dart';
// import 'package:rnn_yaatra/helpers/navigation_helper.dart';
// import 'package:rnn_yaatra/models/account_models/get_transaction_detail_response_model.dart';
// import 'package:rnn_yaatra/services/account_services.dart';
// import 'package:rnn_yaatra/utils/double_helper.dart';
// import 'package:rnn_yaatra/utils/screen_helper.dart';
// import 'package:rnn_yaatra/utils/spacings.dart';
// import 'package:rnn_yaatra/utils/txt_styles.dart';
// import 'package:rnn_yaatra/widgets/app_bar.dart';
// import 'package:rnn_yaatra/widgets/dilougs.dart';
// import 'package:rnn_yaatra/widgets/show_bottomsheet_filter.dart';

// class IncomeLedger extends ConsumerStatefulWidget {
//   const IncomeLedger({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _IncomeLedgerState();
// }

// class _IncomeLedgerState extends ConsumerState<IncomeLedger> {
//   final TextEditingController _fromDateController = TextEditingController();
//   final TextEditingController _toDateController = TextEditingController();
//   final TextEditingController _walletTypeController = TextEditingController();
//   final TextEditingController _walletTypeValueController = TextEditingController();

//   final AccountServices _accountServices = AccountServices();
//   bool _isLoading = false;
//   List<TransactionDetailItem> _transactionList = [];

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _fetchTransactionDetail();
//     });
//   }

//   Future<void> _fetchTransactionDetail() async {
//     setState(() {
//       _isLoading = true;
//     });

//     String from = _fromDateController.text.trim();
//     String to = _toDateController.text.trim();
//     if (from == "--SELECT--") from = "";
//     if (to == "--SELECT--") to = "";

//     String type = _walletTypeValueController.text.trim();

//     try {
//       final res = await _accountServices.getTransactionDetail(
//         from: from,
//         to: to,
//         type: type,
//       );
//       if (mounted) {
//         setState(() {
//           _transactionList = res.data ?? [];
//         });
//       }
//     } catch (e) {
//       if (mounted) {
//         setState(() {
//           _transactionList = [];
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
//     _walletTypeController.dispose();
//     _walletTypeValueController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Transaction Detail",
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Wallet / Transaction Type:", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
//                             AddVerticalSpacing(5.0),
//                             InkWell(
//                               onTap: () {
//                                 List itemList = [
//                                   {"title": "All", "value": ""},
//                                   {"title": "Credit (CR)", "value": "CR"},
//                                   {"title": "Debit (DR)", "value": "DR"},
//                                   {"title": "QR Transaction", "value": "QR"},
//                                 ];
//                                 AppNav.to(
//                                   buildContext: context,
//                                   ShowFilterBottomsheetPageRiverpod(
//                                     itemList: itemList,
//                                     filterKeyName: "title",
//                                     showKeyName: "title",
//                                     inputTitle: "Select Wallet Type",
//                                     title: "Select Wallet Type",
//                                     response: (res) {
//                                       setState(() {
//                                         _walletTypeController.text = res['title'] ?? "";
//                                         _walletTypeValueController.text = res['value'] ?? "";
//                                       });
//                                     },
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: AppColor.GREY_LIGHT),
//                                   borderRadius: BorderRadius.circular(12.0)
//                                 ),
//                                 padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Icon(Iconsax.card5, color: AppColor.TEXT_GREY, size: 22.0),
//                                     AddHorizontalSpacing(8.0),
//                                     Expanded(
//                                       child: Text(
//                                         _walletTypeController.text.isEmpty ? "--SELECT--" : _walletTypeController.text,
//                                         style: StyleHelper.popinsStyle(fontSize: 14.0, color: AppColor.TEXT_DARK),
//                                       ),
//                                     ),
//                                     Icon(Icons.arrow_drop_down, color: AppColor.GREY_MEDIUM)
//                                   ],
//                                 ),
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
//                         InkWell(
//                           onTap: _fetchTransactionDetail,
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
//                 : TransactionDetailListWidget(
//                     reportData: List.generate(_transactionList.length, (index) {
//                       final item = _transactionList[index];
//                       final isDebit = item.transactionType?.toUpperCase() == 'DR';
//                       final amt = DoubleHelper.convert_string_to_double(string: item.amount ?? item.crAmount);

//                       return TransactionDetailData(
//                         sNo: index + 1,
//                         transactionType: item.transactionType ?? (isDebit ? 'DR' : 'CR'),
//                         preWallet: DoubleHelper.convert_string_to_double(string: item.preWallet),
//                         amount: isDebit ? -amt.abs() : amt.abs(),
//                         afterWallet: DoubleHelper.convert_string_to_double(string: item.afterWallet),
//                         remark: item.remark ?? '',
//                         date: item.entryDate ?? '',
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

// class TransactionDetailListWidget extends StatefulWidget {
//   final List<TransactionDetailData> reportData;

//   const TransactionDetailListWidget({
//     Key? key,
//     required this.reportData,
//   }) : super(key: key);

//   @override
//   State<TransactionDetailListWidget> createState() => _TransactionDetailListWidgetState();
// }

// class _TransactionDetailListWidgetState extends State<TransactionDetailListWidget> {
//   late List<TransactionDetailData> _filteredData;
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _filteredData = widget.reportData;
//   }

//   @override
//   void didUpdateWidget(covariant TransactionDetailListWidget oldWidget) {
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
//           return item.transactionType.toLowerCase().contains(q) ||
//               item.remark.toLowerCase().contains(q) ||
//               item.date.toLowerCase().contains(q);
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
//               hintText: 'Search Transaction Type, Remark, Date...',
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
//                   final isCredit = item.amount >= 0;

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
//                             Expanded(
//                               child: Row(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 16,
//                                     backgroundColor: isCredit
//                                         ? const Color(0xFFE6F4EA)
//                                         : const Color(0xFFFFEBEE),
//                                     child: Icon(
//                                       isCredit
//                                           ? Icons.arrow_downward_rounded
//                                           : Icons.arrow_upward_rounded,
//                                       size: 18,
//                                       color: isCredit
//                                           ? const Color(0xFF137333)
//                                           : const Color(0xFFC62828),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 8),
//                                   Expanded(
//                                     child: Text(
//                                       item.transactionType,
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                         color: Color(0xFF202124),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Text(
//                               '${isCredit ? "+" : ""}₹ ${item.amount.abs().toStringAsFixed(2)}',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: isCredit ? const Color(0xFF137333) : const Color(0xFFC62828),
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
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Pre Wallet',
//                                     style: TextStyle(fontSize: 10, color: AppColor.TEXT_DARK),
//                                   ),
//                                   const SizedBox(height: 2),
//                                   Text(
//                                     '₹ ${item.preWallet.toStringAsFixed(2)}',
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600,
//                                       color: Color(0xFF202124),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Icon(
//                                 Icons.east_rounded,
//                                 size: 16,
//                                 color: Color(0xFF9E9E9E),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'After Wallet',
//                                     style: TextStyle(fontSize: 10, color: AppColor.TEXT_DARK),
//                                   ),
//                                   const SizedBox(height: 2),
//                                   Text(
//                                     '₹ ${item.afterWallet.toStringAsFixed(2)}',
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF0D47A1),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 item.remark,
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   color: AppColor.TEXT_DARK,
//                                   fontStyle: FontStyle.italic,
//                                 ),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             Row(
//                               children: [
//                                 Icon(Icons.access_time_rounded, size: 12, color: AppColor.PRIMARY_COLOR),
//                                 const SizedBox(width: 4),
//                                 Text(
//                                   item.date,
//                                   style: const TextStyle(
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.w500,
//                                     color: AppColor.PRIMARY_COLOR,
//                                   ),
//                                 ),
//                               ],
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

//   Widget _buildEmptyState() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 32),
//       width: double.infinity,
//       child: const Column(
//         children: [
//           Icon(Icons.receipt_long_outlined, size: 48, color: Color(0xFFBDBDBD)),
//           SizedBox(height: 8),
//           Text(
//             'No transaction details available',
//             style: TextStyle(fontSize: 13, color: Color(0xFF757575), fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TransactionDetailData {
//   final int sNo;
//   final String transactionType;
//   final double preWallet;
//   final double amount;
//   final double afterWallet;
//   final String remark;
//   final String date;

//   TransactionDetailData({
//     required this.sNo,
//     required this.transactionType,
//     required this.preWallet,
//     required this.amount,
//     required this.afterWallet,
//     required this.remark,
//     required this.date,
//   });
// }
