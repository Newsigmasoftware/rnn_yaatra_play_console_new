import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/models/account_models/get_deposit_request_list_response_model.dart';
import 'package:rnn_yaatra/services/account_services.dart';
import 'package:rnn_yaatra/utils/double_helper.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/widgets/app_bar.dart';
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/show_bottomsheet_filter.dart';

class FundRequestReport extends ConsumerStatefulWidget {
  const FundRequestReport({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FundRequestReportState();
}

class _FundRequestReportState extends ConsumerState<FundRequestReport> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final TextEditingController _depositDateController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _statusValueController = TextEditingController();

  final AccountServices _accountServices = AccountServices();
  bool _isLoading = false;
  List<DepositRequestListData> _depositList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchDepositRequestList();
    });
  }

  Future<void> _fetchDepositRequestList() async {
    setState(() {
      _isLoading = true;
    });

    String from = _fromDateController.text.trim();
    String to = _toDateController.text.trim();
    if (from == "--SELECT--") from = "";
    if (to == "--SELECT--") to = "";

    String status = _statusValueController.text.trim();

    try {
      final res = await _accountServices.getDepositRequestList(
        from: from,
        to: to,
        status: status,
      );
      if (mounted) {
        setState(() {
          _depositList = res.data ?? [];
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _depositList = [];
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd-MMM-yyyy').format(picked);
      });
    }
  }

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    _depositDateController.dispose();
    _statusController.dispose();
    _statusValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Fund Request Detail",
        onBackPressed: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpacing(15.0),
            Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                border: Border.all(color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.2)),
                borderRadius: BorderRadius.circular(16.0)
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
                            children: [
                              Icon(Iconsax.filter_search5, color: AppColor.WHITE, size: 20.0),
                              AddHorizontalSpacing(5.0),
                              Text("Filter", style: StyleHelper.popinsStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: AppColor.WHITE)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AddVerticalSpacing(10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date From:", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
                                  AddVerticalSpacing(5.0),
                                  InkWell(
                                    onTap: () => _selectDate(context, _fromDateController),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColor.GREY_LIGHT),
                                        borderRadius: BorderRadius.circular(12.0)
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          Icon(Iconsax.calendar5, color: AppColor.TEXT_GREY, size: 22.0),
                                          AddHorizontalSpacing(8.0),
                                          Expanded(
                                            child: Text(
                                              _fromDateController.text.isEmpty ? "--SELECT--" : _fromDateController.text,
                                              style: StyleHelper.popinsStyle(fontSize: 12.0, color: AppColor.TEXT_DARK),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AddHorizontalSpacing(15.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date To:", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
                                  AddVerticalSpacing(5.0),
                                  InkWell(
                                    onTap: () => _selectDate(context, _toDateController),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColor.GREY_LIGHT),
                                        borderRadius: BorderRadius.circular(12.0)
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          Icon(Iconsax.calendar5, color: AppColor.TEXT_GREY, size: 22.0),
                                          AddHorizontalSpacing(8.0),
                                          Expanded(
                                            child: Text(
                                              _toDateController.text.isEmpty ? "--SELECT--" : _toDateController.text,
                                              style: StyleHelper.popinsStyle(fontSize: 12.0, color: AppColor.TEXT_DARK),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        AddVerticalSpacing(15.0),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Deposit Date:", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
                                  AddVerticalSpacing(5.0),
                                  InkWell(
                                    onTap: () => _selectDate(context, _depositDateController),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColor.GREY_LIGHT),
                                        borderRadius: BorderRadius.circular(12.0)
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          Icon(Iconsax.calendar5, color: AppColor.TEXT_GREY, size: 22.0),
                                          AddHorizontalSpacing(8.0),
                                          Expanded(
                                            child: Text(
                                              _depositDateController.text.isEmpty ? "--SELECT--" : _depositDateController.text,
                                              style: StyleHelper.popinsStyle(fontSize: 12.0, color: AppColor.TEXT_DARK),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AddHorizontalSpacing(15.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status:", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
                                  AddVerticalSpacing(5.0),
                                  InkWell(
                                    onTap: () {
                                      List itemList = [
                                        {"title": "All", "value": ""},
                                        {"title": "Pending", "value": "Pending"},
                                        {"title": "Approved", "value": "Approved"},
                                        {"title": "Reject", "value": "Reject"},
                                      ];
                                      AppNav.to(
                                        buildContext: context,
                                        ShowFilterBottomsheetPageRiverpod(
                                          itemList: itemList,
                                          filterKeyName: "title",
                                          showKeyName: "title",
                                          inputTitle: "Select Status",
                                          title: "Select Status",
                                          response: (res) {
                                            setState(() {
                                              _statusController.text = res['title'] ?? "";
                                              _statusValueController.text = res['value'] ?? "";
                                            });
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColor.GREY_LIGHT),
                                        borderRadius: BorderRadius.circular(12.0)
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.swap_vert, color: AppColor.TEXT_GREY, size: 22.0),
                                          AddHorizontalSpacing(8.0),
                                          Expanded(
                                            child: Text(
                                              _statusController.text.isEmpty ? "--SELECT--" : _statusController.text,
                                              style: StyleHelper.popinsStyle(fontSize: 12.0, color: AppColor.TEXT_DARK),
                                            ),
                                          ),
                                          Icon(Icons.arrow_drop_down, color: AppColor.GREY_MEDIUM)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        AddVerticalSpacing(15.0),
                        InkWell(
                          onTap: _fetchDepositRequestList,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.PRIMARY_COLOR,
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                            width: ScreenHelper().get_width(context),
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Filter  ",
                                    style: StyleHelper.popinsStyle(fontSize: 14.0, color: AppColor.WHITE, fontWeight: FontWeight.w500)
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(Iconsax.filter_search5, color: AppColor.WHITE, size: 18.0)
                                  ),
                                ]
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AddVerticalSpacing(15.0),
            _isLoading
                ? Center(child: ProgressDialog().showLoadingDot())
                : FundRequestDetailListWidget(
                    reportData: List.generate(_depositList.length, (index) {
                      final item = _depositList[index];
                      String? receiptPath = item.reciept;
                      if (receiptPath != null && receiptPath.isNotEmpty && !receiptPath.startsWith("http")) {
                        receiptPath = "${APIURL.IMAGE_BASE_URL}$receiptPath";
                      }

                      return FundRequestDetailData(
                        sNo: index + 1,
                        depositDate: item.depositDate ?? '',
                        entryDate: item.entryDate ?? '',
                        amount: DoubleHelper.convert_string_to_double(string: item.amount),
                        status: item.status ?? 'Pending',
                        approveDate: item.approveDate ?? '',
                        receiptUrl: receiptPath,
                      );
                    }),
                  ),
            AddVerticalSpacing(60.0),
          ],
        ),
      ),
    );
  }
}

class FundRequestDetailListWidget extends StatefulWidget {
  final List<FundRequestDetailData> reportData;

  // ignore: use_super_parameters
  const FundRequestDetailListWidget({
    Key? key,
    required this.reportData,
  }) : super(key: key);

  @override
  State<FundRequestDetailListWidget> createState() => _FundRequestDetailListWidgetState();
}

class _FundRequestDetailListWidgetState extends State<FundRequestDetailListWidget> {
  late List<FundRequestDetailData> _filteredData;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredData = widget.reportData;
  }

  @override
  void didUpdateWidget(covariant FundRequestDetailListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.reportData != widget.reportData) {
      _filteredData = widget.reportData;
      _searchController.clear();
    }
  }

  void _filterData(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredData = widget.reportData;
      } else {
        _filteredData = widget.reportData.where((item) {
          final q = query.toLowerCase();
          return item.depositDate.toLowerCase().contains(q) ||
              item.entryDate.toLowerCase().contains(q) ||
              item.status.toLowerCase().contains(q) ||
              item.amount.toString().contains(q) ||
              item.approveDate.toLowerCase().contains(q);
        }).toList();
      }
    });
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return const Color(0xFF137333);
      case 'reject':
      case 'rejected':
        return const Color(0xFFC62828);
      case 'pending':
      default:
        return const Color(0xFFB06000);
    }
  }

  Color _getStatusBgColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return const Color(0xFFE6F4EA);
      case 'reject':
      case 'rejected':
        return const Color(0xFFFFEBEE);
      case 'pending':
      default:
        return const Color(0xFFFEF7E0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            onChanged: _filterData,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecoration(
              hintText: 'Search Date, Status, or Amount...',
              hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
              prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF1967D2)),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              filled: true,
              fillColor: const Color(0xFFF8F9FA),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        _filteredData.isEmpty
            ? _buildEmptyState()
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredData.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = _filteredData[index];
                  final statusColor = _getStatusColor(item.status);
                  final statusBg = _getStatusBgColor(item.status);

                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Requested Amount',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColor.TEXT_DARK,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '₹ ${item.amount.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0D47A1),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: statusBg,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                item.status.toUpperCase(),
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 1, color: Color(0xFFF1F3F4)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _buildDateTile(
                                label: 'Deposit Date',
                                value: item.depositDate,
                              ),
                            ),
                            Container(height: 24, width: 1, color: const Color(0xFFE0E0E0)),
                            Expanded(
                              child: _buildDateTile(
                                label: 'Approve Date',
                                value: item.approveDate.isNotEmpty ? item.approveDate : 'Pending',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8F9FA),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined, size: 12, color: AppColor.TEXT_DARK),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Entry: ${item.entryDate}',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.TEXT_DARK,
                                    ),
                                  ),
                                ],
                              ),
                              // if (item.receiptUrl != null && item.receiptUrl!.isNotEmpty)
                              //   GestureDetector(
                              //     onTap: () {
                              //       print("${item.receiptUrl}");
                              //       // Handle viewing receipt image
                              //     },
                              //     child: const Row(
                              //       children: [
                              //         Icon(Icons.receipt_long, size: 14, color: Color(0xFF1967D2)),
                              //         SizedBox(width: 4),
                              //         Text(
                              //           'View Receipt',
                              //           style: TextStyle(
                              //             fontSize: 11,
                              //             fontWeight: FontWeight.bold,
                              //             color: Color(0xFF1967D2),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   )
                              // else
                              //   Text(
                              //     'No Receipt',
                              //     style: TextStyle(fontSize: 11, color: AppColor.TEXT_DARK),
                              //   ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ],
    );
  }

  Widget _buildDateTile({required String label, required String value}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: AppColor.TEXT_DARK,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF202124),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      width: double.infinity,
      child: const Column(
        children: [
          Icon(Icons.request_quote_outlined, size: 48, color: Color(0xFFBDBDBD)),
          SizedBox(height: 8),
          Text(
            'No fund request details available',
            style: TextStyle(fontSize: 13, color: Color(0xFF757575), fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class FundRequestDetailData {
  final int sNo;
  final String depositDate;
  final String entryDate;
  final double amount;
  final String status;
  final String approveDate;
  final String? receiptUrl;

  FundRequestDetailData({
    required this.sNo,
    required this.depositDate,
    required this.entryDate,
    required this.amount,
    required this.status,
    required this.approveDate,
    this.receiptUrl,
  });
}
