// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:svo/constants/colors.dart';
// import 'package:svo/constants/constants.dart';
// import 'package:svo/models/doctor_models/doctor_list_response_model.dart';
// import 'package:svo/utils/spacings.dart';
// import 'package:svo/views/doctor/doctor_detail.dart';
// import 'package:svo/widgets/buttons.dart';
// import 'package:svo/widgets/image_view.dart';

// Widget doctor_item({DoctorListResponseModelItem? item}) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
//     decoration: BoxDecoration(
//       color: AppColor.WHITE,
//       borderRadius: BorderRadius.circular(10.0),
//       boxShadow: [
//         BoxShadow(
//           color: AppColor.GREY_LIGHT,
//           spreadRadius: 1.0,
//           blurRadius: 6.0,
//           offset: Offset(0, 3)
//         ),
//       ]
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10.0),
//           child: show_simple_network_image(imageURL: "${APIURL.IMAGE_BASE_URL}${item?.profileImage ?? ""}",height: 100.0,width: Get.width,fit: BoxFit.cover,)),
//         AddVerticalSpacing(10.0),
//         Text(item?.doctorName ?? "",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,),
//         AddVerticalSpacing(4.0),
//         Text(item?.specilization ?? "" ,style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.TEXT_GREY),maxLines: 1,overflow: TextOverflow.ellipsis,),
//         AddVerticalSpacing(8.0),
//         primary_button_background(
//           title: "View",
//           height: 40.0,
//           onTap: (){
//             Get.to(()=> DoctorDetail(doctorName: item?.doctorName ?? "",doctorId: item?.doctorId ?? "",));
//           }
//         ),
//         // Container(
//         //   decoration: BoxDecoration(
//         //     color: AppColor.PRIMARY_COLOR,
//         //     borderRadius: BorderRadius.circular(26.0),
//         //   ),
//         //   padding: EdgeInsets.symmetric(vertical: 6.0),
//         //   child: Center(
//         //     child: Text("View",style: GoogleFonts.poppins(color: AppColor.WHITE,fontWeight: FontWeight.w500),),
//         //   ),
//         // ),
//       ],
//     ),
//   );
// }