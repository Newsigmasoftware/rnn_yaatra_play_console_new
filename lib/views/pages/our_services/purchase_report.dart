import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/constants/images.dart';
import 'package:rnn_yaatra/models/account_models/get_topup_list_response_model.dart';
import 'package:rnn_yaatra/services/account_services.dart';
import 'package:rnn_yaatra/utils/double_helper.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/view_models/account_view_models/get_profile_detail_view_model.dart';
import 'package:rnn_yaatra/view_models/home_view_models/home_view_model.dart'; 
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/image_view.dart';



class PurchaseReport extends ConsumerStatefulWidget {
  const PurchaseReport({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PurchaseReportState();
}

class _PurchaseReportState extends ConsumerState<PurchaseReport> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final AccountServices _accountServices = AccountServices();
  final HomeViewModel homeViewModel = HomeViewModel();

  List banner_list = [
    AppImage.BANNER_ONE,
    AppImage.BANNER_TWO,
  ];
  
  bool _isLoading = false;
  List<TopupListData> _topupList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchTopupList();
    });
  }

  Future<void> _fetchTopupList() async {
    setState(() {
      _isLoading = true;
    });

    String from = _fromDateController.text.trim();
    String to = _toDateController.text.trim();
    if (from == "--SELECT--") from = "";
    if (to == "--SELECT--") to = "";

    try {
      final res = await _accountServices.getTopupList(from: from, to: to);
      if (mounted) {
        setState(() {
          _topupList = res.data ?? [];
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _topupList = [];
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
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    // 01/01/2026

    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loadingProfile = ref.watch(getProfileViewModelNotifier).isLoadingProfile;
    var profileDetail = ref.watch(getProfileViewModelNotifier).getProfileDetailResponseModel;

    var activeSliderIndex = ref.watch(homeViewModel.pageStateProvider).activeSliderIndex;
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: "Purchase History",
      //   // onBackPressed: () {
      //   //   context.pop();
      //   // },
      // ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: AppColor.WHITE,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: Image.asset(AppImage.LOGO,height: 45.0,),

        // leading: IconButton(
        //   onPressed: () {
        //     // widget.onClickMenu?.call(2);
        //   },
        //   icon: CircleAvatar(
        //     backgroundColor: AppColor.PRIMARY_COLOR,
        //     child: Icon(Icons.menu,color: AppColor.WHITE,size: 18.0),
        //   ),
        //   // icon: Icon(Icons.menu,color: AppColor.PRIMARY_COLOR),
        // ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Row(
              children: [
                // Text("Welcome",style: StyleHelper.popinsStyle(color: AppColor.BLACK,fontWeight: FontWeight.w600)),
                // AddHorizontalSpacing(10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.5)),
                    shape: BoxShape.circle,
                    color: AppColor.WHITE
                  ),
                  padding: EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(50.0),
                    child: profileDetail?.data?.photo != null && profileDetail!.data!.photo!.trim().isNotEmpty
                        ? show_simple_network_image(
                            context,
                            imageURL: profileDetail.data!.photo!.startsWith("http")
                                ? profileDetail.data!.photo!
                                : "${APIURL.IMAGE_BASE_URL}${profileDetail.data!.photo!}",
                            height: 40.0,
                            width: 40.0,
                            fit: BoxFit.cover,
                            radius: 50.0,
                          )
                        : Image.asset(AppImage.AVATAR,height: 40.0,width: 40.0,fit: BoxFit.fill,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpacing(15.0),
            SizedBox(
              height: 150.0,
              width: ScreenHelper().get_width(context),
              child: CarouselSlider.builder(
                itemCount: banner_list.length, 
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: 130.0,
                  onPageChanged: (index, reason) {
                    ref.read(homeViewModel.pageStateProvider.notifier).setSliderIndex(activeSliderIndex: index);
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.GREY_LIGHT.withValues(alpha: 0.4),
                          spreadRadius: 2.0,
                          blurRadius: 6.0,
                          offset: Offset(0, 3)
                        )
                      ]
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8.0),
                      child: Image.asset(banner_list[index],width: ScreenHelper().get_width(context),fit: BoxFit.cover,)),
                  );
                  // child: Image.asset(AppImage.BANNER_ONE,width: ScreenHelper().get_width(context),));
                }, 
              ),
            ),

            AddVerticalSpacing(20.0),
            Text("My Bookings",style: StyleHelper.popinsStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: AppColor.PRIMARY_COLOR)),
            AddVerticalSpacing(10.0),
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
                        InkWell(
                          onTap: _fetchTopupList,
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
            AddVerticalSpacing(20.0),
            _isLoading
                ? Center(child: ProgressDialog().showLoadingDot())
                : PurchaseDetailListWidget(
                    reportData: List.generate(_topupList.length, (index) {
                      final item = _topupList[index];
                      return PurchaseDetailData(
                        sNo: index + 1,
                        userId: item.topupUserId ?? item.userId ?? '',
                        userName: item.topupUserName ?? item.userName ?? '',
                        paidDate: item.entryDate ?? '',
                        paidAmount: DoubleHelper.convert_string_to_double(string: item.topupAmount),
                        packageName: item.planName?.trim() ?? '',
                        topupByMember: item.userName ?? item.userId ?? '',
                        topupType: item.topupType ?? 'Direct',
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

class PurchaseDetailListWidget extends StatefulWidget {
  final List<PurchaseDetailData> reportData;

  const PurchaseDetailListWidget({
    Key? key,
    required this.reportData,
  }) : super(key: key);

  @override
  State<PurchaseDetailListWidget> createState() => _PurchaseDetailListWidgetState();
}

class _PurchaseDetailListWidgetState extends State<PurchaseDetailListWidget> {
  late List<PurchaseDetailData> _filteredData;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredData = widget.reportData;
  }

  @override
  void didUpdateWidget(covariant PurchaseDetailListWidget oldWidget) {
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
          return item.userId.toLowerCase().contains(q) ||
              item.userName.toLowerCase().contains(q) ||
              item.packageName.toLowerCase().contains(q) ||
              item.topupByMember.toLowerCase().contains(q) ||
              item.topupType.toLowerCase().contains(q);
        }).toList();
      }
    });
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
                color: Colors.black.withValues(alpha: 0.03),
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
              hintText: 'Search User, Plan, or Member...',
              hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
              prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF0D47A1)),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0D47A1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        item.userId,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE8F0FE),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        "Status: ${item.topupType}",
                                        style: const TextStyle(
                                          color: Color(0xFF1967D2),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item.userName,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF202124),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '₹ ${item.paidAmount.toStringAsFixed(2)}',
                              // '₹ ${"XXXX"}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF137333),
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
                              child: _buildMetricTile(
                                label: 'Tour Name',
                                // value: "Tour Package",
                                value: item.packageName,
                              ),
                            ),
                            Container(height: 24, width: 1, color: const Color(0xFFE0E0E0)),
                            Expanded(
                              child: _buildMetricTile(
                                label: 'Booked By',
                                value: item.topupByMember,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8F9FA),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Book Date',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.PRIMARY_COLOR,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today_outlined, size: 12, color: AppColor.PRIMARY_COLOR),
                                  const SizedBox(width: 4),
                                  Text(
                                    item.paidDate,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.PRIMARY_COLOR,
                                    ),
                                  ),
                                ],
                              ),
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

  Widget _buildMetricTile({required String label, required String value}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: AppColor.TEXT_DARK,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
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
          Icon(Icons.inbox_rounded, size: 48, color: Color(0xFFBDBDBD)),
          SizedBox(height: 8),
          Text(
            'No purchase details available',
            style: TextStyle(fontSize: 13, color: Color(0xFF757575), fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class PurchaseDetailData {
  final int sNo;
  final String userId;
  final String userName;
  final String paidDate;
  final double paidAmount;
  final String packageName;
  final String topupByMember;
  final String topupType;

  PurchaseDetailData({
    required this.sNo,
    required this.userId,
    required this.userName,
    required this.paidDate,
    required this.paidAmount,
    required this.packageName,
    required this.topupByMember,
    required this.topupType,
  });
}
