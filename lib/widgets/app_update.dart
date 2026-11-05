// import 'package:as_tiles/constants/images.dart';
// import 'package:as_tiles/helpers/url_helpers.dart';
// import 'package:as_tiles/models/config_models/get_app_version_response_model.dart';
// import 'package:as_tiles/utils/screen_helper.dart';
// import 'package:as_tiles/utils/spacings.dart';
// import 'package:as_tiles/utils/strings_helper.dart';
// import 'package:as_tiles/widgets/buttons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// import 'package:get/get.dart'; 
// import 'package:flutter_html/flutter_html.dart';

// class ShowAppUpdateDialog extends ConsumerWidget {
//   final GetAppVersionResponseModel? responseModel;
//   ShowAppUpdateDialog({super.key, this.responseModel});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: WillPopScope(
//         onWillPop: () async {
//           return false;
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                   child: Padding(
//                 padding: const EdgeInsets.only(right: 20),
//                 child:
//                     Lottie.asset(AppLottie.APP_UPDATE, height: ScreenHelper().get_height(context) * 0.3),
//               )),
//               AddVerticalSpacing(20.0),
//               Center(
//                   child: Text(
//                 "App Update Available.",
//                 style: GoogleFonts.poppins(
//                     fontSize: 16, fontWeight: FontWeight.w600),
//               )),
//               AddVerticalSpacing(20.0),
        
//               StringsHelper.is_empty_or_null("${responseModel?.message}") ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(child: Text("1. Fixes Bugs",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400),textAlign: TextAlign.center,)),
//                     AddVerticalSpacing(3.0),
//                     Center(child: Text("2. Improved Performance",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400),)),
//                   ],
//                 ) : Html(
//                   data: responseModel?.message ?? "",
//                 ),
//               // Center(
//               //     child: Text(
//               //   "1. Fixes Bugs",
//               //   style: GoogleFonts.poppins(
//               //       fontSize: 14, fontWeight: FontWeight.w400),
//               //   textAlign: TextAlign.center,
//               // )),
//               // AddVerticalSpacing(3.0),
//               // Center(
//               //     child: Text(
//               //   "2. Improved Performance",
//               //   style: GoogleFonts.poppins(
//               //       fontSize: 14, fontWeight: FontWeight.w400),
//               // )),
        
//               AddVerticalSpacing(30.0),
//               primaryButton(
//                   title: "Update",
//                   width: ScreenHelper().get_width(context),
//                   onTap: () async {
//                     if (GetPlatform.isAndroid) {
//                       UrlHelper().launchUrl(responseModel?.androidUrl);
//                     } else if (GetPlatform.isIOS) {
//                       UrlHelper().launchUrl(responseModel?.iosUrl);
//                     }
//                     // var url =  GetPlatform.isAndroid ? "https://play.google.com/store/apps/details?id=com.app.youlife&pli=1" : "https://youlife.co.in/";
//                     // await UrlHelper().launchUrl(url);
//                   }),
//               // Align(
//               //   alignment: Alignment.centerRight,
//               //   child: InkWell(
//               //     onTap: (){
//               //       Get.back();
//               //     },
//               //     borderRadius: BorderRadius.circular(40.0),
//               //     child: CircleAvatar(
//               //       backgroundColor: ColorConstant.whiteColor,
//               //       radius: 25.0,
//               //       child: Icon(Icons.close,color: ColorConstant.themeColor,),
//               //     ),
//               //   ),
//               // ),
//               // AddVerticalSpacing(10.0),
//               // show_simple_network_image(
//               //   imageURL: "${responseModel?.data?.last.popupImage ?? ""}",
//               //   fit: BoxFit.contain,
//               //   height: Get.height*0.3,
//               //   width: Get.width,
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
