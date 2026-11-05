import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/routing/app_router.dart'; 
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/widgets/app_bar.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';


class FundMenu extends ConsumerStatefulWidget {
  const FundMenu({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FundMenuState();
}

class _FundMenuState extends ConsumerState<FundMenu> {

  @override
  Widget build(BuildContext context) {

    List incomeOverviewList = [
      {
        "title": "Deposit Request",
        "subtitle": "Submit new deposit requests.",
        "action": "View Details",
        "color": const Color(0xFF1967D2), // Blue accent
        "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#1967D2\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M12 5v14M5 12h14\"/><circle cx=\"12\" cy=\"12\" r=\"9\"/></svg>",
        "onTap": () {
          AppNav.push(context: context, path: AppRouteString.DepositRequest);
        }
      },
      {
        "title": "Deposit Request History",
        "subtitle": "Track deposited history and transactions",
        "action": "View Details",
        "color": const Color(0xFF137333), // Green accent
        "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#137333\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><rect x=\"2\" y=\"5\" width=\"20\" height=\"14\" rx=\"2\"/><line x1=\"2\" y1=\"10\" x2=\"22\" y2=\"10\"/><line x1=\"12\" y1=\"15\" x2=\"16\" y2=\"15\"/></svg>",
        "onTap": () {
          AppNav.push(context: context, path: AppRouteString.FundRequestReport);
        }
      },
      // {
      //   "title": "Payment Records",
      //   "subtitle": "View payment records and verification status",
      //   "action": "View Details",
      //   "color": const Color(0xFFB06000), // Amber/Orange accent
      //   "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#B06000\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4\"/><polyline points=\"17 8 12 3 7 8\"/><line x1=\"12\" y1=\"3\" x2=\"12\" y2=\"15\"/></svg>",
      //   "onTap": () {
      //     AppNav.push(context: context, path: AppRouteString.WithdrawalReport);
      //   }
      // },
    ];


    return Scaffold(
      appBar: CustomAppBar(
        title: "Wallet",
        onBackPressed: (){
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpacing(10.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Wallet ",
                    style: StyleHelper.popinsStyle(fontSize: 14.0,color: AppColor.TEXT_GREY,fontWeight: FontWeight.w600),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(Icons.info_outline,size: 18.0,)
                  )
                ]
              ),
            ),

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
                    // padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
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
                                  color: (item['color'] as Color).withValues(alpha: 0.1),
                                  // color: index.isEven ? AppColor.PRIMARY_COLOR.withValues(alpha: 0.07) : AppColor.SECONDARY_COLOR.withValues(alpha: 0.1),
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
                                    // Text(item['subtitle'] ?? "",style: StyleHelper.popinsStyle(fontSize: 11.0,fontWeight: FontWeight.w400,color: AppColor.TEXT_DARK)),
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