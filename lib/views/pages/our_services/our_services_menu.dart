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

class OurServicesMenu extends ConsumerStatefulWidget {
  const OurServicesMenu({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OurServicesMenuState();
}

class _OurServicesMenuState extends ConsumerState<OurServicesMenu> {

  @override
  Widget build(BuildContext context) {

    List incomeOverviewList = [
      {
        "title": "Book Travel",
        "subtitle": "Book your next travel effortlessly and securely.",
        "action": "View Details",
        "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#1967D2\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z\"/><line x1=\"3\" y1=\"6\" x2=\"21\" y2=\"6\"/><path d=\"M16 10a4 4 0 0 1-8 0\"/></svg>",
        "onTap": () {
          AppNav.push(context: context, path: AppRouteString.PuchasePlan);
        }
      },
      {
        "title": "Travel Booking History",
        "subtitle": "View your travel plan purchase history.",
        "action": "View Details",
        "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#B06000\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z\"/><polyline points=\"14 2 14 8 20 8\"/><line x1=\"16\" y1=\"13\" x2=\"8\" y2=\"13\"/><line x1=\"16\" y1=\"17\" x2=\"8\" y2=\"17\"/><polyline points=\"10 9 9 9 8 9\"/></svg>",
        "onTap": () {
          AppNav.push(context: context, path: AppRouteString.PurchaseReport);
        }
      },
    ];


    return Scaffold(
      appBar: CustomAppBar(
        title: "Our Services",
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
            CustomInkWell(
              onTap: (){
                AppNav.push(context: context,path: AppRouteString.HowItWorksScreen);
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Our Services ",
                      style: StyleHelper.popinsStyle(fontSize: 14.0,color: AppColor.TEXT_GREY,fontWeight: FontWeight.w600),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(Icons.info_outline,size: 18.0,)
                    )
                  ]
                ),
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
                                    // const Icon(Icons.group_outlined, color: Colors.white, size: 16),
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