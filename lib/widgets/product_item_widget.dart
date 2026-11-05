
// import 'package:infused_gym_empoyee/constants/colors.dart';
// import 'package:infused_gym_empoyee/constants/constants.dart';
// import 'package:infused_gym_empoyee/helpers/navigation_helper.dart';
// import 'package:infused_gym_empoyee/models/product_models/get_filter_product_list_response_model.dart';
// import 'package:infused_gym_empoyee/utils/double_helper.dart';
// import 'package:infused_gym_empoyee/utils/spacings.dart';
// import 'package:infused_gym_empoyee/utils/strings_helper.dart';
// import 'package:infused_gym_empoyee/utils/txt_styles.dart';
// import 'package:infused_gym_empoyee/views/pages/products/product_detail.dart';
// import 'package:infused_gym_empoyee/widgets/container_item.dart';
// import 'package:infused_gym_empoyee/widgets/image_view.dart';
// import 'package:flutter/material.dart';

// class ProductItemWidget extends StatelessWidget {
//   final GetFilterProductListResponseModelItemProducts? item;
//   final Function? onTap;
//   final bool? isHideAddToCartButton,isShowWishlistButton;
//   final Function? tapOnWishlistIcon;
//   const ProductItemWidget({super.key,this.item,this.onTap,this.isHideAddToCartButton,this.isShowWishlistButton,this.tapOnWishlistIcon});

//   @override
//   Widget build(BuildContext context) {
//     return CustomInkWell(
//       onTap: onTap ?? (){
//         AppNav.to(buildContext: context,ProductDetail(productId: item?.productId,variantID: "${item?.variantId ?? ""}",));
//         // AppNav.push(context: context,path: AppRouteString.ProductDetail);
//       },
//       child: SizedBox(
//         height: 260.0,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 120.0,
//               width: 130.0,
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Positioned.fill(
//                     child: show_simple_network_image(
//                       context,
//                       imageURL: item?.productImage ?? "",
//                       height: 120.0,
//                       width: 130.0,
//                       fit: BoxFit.contain,
//                       radius: 12.0
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 5,
//                     right: 5,
//                     // child: isHideAddToCartButton == true ? SizedBox() : Container(
//                     child: StringsHelper.is_empty_or_null(item?.displayVariant ?? "") ? SizedBox() : Container(
//                       decoration: BoxDecoration(
//                         color: AppColor.WHITE,
//                         borderRadius: BorderRadius.circular(8.0),
//                         border: Border(
//                           top: BorderSide(
//                             color: AppColor.GREEN_MEDIUM,
//                           ),
//                           left: BorderSide(
//                             color: AppColor.GREEN_MEDIUM,
//                           ),
//                           right: BorderSide(
//                             color: AppColor.GREEN_MEDIUM,
//                             width: 4.0
//                           ),
//                           bottom: BorderSide(
//                             color: AppColor.GREEN_MEDIUM,
//                             width: 4.0
//                           ),
//                         )
//                       ),
//                       // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 2.0),
//                       padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
//                       child: Center(
//                         child: Text("Set of ${item?.displayVariant ?? ""}",style: StyleHelper.popinsStyle(fontWeight: FontWeight.bold,color: AppColor.GREEN_MEDIUM,fontSize: 10.0),),
//                       ),
//                       // child: Center(
//                       //   child: Text("ADD",style: StyleHelper.popinsStyle(fontWeight: FontWeight.w600,color: AppColor.GREEN_MEDIUM),),
//                       // ),
//                     ),
//                   ),
                  
//                   Positioned(
//                     left: -15,
//                     top: 0,
//                     child: DoubleHelper.convert_string_to_double(string: "${item?.discountPercent ?? "0"}") > 0 ? Container(
//                       width: 100.0,
//                       height: 60.0,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/lable.png"),
//                           fit: BoxFit.fill
//                         ),
//                       ),
//                       padding: EdgeInsets.only(bottom: 10.0,right: 10.0),
//                       child: Center(child: Transform.rotate(angle: -0.1,child: Text("${item?.discountPercent ?? "0"}% OFF",style: StyleHelper.popinsStyle(color: AppColor.WHITE,fontWeight: FontWeight.bold,fontSize: 14.0)))),
//                     ) : SizedBox()
//                     // child: Image.asset("assets/images/lable.png",height: 60.0,),
//                   ),

//                   Positioned(
//                     top: 5.0,
//                     right: 5.0,
//                     child: isShowWishlistButton == true ? CustomInkWell(
//                       onTap: (){
//                         if(tapOnWishlistIcon != null){
//                           tapOnWishlistIcon!(item?.productId);
//                         }
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: AppColor.WHITE,
//                           shape: BoxShape.circle,
//                         ),
//                         padding: EdgeInsets.all(4.0),
//                         child: Icon(Icons.favorite,size: 20.0,color: AppColor.PRIMARY_COLOR,),
//                       ),
//                     ) : SizedBox(),
//                   ),
//                 ],
//               ),
//             ),
            
//             AddVerticalSpacing(10.0),
//             // Text("${AppConstants.CURRENCY_SYMBOL} 17",style: StyleHelper.popinsStyle(fontWeight: FontWeight.bold,color: AppColor.GREEN_MEDIUM,fontSize: 16.0),),
//             RichText(
//               text: TextSpan(
//                 text: "",
//                 children: [
//                   TextSpan(
//                     text: "${AppConstants.CURRENCY_SYMBOL} ${item?.saleRate ?? "0"}  ",
//                     style: StyleHelper.popinsStyle(fontWeight: FontWeight.bold,color: AppColor.GREEN_MEDIUM,fontSize: 16.0),
//                   ),
//                   TextSpan(
//                     text: "${AppConstants.CURRENCY_SYMBOL} ${item?.mrp ?? "0"}",
//                     style: StyleHelper.popinsStyle(fontWeight: FontWeight.w500,color: AppColor.TEXT_GREY,fontSize: 13.0,decoration: TextDecoration.lineThrough),
//                   ),
//                 ]
//               ),
//             ),
//             Text(item?.productName ?? "",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w500),maxLines: 3,overflow: TextOverflow.ellipsis,),
//             AddVerticalSpacing(3.0),
//             Text(item?.variantName ?? "",style: StyleHelper.popinsStyle(fontSize: 11.0,fontWeight: FontWeight.w500,color: AppColor.TEXT_GREY),maxLines: 1,overflow: TextOverflow.ellipsis),
//             DoubleHelper.convert_string_to_double(string: "${item?.ratingStar ?? "0"}") > 0 ? RichText(
//               text: TextSpan(
//                 text: "",
//                 children: [
//                   WidgetSpan(
//                     child: Icon(Icons.star,color: AppColor.ORANGE_PENDING,size: 18.0,)
//                   ),
//                   TextSpan(
//                     text: " ${item?.ratingStar ?? ""}",
//                     style: StyleHelper.popinsStyle(fontSize: 13.0,color: AppColor.TEXT_GREY,fontWeight: FontWeight.w500),
//                   ),
//                   TextSpan(
//                     text: " (${StringsHelper.formatShortIndianNumber("${item?.totalRatingNo ?? "0"}")})",
//                     style: StyleHelper.popinsStyle(fontSize: 10.0,color: AppColor.TEXT_GREY,fontWeight: FontWeight.w500),
//                   ),
//                 ]
//               ),
//             ) : SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }