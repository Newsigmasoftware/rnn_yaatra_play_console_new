import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/routing/app_router.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/widgets/app_bar.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';

class PasswordMenu extends ConsumerStatefulWidget {
  const PasswordMenu({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordMenuState();
}

class _PasswordMenuState extends ConsumerState<PasswordMenu> {

  @override
  Widget build(BuildContext context) {

   List accountSettingsList = [
      {
        "title": "Change Password",
        "subtitle": "Update your account login password",
        "action": "Change Now",
        "color": const Color(0xFF1967D2), // Blue accent
        "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#1967D2\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><rect x=\"3\" y=\"11\" width=\"18\" height=\"11\" rx=\"2\" ry=\"2\"/><path d=\"M7 11V7a5 5 0 0 1 10 0v4\"/></svg>",
        "onTap": () {
          AppNav.push(context: context, path: AppRouteString.ChangeLoginPassword);
        }
      },
      // {
      //   "title": "Change Transaction Password",
      //   "subtitle": "Update security key for funds and transfers",
      //   "action": "Change Now",
      //   "color": const Color(0xFFB06000), // Amber/Orange accent
      //   "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"#B06000\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M21 2l-2 2m-1.5 1.5l-3 3M3 21l8-8\"/><rect x=\"11\" y=\"7\" width=\"10\" height=\"10\" rx=\"2\"/><circle cx=\"16\" cy=\"12\" r=\"1\"/></svg>",
      //   "onTap": () {
      //     AppNav.push(context: context, path: AppRouteString.ChangeTransactionPassword);
      //   }
      // },
    ];


    return Scaffold(
      appBar: CustomAppBar(
        title: "Password",
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
                    text: "Password ",
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
              itemCount: accountSettingsList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              itemBuilder: (context, index) {
                var item = accountSettingsList[index];
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