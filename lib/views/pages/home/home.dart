// ignore_for_file: use_super_parameters
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:iconsax/iconsax.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/images.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart'; 
import 'package:rnn_yaatra/models/home_models/get_dashboard_response_model.dart';
import 'package:rnn_yaatra/routing/app_router.dart'; 
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/view_models/account_view_models/get_profile_detail_view_model.dart';
import 'package:rnn_yaatra/view_models/home_view_models/home_view_model.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';  
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/image_view.dart'; 
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:upgrader/upgrader.dart';



class Home extends ConsumerStatefulWidget {
  final Function? onClickMenu;
  const Home({super.key,this.onClickMenu});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {

  final HomeViewModel homeViewModel = HomeViewModel();
  List banner_list = [
    AppImage.BANNER_ONE,
    AppImage.BANNER_TWO,
  ];

  List includes = [
    {
      "icon": Icons.hotel, // Cupertino icon not directly available, Material icon used
      "label": "Hotels"
    },
    {
      "icon": Icons.location_on, // Cupertino icon not directly available, Material icon used
      "label": "Sightseeing"
    },
    {
      "icon": Icons.directions_car,
      "label": "Car"
    },
    {
      "icon": Icons.directions_car,
      "label": "Car"
    },
    {
      "icon": Icons.restaurant,
      "label": "Meal"
    },
  ];

  List otherPackages = [
    {
      "title" : "Nainital Tour Package",
      "img" : AppImage.PIC_ONE,
    },
    {
      "title" : "Mussoorie Tour Package",
      "img" : AppImage.PIC_TWO
    },
    {
      "title" : "Spiti Valley Tour Package",
      "img" : AppImage.PIC_THREE
    },
    {
      "title" : "Kashmir Tour Package",
      "img" : AppImage.PIC_FOUR
    },
    {
      "title" : "Maldives Tour Package",
      "img" : AppImage.PIC_FIVE
    },
    {
      "title" : "Bali Tour Package",
      "img" : AppImage.PIC_SIX
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      getdata();
      
    });
  }

  Future getdata() async { 
    // ref.read(homeViewModel.pageStateProvider.notifier).get_dashboard_data();
    ref.read(getProfileViewModelNotifier.notifier).get_profile_detail();
  }

  @override
  Widget build(BuildContext context) {

    var loadingDashboard = ref.watch(homeViewModel.pageStateProvider).isLoadingHome;
    var dashboardDetail = ref.watch(homeViewModel.pageStateProvider).dashboardResponseModel;

    var loadingProfile = ref.watch(getProfileViewModelNotifier).isLoadingProfile;
    var profileDetail = ref.watch(getProfileViewModelNotifier).getProfileDetailResponseModel;

    var activeSliderIndex = ref.watch(homeViewModel.pageStateProvider).activeSliderIndex;
    // List earningOverViewList = [
    //   {
    //     "title": "Today Earning",
    //     "value": 0.00,
    //     "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><circle cx=\"12\" cy=\"12\" r=\"10\"/><path d=\"M6 9h12\"/><path d=\"M6 13h12\"/><path d=\"M9 9c0 5 6 3 6 7\"/><path d=\"M12 7v10\"/></svg>"
    //   },
    //   {
    //     "title": "Last 7 Days Earning",
    //     "value": 0.00,
    //     "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><rect width=\"18\" height=\"18\" x=\"3\" y=\"4\" rx=\"2\" ry=\"2\"/><line x1=\"16\" x2=\"16\" y1=\"2\" y2=\"6\"/><line x1=\"8\" x2=\"8\" y1=\"2\" y2=\"6\"/><line x1=\"3\" x2=\"21\" y1=\"10\" y2=\"10\"/></svg>"
    //   },
    //   {
    //     "title": "Last 30 Days Earning",
    //     "value": 0.00,
    //     "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M8 2v4\"/><path d=\"M16 2v4\"/><rect width=\"18\" height=\"18\" x=\"3\" y=\"4\" rx=\"2\"/><path d=\"M3 10h18\"/><path d=\"M8 14h.01\"/><path d=\"M12 14h.01\"/><path d=\"M16 14h.01\"/><path d=\"M8 18h.01\"/><path d=\"M12 18h.01\"/><path d=\"M16 18h.01\"/></svg>"
    //   },
    //   {
    //     "title": "Total Earning",
    //     "value": 0.00,
    //     "svg_icon": "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M21 12V7H5a2 2 0 0 1 0-4h14v4\"/><path d=\"M3 5v14a2 2 0 0 0 2 2h16v-5\"/><path d=\"M18 12a2 2 0 0 0 0 4h4v-4z\"/></svg>"
    //   }
    // ];

    return UpgradeAlert(
      barrierDismissible: false,
      showLater: false,
      showIgnore: false,
      shouldPopScope: () => false,
      upgrader: Upgrader(),

      child: Scaffold( 
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: AppColor.WHITE,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          leading: IconButton(
            onPressed: () {
              widget.onClickMenu?.call(2);
            },
            icon: CircleAvatar(
              backgroundColor: AppColor.PRIMARY_COLOR,
              child: Icon(Icons.menu,color: AppColor.WHITE,size: 18.0),
            ),
            // icon: Icon(Icons.menu,color: AppColor.PRIMARY_COLOR),
          ),
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
        extendBodyBehindAppBar: true,
        body: RefreshIndicator(
          onRefresh: () async {
            await getdata();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(
                  height: 320.0,
                  width: ScreenHelper().get_width(context),
                  child: Stack(
                    children: [
                      Positioned.fill(child: Image.asset(AppImage.LOGIN_TOP,width: ScreenHelper().get_width(context),fit: BoxFit.cover,)),
                      Positioned.fill(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          // height: 100.0,
                          width: ScreenHelper().get_width(context),
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

                                AddVerticalSpacing(10.0),
                                SizedBox(
                                  height: 8.0,
                                  width: ScreenHelper().get_width(context),
                                  child: Center(
                                    child: ListView.separated(
                                      itemCount: banner_list.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) => Padding(padding: EdgeInsets.only(right: 10.0)),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 8.0,
                                          width: activeSliderIndex == index ? 25.0 : 15.0,
                                          decoration: BoxDecoration(
                                            color: activeSliderIndex == index ?  AppColor.PRIMARY_COLOR : AppColor.GREY_LIGHT,
                                            borderRadius: BorderRadius.circular(40.0)
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),


                                // Container(
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(12.0),
                                //     boxShadow: [
                                //       BoxShadow(
                                //         color: AppColor.GREY_LIGHT.withValues(alpha: 0.6),
                                //         spreadRadius: 2.0,
                                //         blurRadius: 6.0,
                                //         offset: Offset(0, 3)
                                //       )
                                //     ],
                                //     image: DecorationImage(
                                //       image: AssetImage(AppImage.PROFILE_CARD),
                                //       fit: BoxFit.cover
                                //     )
                                //     // color: AppColor.PRIMARY_COLOR
                                //   ),
                                //   padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 12.0),
                                //   width: ScreenHelper().get_width(context),
                                //   child: Row(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Expanded(
                                //         child: Column(
                                //           crossAxisAlignment: CrossAxisAlignment.center,
                                //           children: [
                                //             Container(
                                //               decoration: BoxDecoration(
                                //                 border: Border.all(color: AppColor.SECONDARY_COLOR,width: 2.0),
                                //                 shape: BoxShape.circle
                                //               ),
                                //               padding: EdgeInsets.all(2.0),
                                //               child: ClipRRect(
                                //                 borderRadius: BorderRadiusGeometry.circular(50.0),
                                //                 child: profileDetail?.data?.photo != null && profileDetail!.data!.photo!.trim().isNotEmpty
                                //                     ? show_simple_network_image(
                                //                         context,
                                //                         imageURL: profileDetail.data!.photo!.startsWith("http")
                                //                             ? profileDetail.data!.photo!
                                //                             : "${APIURL.IMAGE_BASE_URL}${profileDetail.data!.photo!}",
                                //                         height: 55.0,
                                //                         width: 55.0,
                                //                         fit: BoxFit.cover,
                                //                         radius: 50.0,
                                //                       )
                                //                     : Image.asset(AppImage.AVATAR,height: 55.0,width: 55.0,fit: BoxFit.cover,),
                                //               ),
                                //             ),
                                //             AddVerticalSpacing(5.0),
                                //             Text(profileDetail?.data?.username ?? "NA",style: StyleHelper.popinsStyle(fontSize: 15.0,color: AppColor.WHITE,fontWeight: FontWeight.w600),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                //             Text("User ID: ${profileDetail?.data?.userid ?? "NA"}",style: StyleHelper.popinsStyle(fontSize: 11.0,color: AppColor.WHITE,fontWeight: FontWeight.w500),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis),
                                //             Text("Rank: ${profileDetail?.data?.userRank ?? "NA"}",style: StyleHelper.popinsStyle(fontSize: 11.0,color: AppColor.WHITE,fontWeight: FontWeight.w500),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis),
                                //             AddVerticalSpacing(5.0),
                                //             Padding(
                                //               padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                //               child: Container(
                                //                 decoration: BoxDecoration(
                                //                   color: AppColor.SECONDARY_COLOR,
                                //                   borderRadius: BorderRadius.circular(35.0)
                                //                 ),
                                //                 padding: EdgeInsets.symmetric(vertical: 3.0),
                                //                 child: Center(
                                //                   child: Text("No Pakage",style: StyleHelper.popinsStyle(fontWeight: FontWeight.w500,fontSize: 12.0,color: AppColor.PRIMARY_COLOR),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis),
                                //                 ),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //       Expanded(child: Column(
                                //         crossAxisAlignment: CrossAxisAlignment.end,
                                //         mainAxisAlignment: MainAxisAlignment.start,
                                //         children: [
                                //           Image.asset(AppImage.LOGO,height: 50.0,)
                                //         ],
                                //       ))
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ), 

                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Featured Package",style: StyleHelper.popinsStyle(fontSize: 15.0,fontWeight: FontWeight.w600),),
                      AddVerticalSpacing(5.0),
                      CustomInkWell(
                        onTap: (){
                          AppNav.push(context: context,path: AppRouteString.PuchasePlan);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.WHITE,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.GREY_LIGHT,
                                spreadRadius: 2.0,
                                blurRadius: 6.0,
                                offset: Offset(0, 3)
                              )
                            ]
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(8.0),
                                child: Image.asset(AppImage.PACKAGE_TWO,height: 160.0,width: 120.0,fit: BoxFit.cover)),
                              AddHorizontalSpacing(10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tour Package",style: StyleHelper.popinsStyle(fontSize: 16.0,fontWeight: FontWeight.w600)),
                                    Text(
                                      "This package includes a curated set of services for a complete travel experience.",
                                      style: StyleHelper.popinsStyle(fontSize: 13.0, color: AppColor.TEXT_GREY,fontWeight: FontWeight.w500),
                                      maxLines: 2,overflow: TextOverflow.ellipsis,
                                    ),
                               
                                    AddVerticalSpacing(5.0),
                                    MasonryGrid(
                                      column: 3,
                                      crossAxisSpacing: 5.0,
                                      mainAxisSpacing: 5.0,
                                      children: List.generate(includes.length, (index) {
                                        return Icon(includes[index]['icon'],color: AppColor.PRIMARY_COLOR);
                                        // return show_simple_network_image(
                                        //   context,
                                        //   imageURL: includes[index],
                                        //   height: 24.0,
                                        //   width: 24.0,
                                        //   fit: BoxFit.contain,
                                        //   color: AppColor.PRIMARY_COLOR,
                                        // );
                                      },),
                                    ),
                                    AddVerticalSpacing(5.0),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.PRIMARY_COLOR,
                                          borderRadius: BorderRadius.circular(50.0),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 6.0),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Book Now ",
                                                style: StyleHelper.popinsStyle(fontSize: 12.0,color: AppColor.WHITE,fontWeight: FontWeight.w600)
                                              ),
                                              WidgetSpan(
                                                child: Icon(Icons.arrow_forward,size: 15.0,color: AppColor.WHITE,fontWeight: FontWeight.w600),
                                              )
                                            ]
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      AddVerticalSpacing(15.0),
                      Text("Our Other Packages",style: StyleHelper.popinsStyle(fontSize: 16.0,fontWeight: FontWeight.w600),),
                      
                      AddVerticalSpacing(20.0),
                      SizedBox(
                        height: 230.0,
                        width: ScreenHelper().get_width(context),
                        child: ListView.separated(
                          itemCount: otherPackages.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(right: 15.0),
                          ),
                          padding: EdgeInsets.only(bottom: 8.0,left: 10.0),
                          itemBuilder: (context, index) {
                            var item = otherPackages[index];
                            return Container(
                              width: 150.0,
                              decoration: BoxDecoration(
                                color: AppColor.WHITE,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.GREY_LIGHT,
                                    spreadRadius: 2.0,
                                    blurRadius: 6.0,
                                    offset: Offset(0,3)
                                  )
                                ]
                              ),
                              // padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(10.0),
                                    child: Image.asset(item['img'],height: 125.0,width: 150.0,fit: BoxFit.cover,)),
                                  
                                  AddVerticalSpacing(8.0),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(item['title'] ?? "",style: StyleHelper.popinsStyle(fontSize: 13.0,fontWeight: FontWeight.w600),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                        AddVerticalSpacing(6.0),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColor.GREY_EXTRA_LIGHT,
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          width: ScreenHelper().get_width(context),
                                          padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 6.0),
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              children: [
                                                WidgetSpan(
                                                  alignment: PlaceholderAlignment.middle,
                                                  child: Icon(Icons.watch_later_outlined,size: 16.0,color: AppColor.TEXT_GREY,),
                                                ),
                                                TextSpan(
                                                  text: "  Coming Soon",
                                                  style: StyleHelper.popinsStyle(color: AppColor.TEXT_GREY,fontWeight: FontWeight.w500,fontSize: 12.0)
                                                )
                                              ]
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      // loadingDashboard ? ProgressDialog().showLoadingDot() : MasonryGrid(
                      //   column: 2,
                      //   crossAxisSpacing: 15.0,
                      //   mainAxisSpacing: 15.0,
                      //   children: List.generate(dashboardDetail?.dt5?.length ?? 0, (index) {
                      //     var item = dashboardDetail?.dt5?[index];
                      //     return Container(
                      //       decoration: BoxDecoration(
                      //         color: AppColor.WHITE,
                      //         borderRadius: BorderRadius.circular(12.0),
                      //         boxShadow: [
                      //           BoxShadow(
                      //             color: AppColor.GREY_LIGHT.withValues(alpha: 0.6),
                      //             spreadRadius: 2.0,
                      //             blurRadius: 6.0,
                      //             offset: Offset(0, 2) 
                      //           )
                      //         ]
                      //       ),
                      //       height: 80.0,
                      //       padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      //       child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Container(
                      //             decoration: BoxDecoration(
                      //               color: AppColor.PRIMARY_COLOR,
                      //               borderRadius: BorderRadius.circular(11.0),
                      //               border: Border(
                      //                 right: BorderSide(
                      //                   color: AppColor.SECONDARY_COLOR,
                      //                   width: 4.0
                      //                 )
                      //               )
                      //             ),
                      //             padding: EdgeInsets.all(10.0),
                      //             child: SvgPicture.string(EarningOverviewIconSvgStringHelper.getIcon(item?.name ?? ""),color: AppColor.WHITE,),
                      //           ),
                      //           AddHorizontalSpacing(10.0),
                      //           Expanded(
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Text(item?.name ?? "",style: StyleHelper.popinsStyle(fontSize: 11.0,fontWeight: FontWeight.w600),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      //                 // Text("XXXX",style: StyleHelper.popinsStyle(fontSize: 17.0,fontWeight: FontWeight.w600,color: AppColor.PRIMARY_COLOR),maxLines: 1,overflow: TextOverflow.ellipsis),
                      //                 Text(StringsHelper.formatIndianNumberDynamic(item?.value ?? ""),style: StyleHelper.popinsStyle(fontSize: 17.0,fontWeight: FontWeight.w600,color: AppColor.PRIMARY_COLOR),maxLines: 1,overflow: TextOverflow.ellipsis),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   }),
                      // ),
          
                      // AddVerticalSpacing(10.0),
                      // WalletBalancesCard(
                      //   dashboardDetail: dashboardDetail,
                      //   loadingDashboard: loadingDashboard,
                      // ),
                      // AddVerticalSpacing(20.0),
                      // IncomeOverviewCard(
                      //   dashboardDetail: dashboardDetail,
                      //   loadingDashboard: loadingDashboard,
                      // ),
                      // AddVerticalSpacing(20.0),
                      // loadingDashboard ? ProgressDialog().showLoadingDot() : RecentJoiningsCard(
                      //   onViewAllPressed: () {
                      //     // Handle view all click action
                      //   },
                      //   items: (dashboardDetail?.dt4 ?? []).asMap()
                      //   .entries.map((e) {
                      //     final item = e.value;
                      //     return RecentJoiningItem(
                      //       srNo: (e.key+1),
                      //       userId: item.userid ?? '',
                      //       userName: item.username ?? '',
                      //       status: item.status == 1 ? 'Paid' : 'Unpaid',
                      //       amount: DoubleHelper.convert_string_to_double(string: "${item.joiningamount ?? "0"}"),
                      //     );
                      //   }).toList()
                      // ),
          
                      // RecentJoiningsCard(
                      //   onViewAllPressed: () {
                      //     // Handle view all click action
                      //   },
                      //   items: [
                      //     RecentJoiningItem(
                      //       srNo: 1,
                      //       userId: 'RNN262700003',
                      //       userName: 'RNN ASSOCIATE',
                      //       status: 'Unpaid',
                      //       amount: 0.00,
                      //     ),
                      //     RecentJoiningItem(
                      //       srNo: 2,
                      //       userId: 'RNN262700002',
                      //       userName: 'RNN ASSOCIATE',
                      //       status: 'Unpaid',
                      //       amount: 0.00,
                      //     ),
                      //   ],
                      // ),
                      
                      AddVerticalSpacing(60.0),
          
          
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}


 
class WalletBalancesCard extends ConsumerWidget {
  final bool? loadingDashboard;
  final GetDashboardResponseModel? dashboardDetail;
  WalletBalancesCard({Key? key,this.loadingDashboard,this.dashboardDetail}) : super(key: key);

  final HomeViewModel homeViewModel = HomeViewModel();
  
  @override
  Widget build(BuildContext meContext,WidgetRef ref) { 
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Header Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF0D47A1), // Deep Blue Header
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  'WALLET BALANCES',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          
          loadingDashboard == true ? ProgressDialog().showLoadingDot() : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Main Wallet Balance Item
                
                ListView.separated(
                  itemCount: dashboardDetail?.dt6?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Divider(height: 1, thickness: 1, color: Color(0xFFF1F3F4)),
                  ),
                  itemBuilder: (context, index) {
                    var item = dashboardDetail?.dt6?[index];
                    if(item?.id.toString() == "1"){
                      return _buildWalletItem(
                        icon: Icons.work_outline_rounded,
                        iconBgColor: const Color(0xFFE8F0FE),
                        iconColor: const Color(0xFF1967D2),
                        title: 'Main Wallet Balance',
                        amount: '₹ ${StringsHelper.formatIndianNumberDynamic(item?.value ?? "")}',
                      );
                    }
                    if(item?.id.toString() == "2"){
                      return _buildWalletItem(
                        icon: Icons.account_balance_wallet_outlined,
                        iconBgColor: const Color(0xFFFEF7E0),
                        iconColor: const Color(0xFFB06000),
                        title: 'Activation Fund Wallet',
                        amount: '₹ ${StringsHelper.formatIndianNumberDynamic(item?.value ?? "")}',
                      );
                    }
                    return SizedBox();
                  },
                ),
                  
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletItem({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String amount,
  }) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 22,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF5F6368),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202124),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



class IncomeOverviewCard extends StatelessWidget {
  final bool? loadingDashboard;
  final GetDashboardResponseModel? dashboardDetail;
  const IncomeOverviewCard({Key? key,this.loadingDashboard,this.dashboardDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Header Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF0D47A1), // Deep Blue Header
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.trending_up_rounded,
                  color: Colors.white,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  'INCOME OVERVIEW',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          loadingDashboard == true ? ProgressDialog().showLoadingDot() : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // AIP Income Item
                ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: dashboardDetail?.dt7?.length ?? 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(height: 1, thickness: 1, color: Color(0xFFF1F3F4)),
                  ),
                  itemBuilder: (context, index) {
                    var item = dashboardDetail?.dt7?[index];
                    if(item?.id.toString() == "1"){
                      return _buildIncomeItem(
                        icon: Icons.groups_outlined,
                        iconBgColor: const Color(0xFFE8F0FE),
                        iconColor: const Color(0xFF1967D2),
                        title: 'AIP Income',
                        amount: '₹ ${StringsHelper.formatIndianNumberDynamic(item?.value ?? "")}',
                      );
                    }
                    if(item?.id.toString() == "2"){
                      return _buildIncomeItem(
                        icon: Icons.monetization_on_outlined,
                        iconBgColor: const Color(0xFFFEF7E0),
                        iconColor: const Color(0xFFB06000),
                        title: 'LIP Income',
                        amount: '₹ ${StringsHelper.formatIndianNumberDynamic(item?.value ?? "")}',
                      );
                    }
                    if(item?.id.toString() == "3"){
                      return _buildIncomeItem(
                        icon: Icons.show_chart_rounded,
                        iconBgColor: const Color(0xFFE6F4EA),
                        iconColor: const Color(0xFF137333),
                        title: 'RWIP Income',
                        amount: '₹ ${StringsHelper.formatIndianNumberDynamic(item?.value ?? "")}',
                      );
                    }
                    return SizedBox();
                  },
                )
                  
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeItem({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String amount,
  }) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 22,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF5F6368),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202124),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class RecentJoiningsCard extends StatelessWidget {
  final List<RecentJoiningItem> items;
  final VoidCallback? onViewAllPressed;

  const RecentJoiningsCard({
    Key? key,
    required this.items,
    this.onViewAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Row with Badge & View All Button
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
                    children: const [
                      Icon(Iconsax.box, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Text(
                        'RECENT BOOKINGS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                // View All Button
                // InkWell(
                //   onTap: onViewAllPressed,
                //   borderRadius: BorderRadius.circular(20),
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFFFA726),
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: const Text(
                //       'View All',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 11,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          
          const SizedBox(height: 8),
 
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Column(
              children: [ 
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  child: Row(
                    children: [
                      SizedBox(width: 32, child: Text('Sr No', style: _headerStyle)),
                      Expanded(flex: 3, child: Text('User ID', style: _headerStyle)),
                      Expanded(flex: 3, child: Text('User Name', style: _headerStyle)),
                      Expanded(flex: 2, child: Center(child: Text('Status', style: _headerStyle))),
                      Expanded(flex: 2, child: Text('Amount', style: _headerStyle, textAlign: TextAlign.right)),
                    ],
                  ),
                ),
                const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (_, __) => const Divider(height: 1, color: Color(0xFFF1F3F4)),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 32,
                            child: Text('${item.srNo}', style: _cellStyle),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              item.userId,
                              style: _cellStyle.copyWith(fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              item.userName,
                              style: _cellStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: item.status.toLowerCase() == 'unpaid'
                                      ? const Color(0xFFFFE0B2).withValues(alpha: 0.2)
                                      : const Color(0xFFC8E6C9),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  item.status,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: item.status.toLowerCase() == 'unpaid'
                                        ? const Color(0xFFE65100)
                                        : const Color(0xFF2E7D32),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '₹ ${item.amount.toStringAsFixed(2)}',
                              style: _cellStyle.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static const TextStyle _headerStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0D47A1),
  );

  static const TextStyle _cellStyle = TextStyle(
    fontSize: 11,
    color: Color(0xFF333333),
  );
}

// Data Model
class RecentJoiningItem {
  final int srNo;
  final String userId;
  final String userName;
  final String status;
  final double amount;

  RecentJoiningItem({
    required this.srNo,
    required this.userId,
    required this.userName,
    required this.status,
    required this.amount,
  });
}
