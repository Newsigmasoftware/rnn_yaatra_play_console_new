// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
import 'package:google_fonts/google_fonts.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
// import 'package:tiore/view_models/product_view_models/product_detail_view_model.dart';
// import 'package:tiore/views/cart/view_cart.dart';


class ScPageView extends ConsumerStatefulWidget {
  final AppBar? appBar;
  final Widget? child;
  final Widget? bottomNavigationBar;
  final Color? safeAreaColor;
  final onQtyIncrement,onQtyDecrement,selected_quantity,container_width,is_expanded,cart_list,start_animation,animtaion_postion,animtaion_postion_left;
  const ScPageView({super.key,this.appBar,this.child,this.bottomNavigationBar,this.safeAreaColor,this.onQtyIncrement,this.onQtyDecrement,this.selected_quantity,this.container_width,this.is_expanded,this.cart_list,this.start_animation,this.animtaion_postion,this.animtaion_postion_left});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScPageViewState();
}

class _ScPageViewState extends ConsumerState<ScPageView> {

  // final ProductDetailViewModel productDetailViewModel = ProductDetailViewModel();

  @override
  Widget build(BuildContext context) {
    // var selected_quantity = ref.watch(productDetailViewModel.quantity_state);
    // var selected_variant_index = ref.watch(productDetailViewModel.selected_variant_index_state);
    // var start_animation = ref.watch(productDetailViewModel.start_animation_state);
    // var animtaion_postion = ref.watch(productDetailViewModel.animtaion_postion_state);
    // var animtaion_postion_left = ref.watch(productDetailViewModel.animtaion_postion_left_state);
    // var container_width = ref.watch(productDetailViewModel.container_width_state);
    // var is_expanded = ref.watch(productDetailViewModel.is_expanded_state);
    // var cart_list = ref.watch(productDetailViewModel.cart_list_state);
      return Container(
        color: widget.safeAreaColor ?? Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: widget.appBar,
            bottomNavigationBar: widget.bottomNavigationBar,
            body: Stack(
              children: [
                // Positioned(
                //   left: -20,
                //   right: -20,
                //   top: -60,
                //   child: Image.asset("assets/images/splash_bg.png",width: Get.width*2,fit: BoxFit.cover,height: 150.0,)),
                // Positioned.fill(
                //   child: Container(
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //         colors: [
                //           AppColor.SCCAFOLD_BG.withValues(alpha: 0.88),
                //           AppColor.SCCAFOLD_BG.withValues(alpha: 0.1),
                //         ]
                //       )
                //     ),
                //   ),
                // ),
                
                Positioned.fill(
                  child: widget.child ?? SizedBox(),
                ),
                Positioned(
                  bottom: ScreenHelper().get_height(context)*0.1,
                  left: 0,
                  right: 0,
                  child: (widget.selected_quantity ?? 0) > 0 ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 0,
                        child: InkWell(
                          onTap: (){
                            // Get.to(()=> ViewCart(),transition: Transition.size);
                          },
                          borderRadius: BorderRadius.circular(70.0),
                          child: FadeInUp(
                            child: AnimatedContainer(
                              height: 50.0,
                              width: widget.container_width,
                              duration: Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: AppColor.PRIMARY_COLOR,
                                borderRadius: BorderRadius.circular(70.0)
                                // shape: BoxShape.circle,
                              ),
                              child: !widget.is_expanded ? Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.PRIMARY_COLOR,width: 2),
                                    borderRadius: BorderRadius.circular(100.0)
                                  ),
                                  height: 45.0,
                                  width: 45.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.network("https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=450/app/images/products/sliding_image/627a.jpg?ts=1699339837",height: 45.0,width: 45.0,fit: BoxFit.cover,)),
                                ),
                              ) : Row(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        FadeInLeft(
                                          from: 10.0,
                                          child: SizedBox(
                                            height: 40,
                                            // child: Stack(
                                            //   children: cart_list.map((e) {
                                            //     return Text(e.toString(),style: TextStyle(color: AppColor.WHITE),);
                                            //   }).toList(),
                                            // ),
                                            child: Stack(
                                              children: List.generate(widget.cart_list.length, (index) {
                                                int reverseIndex = 2 - index; // reverse the order
                                                return Positioned(
                                                  right: widget.selected_quantity == 1 ? 20 : widget.selected_quantity == 2 ? reverseIndex * 20 :  reverseIndex * 20, // stack from right
                                                  // right: selected_quantity == 1 ? 20 : selected_quantity == 2 ? reverseIndex * 20 :  reverseIndex * 30, // stack from right
                                                  child: Container(
                                                    height: 40.0,
                                                    width: 40.0,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.white, width: 2.0),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(70.0),
                                                      child: Image.network(
                                                        "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=450/app/images/products/sliding_image/627a.jpg?ts=1699339837",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                        ),
                          
                                        widget.start_animation ? AnimatedPositioned(
                                          top: widget.animtaion_postion,
                                          left: widget.animtaion_postion_left,
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.easeInQuad,
                                          child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColor.WHITE,width: 2.0),
                                            shape: BoxShape.circle
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(70.0),
                                            child: Image.network("https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=450/app/images/products/sliding_image/627a.jpg?ts=1699339837",height: 36.0,width: 36.0,))),
                                          // child: Stack(
                                          //   children: [
                                              
                                              
                                          //     // !widget.start_animation ? Lottie.asset(AppLottie.CART_ITEM_REMOVE,height: 40.0,width: 40.0,repeat: true) : SizedBox(),
                                          //   ],
                                          // ),
                                        ) : SizedBox(),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ZoomIn(
                                      child: Column(
                                        crossAxisAlignment: widget.selected_quantity == 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("View Cart",style: GoogleFonts.poppins(fontSize: 13,color: AppColor.WHITE,fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                          Text("5 ITEMS",style: GoogleFonts.poppins(fontSize: 13,color: AppColor.WHITE,fontWeight: FontWeight.w400),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FadeInRight(
                                    from: 10,
                                    child: CircleAvatar(
                                      backgroundColor: const Color.fromARGB(255, 137, 201, 99).withValues(alpha: .3),
                                      child: Icon(Icons.arrow_forward_ios,size: 18,color: AppColor.WHITE,),
                                    ),
                                  ),
                                  AddHorizontalSpacing(6),
                                ],
                              ),
                            )
                          ),
                        ),
                      ),
                    ],
                  ) : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      );
  }
}