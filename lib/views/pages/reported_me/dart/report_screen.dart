import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/routing/app_router.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/view_models/home_view_models/home_view_model.dart'; 
import 'package:rnn_yaatra/widgets/app_bar.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';

class ReportScreen extends ConsumerStatefulWidget {
  const ReportScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<ReportScreen> {

  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    });
  }

  @override
  Widget build(BuildContext context) {

    List incomeOverviewList = [
      {
        "title": "Raise Ticket",
        "subtitle": "Submit a support query or raise ticket",
        "svg_icon": r'''<svg viewBox="0 0 24 24" fill="none" stroke="#1967D2" stroke-width="2"><path d="M12 5v14M5 12h14"/></svg>''',
        "onTap": () {
          AppNav.push(context: context, path: AppRouteString.RaiseTicketScreen);
        }
      },

      {
        "title": "Raise Ticket Detail",
        "subtitle": "View list and details of raised support tickets",
        "svg_icon": r'''<svg viewBox="0 0 24 24" fill="none" stroke="#B06000" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2"/><line x1="8" y1="8" x2="16" y2="8"/><line x1="8" y1="12" x2="16" y2="12"/></svg>''',
        "onTap": () {
          AppNav.push(context: context, path: AppRouteString.RaiseTicketDetailScreen);
        }
      },

    ];


    return Scaffold(
      appBar: CustomAppBar(
        title: "Reported Me",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpacing(15.0),
            ListView.separated(
              itemCount: incomeOverviewList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              itemBuilder: (context, index) {
                var item = incomeOverviewList[index];
                return CustomInkWell(
                  onTap: item['onTap'] ?? (){},
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.WHITE,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
                              spreadRadius: 2.0,
                              offset: Offset(0, 2),
                              blurRadius: 6.0
                          )
                        ]
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
                              // Top-Left Badge Header
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
                                    SvgPicture.string(item['svg_icon'],color: AppColor.WHITE,height: 16.0,),
                                    const SizedBox(width: 6),
                                    Text(
                                      item['title'] ?? "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        letterSpacing: 0.5,
                                      ),
                                    ),

                                    //const SizedBox(width: 8),
                                    // Container(
                                    //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    //   decoration: BoxDecoration(
                                    //     color: Colors.white.withAlpha(50),
                                    //     borderRadius: BorderRadius.circular(4),
                                    //   ),
                                    //   child: Text(
                                    //     "${item['count']}",
                                    //     style: const TextStyle(
                                    //       color: Colors.white,
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 10,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        AddVerticalSpacing(10.0),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
                          child: Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: index.isEven ? AppColor.PRIMARY_COLOR.withValues(alpha: 0.07) : AppColor.SECONDARY_COLOR.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: EdgeInsets.all(11.0),
                                  child: SvgPicture.string(item['svg_icon'],)
                              ),
                              AddHorizontalSpacing(10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item['subtitle'] ?? "",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w500)),
                                    AddVerticalSpacing(5.0),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                                      child: Text("View Details",style: StyleHelper.popinsStyle(fontSize: 10.0,color: AppColor.PRIMARY_COLOR,fontWeight: FontWeight.w500),),
                                    ),
                                  ],
                                ),
                              ),
                              AddHorizontalSpacing(10.0),
                              Icon(Icons.arrow_forward_ios,size: 16.0,color: index.isEven ? AppColor.PRIMARY_COLOR : AppColor.SECONDARY_COLOR),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )



          ],
        ),
      ),
    );
  }
}
