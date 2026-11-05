// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:rnn_yaatra/constants/colors.dart';
// import 'package:rnn_yaatra/constants/constants.dart';
// import 'package:rnn_yaatra/constants/images.dart';
// import 'package:rnn_yaatra/helpers/navigation_helper.dart';
// import 'package:rnn_yaatra/routing/app_router.dart';
// import 'package:rnn_yaatra/utils/double_helper.dart';
// import 'package:rnn_yaatra/utils/screen_helper.dart';
// import 'package:rnn_yaatra/utils/spacings.dart';
// import 'package:rnn_yaatra/utils/txt_styles.dart';
// import 'package:rnn_yaatra/view_models/account_view_models/get_profile_detail_view_model.dart';
// import 'package:rnn_yaatra/view_models/team_view_model.dart';
// import 'package:rnn_yaatra/widgets/container_item.dart';
// import 'package:rnn_yaatra/widgets/image_view.dart';

// class IncomeMenus extends ConsumerStatefulWidget {
//   final Function? onClickMenu;
//   const IncomeMenus({super.key, this.onClickMenu});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _IncomeMenusState();
// }

// class _IncomeMenusState extends ConsumerState<IncomeMenus> {

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(getTeamViewModelGlobalNotifier.notifier).aipiIncomeApi();
//       ref.read(getTeamViewModelGlobalNotifier.notifier).lipiIncomeApi();
//       ref.read(getTeamViewModelGlobalNotifier.notifier).rewardIncentivePoolApi();
//       ref.read(getTeamViewModelGlobalNotifier.notifier).rankChartApi();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final teamState = ref.watch(getTeamViewModelGlobalNotifier);

//     final aipTotal = (teamState.aipIncomeModel?.data ?? []).fold(
//       0.0, (sum, item) => sum + DoubleHelper.convert_string_to_double(string: item.income)
//     );

//     final lipTotal = (teamState.lipIncomeModel?.data ?? []).fold(
//       0.0, (sum, item) => sum + DoubleHelper.convert_string_to_double(string: item.income ?? item.totalIncome)
//     );

//     final rewardTotal = (teamState.rewardIncentivePoolModel?.data ?? []).fold(
//       0.0, (sum, item) => sum +
//         DoubleHelper.convert_string_to_double(string: item.salaryAmount) +
//         DoubleHelper.convert_string_to_double(string: item.festivalIncentiveFund) +
//         DoubleHelper.convert_string_to_double(string: item.fmcg)
//     );

//     final rankTotal = (teamState.rankChartModel?.data ?? []).fold(
//       0.0, (sum, item) => sum + DoubleHelper.convert_string_to_double(string: item.salaryAmount)
//     );

//     List incomeOverviewList = [
//       {
//         "title": "AIP Income",
//         "subtitle": "Total Earnings",
//         "amount": aipTotal.toStringAsFixed(2),
//         "action": "View Details",
//         "isLoading": teamState.isLoadingAipiIncome,
//         "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#1967D2\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2\"/><circle cx=\"9\" cy=\"7\" r=\"4\"/><path d=\"M23 21v-2a4 4 0 0 0-3-3.87\"/><path d=\"M16 3.13a4 4 0 0 1 0 7.75\"/></svg>",
//         "onTap": () {
//           AppNav.push(context: context, path: AppRouteString.AipIncome);
//         }
//       },
//       {
//         "title": "LIP Income",
//         "subtitle": "Total Earnings",
//         "amount": lipTotal.toStringAsFixed(2),
//         "action": "View Details",
//         "isLoading": teamState.isLoadingLiPiIncome,
//         "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#B06000\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><circle cx=\"12\" cy=\"12\" r=\"8\"/><path d=\"M12 8v8\"/><path d=\"M8 12h8\"/><circle cx=\"12\" cy=\"12\" r=\"3\"/></svg>",
//         "onTap": () {
//           AppNav.push(context: context, path: AppRouteString.LipIncome);
//         }
//       },
//       {
//         "title": "Reward Income",
//         "subtitle": "Total Earnings",
//         "amount": rewardTotal.toStringAsFixed(2),
//         "action": "View Details",
//         "isLoading": teamState.isLoadingRewardIncome,
//         "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#1967D2\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><polyline points=\"20 12 20 22 4 22 4 12\"/><rect x=\"2\" y=\"7\" width=\"20\" height=\"5\"/><line x1=\"12\" y1=\"22\" x2=\"12\" y2=\"7\"/><path d=\"M12 7H7.5a2.5 2.5 0 0 1 0-5C11 2 12 7 12 7z\"/><path d=\"M12 7h4.5a2.5 2.5 0 0 0 0-5C13 2 12 7 12 7z\"/></svg>",
//         "onTap": () {
//           AppNav.push(context: context, path: AppRouteString.RewardPoolIncome);
//         }
//       },
//       {
//         "title": "Rank Income",
//         "subtitle": "Total Earnings",
//         "amount": rankTotal.toStringAsFixed(2),
//         "action": "View Details",
//         "isLoading": teamState.isLoadingRankChart,
//         "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#B06000\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M6 9H4.5a2.5 2.5 0 0 1 0-5H6\"/><path d=\"M18 9h1.5a2.5 2.5 0 0 0 0-5H18\"/><path d=\"M4 22h16\"/><path d=\"M10 14.66V17c0 .55-.45 1-1 1H7v2h10v-2h-2c-.55 0-1-.45-1-1v-2.34\"/><path d=\"M18 4H6v7a6 6 0 0 0 12 0V4z\"/></svg>",
//         "onTap": () {
//           AppNav.push(context: context, path: AppRouteString.RankChart);
//         }
//       }
//     ];

//     var profileDetail = ref.watch(getProfileViewModelNotifier).getProfileDetailResponseModel;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         surfaceTintColor: AppColor.WHITE,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: Colors.white,
//           statusBarIconBrightness: Brightness.dark,
//           statusBarBrightness: Brightness.light,
//         ),
//         leading: IconButton(
//           onPressed: () {
//             widget.onClickMenu?.call(2);
//           },
//           icon: Icon(Icons.menu, color: AppColor.TEXT_DARK),
//         ),
//         title: Text("Our Income", style: StyleHelper.popinsStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: AppColor.TEXT_DARK)),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 15.0),
//             child: Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.5)),
//                     shape: BoxShape.circle,
//                     color: AppColor.WHITE
//                   ),
//                   padding: EdgeInsets.all(2.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadiusGeometry.circular(50.0),
//                     child: profileDetail?.data?.photo != null && profileDetail!.data!.photo!.trim().isNotEmpty
//                         ? show_simple_network_image(
//                             context,
//                             imageURL: profileDetail.data!.photo!.startsWith("http")
//                                 ? profileDetail.data!.photo!
//                                 : "${APIURL.IMAGE_BASE_URL}${profileDetail.data!.photo!}",
//                             height: 40.0,
//                             width: 40.0,
//                             fit: BoxFit.cover,
//                             radius: 50.0,
//                           )
//                         : Image.asset(AppImage.AVATAR, height: 40.0, width: 40.0, fit: BoxFit.fill),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AddVerticalSpacing(10.0),
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "Income Overview ",
//                     style: StyleHelper.popinsStyle(fontSize: 14.0, color: AppColor.TEXT_GREY, fontWeight: FontWeight.w600),
//                   ),
//                   WidgetSpan(
//                     alignment: PlaceholderAlignment.middle,
//                     child: Icon(Icons.info_outline, size: 18.0)
//                   )
//                 ]
//               ),
//             ),

//             AddVerticalSpacing(15.0),
//             ListView.separated(
//               itemCount: incomeOverviewList.length,
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               padding: EdgeInsets.zero,
//               separatorBuilder: (context, index) => Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
//               itemBuilder: (context, index) {
//                 var item = incomeOverviewList[index];
//                 bool isLoading = item['isLoading'] ?? false;

//                 return CustomInkWell(
//                   onTap: item['onTap'] ?? () {},
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: AppColor.WHITE,
//                       borderRadius: BorderRadius.circular(12.0),
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
//                           spreadRadius: 2.0,
//                           offset: Offset(0, 2),
//                           blurRadius: 6.0
//                         )
//                       ]
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
//                                     SvgPicture.string(item['svg_icon'], color: AppColor.WHITE, height: 16.0),
//                                     const SizedBox(width: 6),
//                                     Text(
//                                       item['title'] ?? "",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12,
//                                         letterSpacing: 0.5,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         AddVerticalSpacing(10.0),
//                         Padding(
//                           padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
//                           child: Row(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: index.isEven ? AppColor.PRIMARY_COLOR.withValues(alpha: 0.07) : AppColor.SECONDARY_COLOR.withValues(alpha: 0.1),
//                                   borderRadius: BorderRadius.circular(12.0),
//                                 ),
//                                 padding: EdgeInsets.all(11.0),
//                                 child: SvgPicture.string(item['svg_icon'])
//                               ),
//                               AddHorizontalSpacing(10.0),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(item['subtitle'] ?? "", style: StyleHelper.popinsStyle(fontSize: 13.0, fontWeight: FontWeight.w600)),
//                                     AddVerticalSpacing(5.0),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.1),
//                                         borderRadius: BorderRadius.circular(15.0),
//                                       ),
//                                       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
//                                       child: Text("View Details", style: StyleHelper.popinsStyle(fontSize: 10.0, color: AppColor.PRIMARY_COLOR, fontWeight: FontWeight.w500)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               AddHorizontalSpacing(10.0),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   isLoading
//                                       ? SizedBox(
//                                           height: 18,
//                                           width: 18,
//                                           child: CircularProgressIndicator(strokeWidth: 2, color: AppColor.PRIMARY_COLOR),
//                                         )
//                                       : Text(
//                                           "${AppConstants.CURRENCY_SYMBOL} ${item['amount'] ?? "0.00"}",
//                                           style: StyleHelper.popinsStyle(
//                                             color: index.isEven ? AppColor.PRIMARY_COLOR : AppColor.SECONDARY_COLOR,
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 16.0,
//                                           ),
//                                         ),
//                                   AddVerticalSpacing(4.0),
//                                   Icon(Icons.arrow_forward_ios, size: 16.0, color: index.isEven ? AppColor.PRIMARY_COLOR : AppColor.SECONDARY_COLOR),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
