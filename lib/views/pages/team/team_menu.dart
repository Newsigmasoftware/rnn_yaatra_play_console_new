// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:rnn_yaatra/constants/colors.dart';
// import 'package:rnn_yaatra/helpers/navigation_helper.dart';
// import 'package:rnn_yaatra/routing/app_router.dart';
// import 'package:rnn_yaatra/utils/screen_helper.dart';
// import 'package:rnn_yaatra/utils/spacings.dart';
// import 'package:rnn_yaatra/utils/txt_styles.dart';
// import 'package:rnn_yaatra/view_models/home_view_models/home_view_model.dart';
// import 'package:rnn_yaatra/view_models/team_view_model.dart';
// import 'package:rnn_yaatra/widgets/app_bar.dart';
// import 'package:rnn_yaatra/widgets/container_item.dart';

// class TeamMenu extends ConsumerStatefulWidget {
//   const TeamMenu({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _TeamMenuState();
// }

// class _TeamMenuState extends ConsumerState<TeamMenu> {

//   final HomeViewModel _homeViewModel = HomeViewModel();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       // String from = "01 Jan 2020";
//       // String to = DateFormat('dd MMM yyyy').format(DateTime.now());

//       ref.read(getTeamViewModelGlobalNotifier.notifier).get_direct_team(
//         from: '',
//         to: '',
//       );

//       // Fetch Dashboard Data for other counts
//       ref.read(_homeViewModel.pageStateProvider.notifier).get_dashboard_data();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final teamState = ref.watch(getTeamViewModelGlobalNotifier);
//     final homeState = ref.watch(_homeViewModel.pageStateProvider);

//     final directTeamCount = teamState.directTeamModel?.count ?? 0;
    
//     // Find Downline Team/Total Team count from Dashboard dt5
//     String downlineTeamCount = "0";
//     if (homeState.dashboardResponseModel?.dt5 != null) {
//       for (var item in homeState.dashboardResponseModel!.dt5!) {
//         if (item.name?.toLowerCase().contains("total team") ?? false) {
//           downlineTeamCount = item.value ?? "0";
//           break;
//         }
//       }
//     }

//     List incomeOverviewList = [
//       {
//         "title": "Direct Team",
//         "subtitle": "View your associated customer/business records.",
//         "count": directTeamCount.toString(),
//         "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#1967D2\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2\"/><circle cx=\"8.5\" cy=\"7\" r=\"4\"/><line x1=\"20\" y1=\"8\" x2=\"20\" y2=\"14\"/><line x1=\"17\" y1=\"11\" x2=\"23\" y2=\"11\"/></svg>",
//         "onTap": () {
//           AppNav.push(context: context, path: AppRouteString.DirectTeam);
//         }
//       },
//       {
//         "title": "Downline Team",
//         "subtitle": "View applicable team and business records.",
//         "count": downlineTeamCount,
//         "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#B06000\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><circle cx=\"12\" cy=\"5\" r=\"3\"/><circle cx=\"6\" cy=\"19\" r=\"3\"/><circle cx=\"18\" cy=\"19\" r=\"3\"/><path d=\"M12 8v4\"/><path d=\"M6 16v-1a3 3 0 0 1 3-3h6a3 3 0 0 1 3 3v1\"/></svg>",
//         "onTap": () {
//           AppNav.push(context: context, path: AppRouteString.DownlineTeam);
//         }
//       },

//     ];


//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "Teams",
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
//                     text: "Teams ",
//                     style: StyleHelper.popinsStyle(fontSize: 14.0,color: AppColor.TEXT_GREY,fontWeight: FontWeight.w600),
//                   ),
//                   WidgetSpan(
//                     alignment: PlaceholderAlignment.middle,
//                     child: Icon(Icons.info_outline,size: 18.0,)
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
//                 return CustomInkWell(
//                   onTap: item['onTap'] ?? (){},
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
//                               // Top-Left Badge Header
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
//                                     SvgPicture.string(item['svg_icon'],color: AppColor.WHITE,height: 16.0,),
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

//                                     const SizedBox(width: 8),
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                                       decoration: BoxDecoration(
//                                         color: Colors.white.withAlpha(50),
//                                         borderRadius: BorderRadius.circular(4),
//                                       ),
//                                       child: Text(
//                                         "${item['count']}",
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 10,
//                                         ),
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
//                           padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
//                           child: Row(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: index.isEven ? AppColor.PRIMARY_COLOR.withValues(alpha: 0.07) : AppColor.SECONDARY_COLOR.withValues(alpha: 0.1),
//                                   borderRadius: BorderRadius.circular(12.0),  
//                                 ),
//                                 padding: EdgeInsets.all(11.0),
//                                 child: SvgPicture.string(item['svg_icon'],)
//                               ),
//                               AddHorizontalSpacing(10.0),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(item['subtitle'] ?? "",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w500)),
//                                     AddVerticalSpacing(5.0),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.1),
//                                         borderRadius: BorderRadius.circular(15.0),
//                                       ),
//                                       padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
//                                       child: Text("View Details",style: StyleHelper.popinsStyle(fontSize: 10.0,color: AppColor.PRIMARY_COLOR,fontWeight: FontWeight.w500),),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               AddHorizontalSpacing(10.0),
//                               Icon(Icons.arrow_forward_ios,size: 16.0,color: index.isEven ? AppColor.PRIMARY_COLOR : AppColor.SECONDARY_COLOR),
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
