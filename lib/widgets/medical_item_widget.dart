// // ignore_for_file: non_constant_identifier_names

// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:svo/constants/colors.dart';
// import 'package:svo/constants/constants.dart';
// import 'package:svo/models/medical_store_models/medical_store_list_response_model.dart';
// import 'package:svo/utils/double_helper.dart';
// import 'package:svo/utils/spacings.dart';
// import 'package:svo/views/medical_store/medical_store_detail.dart';
// import 'package:svo/widgets/image_view.dart';

// Widget medical_store_item({MedicalStoreListResponseModelItem? item}) {
//   return InkWell(
//     onTap: (){
//       Get.to(()=> MedicalStoreDetail(item: item,));
//     },
//     child: Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColor.GREY_LIGHT,),
//         borderRadius: BorderRadius.circular(10.0)
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: show_simple_network_image(imageURL: "${APIURL.DOMAIN}${item?.photo}" ,height: 70.0,width: 70.0,fit: BoxFit.cover,)),
//               AddHorizontalSpacing(15.0),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(item?.name ?? "",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                     AddVerticalSpacing(3.0),
//                     Text("${item?.fromTime ?? ""} - ${item?.toTime ?? ""}",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                   ],
//                 ),
//               ),
//               DoubleHelper.convert_string_to_double(string: "${item?.discountPercent ?? "0"}") > 0 ? Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 6),
//                 decoration: BoxDecoration(
//                   color: AppColor.RED,
//                   borderRadius: BorderRadius.circular(24.0)
//                   // shape: BoxShape.circle
//                 ),
//                 child: Center(
//                   child: Text("${DoubleHelper.convert_string_to_double(string: "${item?.discountPercent ?? "0"}").toInt()} %",style: GoogleFonts.poppins(color: AppColor.WHITE,fontWeight: FontWeight.w600,fontSize: 14),),
//                 ),
//               ) : SizedBox(),
//               // Container(
//               //   decoration: BoxDecoration(
//               //     color: AppColor.GREEN.withValues(alpha: 0.1),
//               //     border: Border.all(color: AppColor.GREEN),
//               //     borderRadius: BorderRadius.circular(15.0),
//               //   ),
//               //   padding: EdgeInsets.symmetric(horizontal: 14,vertical: 3),
//               //   child: Center(
//               //     child: Text("Open",style: GoogleFonts.poppins(color: AppColor.GREEN,fontWeight: FontWeight.w600,fontSize: 13),),
//               //   ),
//               // ),
//             ],
//           ),
//           AddVerticalSpacing(10.0),
//           Divider(color: AppColor.GREY_LIGHT,),
//           Row(
//             children: [
//               Icon(Iconsax.call,color: AppColor.PRIMARY_COLOR,size: 19.0,),
//               AddHorizontalSpacing(6.0),
//               Expanded(
//                 child: Text(item?.mobileno ?? "N/A" ,style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400),maxLines: 2,overflow: TextOverflow.ellipsis,),
//               ),
//             ],
//           ),
//           AddVerticalSpacing(6.0),
//           Row(
//             children: [
//               Icon(Iconsax.location,color: AppColor.PRIMARY_COLOR,size: 19.0,),
//               AddHorizontalSpacing(6.0),
//               Expanded(
//                 child: Text(item?.location ?? "" ,style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400),maxLines: 2,overflow: TextOverflow.ellipsis,),
//               ),
//             ],
//           ),
          
//         ],
//       ),
//     ),
//   );
// }