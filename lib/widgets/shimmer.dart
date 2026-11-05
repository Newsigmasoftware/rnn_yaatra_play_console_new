// ignore_for_file: deprecated_member_use, non_constant_identifier_names
 import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:rnn_yaatra/constants/images.dart';
import 'package:rnn_yaatra/main.dart';
import 'package:rnn_yaatra/views/pages/account/account.dart';
// import 'package:masonry_grid/masonry_grid.dart';
import 'package:shimmer/shimmer.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';

Widget shimmer_container(
    {height, width, border_radius, baseColor, highlightColor,context}) {
  return SizedBox(
    width: width ?? ScreenHelper().get_width(context),
    height: height ?? 150.0,
    child: Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey.shade300,
        highlightColor: highlightColor ?? Colors.grey.shade100,
        child: Container(
          height: height ?? 150,
          width: width ?? ScreenHelper().get_width(context),
          decoration: BoxDecoration(
              color: AppColor.WHITE,
              borderRadius: BorderRadius.circular(border_radius ?? 10)),
        )),
  );
}
 

// Widget partner_dashboard_overview_shimmer() {
//   return MasonryGrid(
//     column: 2,
//     crossAxisSpacing: 15.0,
//     mainAxisSpacing: 15.0,
//     children: List.generate(6, (index) => Container(
//       height: 100.0,
//       decoration: BoxDecoration(
//         color: AppColor.WHITE,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: AppColor.GREY_EXTRA_LIGHT,
//             blurRadius: 10.0,
//             spreadRadius: 5.0,
//             offset: Offset(0, 4),
//           )
//         ]
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 shimmer_container(
//                   width: 80.0,
//                   height: 7.0,
//                 ),
//                 AddVerticalSpacing(8.0),
//                 shimmer_container(
//                   width: 60.0,
//                   height: 7.0,
//                 ),
//               ],
//             ),
//           ),
//           shimmer_container(
//             height: 40.0,
//             width: 40.0,
//           ),
//         ],
//       ),
//     )),
//   );
// }


Widget partner_monthly_earning_list_shimmer() {
  return ListView.separated(
    itemCount: 5,
    shrinkWrap: true,
    physics: BouncingScrollPhysics(),
    separatorBuilder: (context, index) => Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
    itemBuilder: (context, index) {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shimmer_container(
                  height: 7.0,
                  width: 80.0,
                ),
                AddVerticalSpacing(7.0),
                shimmer_container(
                  height: 7.0,
                  width: 40.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shimmer_container(
                  height: 7.0,
                  width: 80.0,
                ),
                AddVerticalSpacing(7.0),
                shimmer_container(
                  height: 7.0,
                  width: 40.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shimmer_container(
                  height: 7.0,
                  width: 80.0,
                ),
                AddVerticalSpacing(7.0),
                shimmer_container(
                  height: 7.0,
                  width: 40.0,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}


Widget category_grid_4_shimmer() {
  return MasonryGrid(
    column: 4,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    children: List.generate(8, (index) {
      return Column(
        children: [
          shimmer_container(
            height: 55.0,
            width: 55.0,
            border_radius: 6.0
          ),
          AddVerticalSpacing(8.0),
          shimmer_container(
            height: 6.0,
            width: 25.0
          ),
          AddVerticalSpacing(8.0),
          shimmer_container(
            height: 6.0,
            width: 50.0
          ),
        ],
      );
    }),
  );
}


Widget profileCardShimmer() {
  return SizedBox(
    height: 320.0,
    width: ScreenHelper().get_width(navigatorKey.currentContext),
    child: Stack(
      children: [
        Positioned.fill(child: Image.asset(AppImage.LOGIN_TOP,width: ScreenHelper().get_width(navigatorKey.currentContext),fit: BoxFit.cover,)),
        Positioned.fill(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            // height: 100.0,
            width: ScreenHelper().get_width(navigatorKey.currentContext),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  // AppColor.WHITE,
                  AppColor.WHITE,
                  AppColor.WHITE.withValues(alpha: 0.1),
                  AppColor.WHITE.withValues(alpha: 0.1),
                  // AppColor.WHITE,
                ]
              )
            ),
          ),
        ),

        Positioned.fill(
          left: 15.0,
          right: 15.0,
          top: 10.0,
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.GREY_LIGHT.withValues(alpha: 0.6),
                          spreadRadius: 2.0,
                          blurRadius: 6.0,
                          offset: Offset(0, 3)
                        )
                      ],
                      image: DecorationImage(
                        image: AssetImage(AppImage.PROFILE_CARD),
                        fit: BoxFit.cover
                      )
                      // color: AppColor.PRIMARY_COLOR
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 12.0),
                    width: ScreenHelper().get_width(navigatorKey.currentContext),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.SECONDARY_COLOR,width: 2.0),
                                  shape: BoxShape.circle
                                ),
                                padding: EdgeInsets.all(2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(50.0),
                                  child: Image.asset(AppImage.AVATAR,height: 55.0,width: 55.0,fit: BoxFit.cover,)),
                              ),
                              AddVerticalSpacing(6.0),
                              shimmer_container(
                                height: 5.0,
                                width: 40.0
                              ),
                              AddVerticalSpacing(5.0),
                              shimmer_container(
                                height: 5.0,
                                width: 60.0
                              ),
                              AddVerticalSpacing(5.0),
                              shimmer_container(
                                height: 5.0,
                                width: 30.0
                              ),
                              AddVerticalSpacing(5.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: shimmer_container(
                                  height: 25.0,
                                  width: 120.0,
                                  border_radius: 50.0
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(AppImage.LOGO,height: 50.0,)
                          ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


Widget accountProfileCartShimmer() {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 86,
          height: 86,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Stack(
            children: [
              CustomPaint(
                painter: HalfCircleBorderPainter(
                  firstColor: Colors.orange,
                  secondColor: AppColor.PRIMARY_COLOR,
                  strokeWidth: 2,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.SECONDARY_COLOR),
                    shape: BoxShape.circle,
                    color: AppColor.WHITE
                  ),
                  padding: EdgeInsets.all(2.0),
                  child: Icon(Icons.camera_alt,color: AppColor.PRIMARY_COLOR,size: 16.0),
                ),
                // child: CircleAvatar(
                //   backgroundColor: AppColor.WHITE,
                //   radius: 14.0,
                //   child: Icon(Icons.camera_alt,color: AppColor.PRIMARY_COLOR,size: 18.0),
                // ),
              ),
            ],
          ),
        ), 
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmer_container(
                height: 6.0,
                width: 60.0
              ),
              const SizedBox(height: 5),
              shimmer_container(
                height: 6.0,
                width: ScreenHelper().get_width(navigatorKey.currentContext)*0.2
              ),
              const SizedBox(height: 5),
              shimmer_container(
                height: 6.0,
                width: ScreenHelper().get_width(navigatorKey.currentContext)*0.3
              ),
              const SizedBox(height: 10),
              shimmer_container(
                height: 25.0,
                width: ScreenHelper().get_width(navigatorKey.currentContext)*0.3,
                border_radius: 50.0
              ),
            ],
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: AppColor.PRIMARY_COLOR,
          size: 18,
        ),
      ],
    ),
  );
}


Widget kyc_user_Detail_card_shimmer() {
  return Container(
    decoration: BoxDecoration(
      color: AppColor.WHITE,
      border: Border.all(color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.2)),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
          spreadRadius: 2.0,
          blurRadius: 6.0,
          offset: Offset(0, 3)
        )
      ]
    ),
    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
    width: ScreenHelper().get_width(navigatorKey.currentContext),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmer_container(
                      height: 6.0,
                      width: ScreenHelper().get_width(navigatorKey.currentContext)*0.2
                    ),
                    AddVerticalSpacing(6.0),
                    shimmer_container(
                      height: 6.0,
                      width: ScreenHelper().get_width(navigatorKey.currentContext)*0.1
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: AppColor.PRIMARY_COLOR.withValues(alpha: 0.1),
                child: Icon(Iconsax.user,color: AppColor.PRIMARY_COLOR,size: 22.0,),
              )
            ],
          )
        ),
        AddHorizontalSpacing(10.0),
        Container(
          width: 1.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: AppColor.GREY_LIGHT
          ),
        ),
        AddHorizontalSpacing(10.0),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmer_container(
                      height: 6.0,
                      width: ScreenHelper().get_width(navigatorKey.currentContext)*0.2
                    ),
                    AddVerticalSpacing(6.0),
                    shimmer_container(
                      height: 6.0,
                      width: ScreenHelper().get_width(navigatorKey.currentContext)*0.1
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: AppColor.PRIMARY_COLOR.withValues(alpha: 0.1),
                child: Icon(Iconsax.calendar,color: AppColor.PRIMARY_COLOR,size: 22.0,),
              )
            ],
          )
        ),
      ],
    ),
  );
}