// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:go_router/go_router.dart';
import 'package:rnn_yaatra/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/images.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';


Widget primaryButtonGradiant(BuildContext context,{String? title,double? height, double? width, VoidCallback? onTap,bool? is_disable,bgColor,textColor,bool? is_box_shadow_hide,Widget? child}){
  return InkWell(
    onTap: is_disable == true ? (){} : onTap ?? (){},
    borderRadius: BorderRadius.circular(100),
    child: Container(
      decoration: is_box_shadow_hide == true ? BoxDecoration(
          gradient: LinearGradient(
            colors: is_disable == true ? [
              AppColor.GREY_MEDIUM,
              AppColor.GREY_MEDIUM
            ] : [
            AppColor.SECONDARY_COLOR,
              AppColor.SECONDARY_COLOR,
            ]
          ),
          // color: is_disable?.value == true ? AppColor.GREY_MEDIUM : bgColor ?? AppColor.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(10),
      ) : BoxDecoration(
          gradient: LinearGradient(
            colors: is_disable == true ? [
              AppColor.GREY_MEDIUM,
              AppColor.GREY_MEDIUM
            ] : [
              AppColor.SECONDARY_COLOR,
              AppColor.SECONDARY_COLOR,

            // Color(0xffe96b07),
            // Color(0xfff5b691)
            ]
          ),
          // color: is_disable?.value == true ? AppColor.GREY_MEDIUM : bgColor ?? AppColor.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: is_disable == true ? AppColor.GREY_MEDIUM : bgColor ?? AppColor.SECONDARY_COLOR.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0,4)
            )
          ]
      ),
      height: height ?? 47.0,
      width: width ?? ScreenHelper().get_width(context),
      child: child ?? Center(
        child: Text(title ?? "",style: TextStyle(color: textColor ?? AppColor.WHITE,fontWeight: FontWeight.w600),),
      ),
    ),
  );
}

Widget primaryButton({BuildContext? context, String? title,double? height, double? width, VoidCallback? onTap,bool? is_disable,bgColor,textColor,bool? is_box_shadow_hide,fontSize,bool? isLoading}){
  bool disabled = (is_disable == true) || (isLoading == true);
  return InkWell(
    onTap: disabled ? (){} : onTap ?? (){
      AppNav.back();
    },
    borderRadius: BorderRadius.circular(100),
    child: Container(
      decoration: is_box_shadow_hide == true ? BoxDecoration(
          color: disabled ? AppColor.GREY_MEDIUM : bgColor ?? AppColor.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(10),
      ) : BoxDecoration(
          color: disabled ? AppColor.GREY_MEDIUM : bgColor ?? AppColor.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: disabled ? AppColor.GREY_MEDIUM : bgColor ?? AppColor.PRIMARY_COLOR.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0,4)
            )
          ]
      ),
      height: height ?? 47.0,
      width: width ?? ScreenHelper().get_width(navigatorKey.currentContext),
      child: Center(
        child: isLoading == true
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                title ?? "",
                style: TextStyle(
                  color: textColor ?? AppColor.WHITE,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize ?? 13.0,
                ),
              ),
      ),
    ),
  );
}


Widget primaryButtonBG({BuildContext? context,String? title,double? height, double? width, VoidCallback? onTap,bool? is_disable,bgColor,textColor,bool? is_box_shadow_hide,Widget? widget}){
  return InkWell(
    onTap: is_disable == true ? (){} : onTap ?? (){
      AppNav.back();
    },
    // borderRadius: BorderRadius.circular(100),
    child: Container(
      width: width ?? ScreenHelper().get_width(context),
      height: height ?? 47.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(AppImage.BUTTON_BG),
          fit: BoxFit.fill
        ) 
      ),
      child: widget ?? Center(
        child: Text(title ?? "",style: TextStyle(color: textColor ?? AppColor.WHITE,fontWeight: FontWeight.w600),),
      ),
      // child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Icon(Icons.person,color: AppColor.WHITE,),
      //     AddHorizontalSpacing(10.0),
      //     Text("LOGIN",style: GoogleFonts.poppins(fontSize: 16.0,color: AppColor.WHITE,fontWeight: FontWeight.w600)),
      //   ],
      // ),
    ),
    // child: Container(
    //   decoration: is_box_shadow_hide == true ? BoxDecoration(
    //       color: is_disable == true ? AppColor.GREY_MEDIUM : bgColor ?? AppColor.PRIMARY_COLOR,
    //       borderRadius: BorderRadius.circular(10),
    //   ) : BoxDecoration(
    //       color: is_disable == true ? AppColor.GREY_MEDIUM : bgColor ?? AppColor.PRIMARY_COLOR,
    //       borderRadius: BorderRadius.circular(10),
    //       boxShadow: [
    //         BoxShadow(
    //             color: is_disable == true ? AppColor.GREY_MEDIUM : bgColor ?? AppColor.PRIMARY_COLOR.withOpacity(0.6),
    //             spreadRadius: 1,
    //             blurRadius: 10,
    //             offset: const Offset(0,4)
    //         )
    //       ]
    //   ),
    //   height: height ?? 47.0,
    //   width: width ?? ScreenHelper().get_width(context),
    //   child: Center(
    //     child: Text(title ?? "",style: TextStyle(color: textColor ?? AppColor.WHITE,fontWeight: FontWeight.w600),),
    //   ),
    // ),
  );
}


Widget back_button_white_bg({onTap,height,width,bool isRounded = false,Color? color,Color? iconColor}) {
  return InkWell(
    onTap: onTap ?? (){
      AppNav.back();
    },
    borderRadius: BorderRadius.circular(60.0),
    child: Container(
      decoration: isRounded ? BoxDecoration(
        color: color ?? AppColor.WHITE,
        // borderRadius: BorderRadius.circular(6),
        shape: isRounded ? BoxShape.circle : BoxShape.rectangle
      ) :  BoxDecoration(
        color: color ?? AppColor.WHITE,
        // borderRadius: BorderRadius.circular(6),
        
      ),
      height: height ?? 40,
      width: width ?? 40,
      padding: const EdgeInsets.only(left: 0),
      child: Center(child: Icon(Icons.arrow_back_rounded,color: iconColor ?? AppColor.PRIMARY_COLOR,size: 19,)),
    ),
  );
}

Widget back_button_primary_bg({onTap,bool isRounded = false,double? height,double? width,Color? color,Color? iconColor}) {
  return InkWell(
    onTap: onTap ?? (){
      navigatorKey.currentContext?.pop();
    },
    borderRadius: BorderRadius.circular(6),
    child: Container(
      decoration: isRounded ? BoxDecoration(
        color: color ?? AppColor.PRIMARY_COLOR,
        // borderRadius: BorderRadius.circular(6),
        // borderRadius: BorderRadius.circular(6),
        shape: isRounded ? BoxShape.circle : BoxShape.rectangle
      ) :  BoxDecoration(
        color: color ?? AppColor.PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(6),
        // borderRadius: BorderRadius.circular(6),
        
      ),
      // decoration: BoxDecoration(
      //   color: AppColor.PRIMARY_COLOR,
      //   borderRadius: BorderRadius.circular(6),
      // ),
      height: height ?? 40.0,
      width: width ?? 40.0,
      padding: const EdgeInsets.only(left: 0),
      child: Center(child: Icon(Icons.arrow_back_rounded,color: iconColor ?? AppColor.WHITE,size: 19,)),
    ),
  );
}

Widget back_button_bg({onTap,bool isRounded = false,double? height,double? width,Color? color,Color? iconColor}) {
  return InkWell(
    onTap: onTap ?? (){
      navigatorKey.currentContext?.pop();
    },
    borderRadius: BorderRadius.circular(6),
    child: Image.asset(AppImage.BACK_BUTTON,height: height ?? 45.0,width: width ?? 45.0,),
    // child: Container(
    //   decoration: isRounded ? BoxDecoration(
    //     color: color ?? AppColor.PRIMARY_COLOR,
    //     // borderRadius: BorderRadius.circular(6),
    //     // borderRadius: BorderRadius.circular(6),
    //     shape: isRounded ? BoxShape.circle : BoxShape.rectangle
    //   ) :  BoxDecoration(
    //     color: color ?? AppColor.PRIMARY_COLOR,
    //     borderRadius: BorderRadius.circular(6),
    //     // borderRadius: BorderRadius.circular(6),
        
    //   ),
    //   // decoration: BoxDecoration(
    //   //   color: AppColor.PRIMARY_COLOR,
    //   //   borderRadius: BorderRadius.circular(6),
    //   // ),
    //   height: height ?? 40.0,
    //   width: width ?? 40.0,
    //   padding: const EdgeInsets.only(left: 0),
    //   child: Center(child: Icon(Icons.arrow_back_rounded,color: iconColor ?? AppColor.WHITE,size: 19,)),
    // ),
  );
}


Widget primary_button_background({BuildContext? context,String? title,onTap,double? height,double? width,double? borderRadius,double? fontSize}) {
  return ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius ?? 15.0),
                    child: InkWell(
                      onTap: onTap ?? (){},
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        height: height ?? 55.0,
                        width:  width ?? ScreenHelper().get_width(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                            colors: [
                              AppColor.PRIMARY_COLOR.withValues(alpha: 0.8),
                              AppColor.PRIMARY_COLOR,
                            ]
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: -20,
                              right: 10,
                              child: Opacity(
                                opacity: 0.7,
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      colors: [
                                        Color(0xff43a1fd),
                                        Color(0xff43a1fd),
                                        Color(0xff3de3ef),
                                      ]
                                    )
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -20,
                              right: -10,
                              child: Opacity(
                                opacity: 0.7,
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      colors: [
                                        Colors.red,
                                        Color(0xff995efd),
                                      ]
                                    )
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              left: 15,
                              right: 15,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(title ?? "",style: GoogleFonts.poppins(color: AppColor.WHITE,fontWeight: FontWeight.w600,fontSize: fontSize ?? 15),)),
                                  CircleAvatar(
                                    backgroundColor: AppColor.WHITE,
                                    radius: 12.0,
                                    child: Icon(Icons.arrow_forward,color: AppColor.PRIMARY_COLOR,size: 20.0,),
                                  ),
                                  // AddHorizontalSpacing(10.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
}


Widget back_button_primary_new_bg({onTap}) {
  return InkWell(
    onTap: onTap ?? (){
      AppNav.back();
    },
    child: CircleAvatar(
      radius: 22,
      backgroundColor: AppColor.SECONDARY_COLOR,
      // backgroundColor: AppColor.SECONDARY_COLOR.withValues(alpha: .1),
      child: Icon(Iconsax.arrow_left,color: AppColor.WHITE,size: 21.0,),
    ),
  );
}

 
class Orange_gradiant_button extends StatelessWidget {
  final String? title;
  const Orange_gradiant_button({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper().get_width(context),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.ORANGE_PENDING,
            Colors.deepOrangeAccent
          ]
        ),
        borderRadius: BorderRadius.circular(8.0)
      ),
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title ?? "",style: GoogleFonts.poppins(fontSize: 14.0,color: AppColor.WHITE,fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}




Widget primaryButtonArrow({required BuildContext context,String? title,onTap,iconWidget,bool? isSecondaryColorApply,bool? isDisabled}){
  return CustomInkWell(
    onTap: onTap,
    child: Container(
      width: ScreenHelper().get_width(context),
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDisabled == true ? [
            AppColor.GREY_MEDIUM,
            AppColor.TEXT_GREY,
          ] : isSecondaryColorApply == true ? [
            AppColor.SECONDARY_COLOR_LIGHT,
            AppColor.SECONDARY_COLOR,
          ] : [
            AppColor.PRIMARY_COLOR,
            AppColor.PRIMARY_COLOR_DARK,
          ]
        )
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Text(title ?? "",style: StyleHelper.popinsStyle(color: AppColor.WHITE,fontWeight: FontWeight.w600,fontSize: 15.0)),
            ),
          ),
          Positioned(
            right: 10,
            top: 8,
            bottom: 8,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: iconWidget ?? Icon(Iconsax.arrow_right_14,color: AppColor.PRIMARY_COLOR_DARK,size: 18.0,fontWeight: FontWeight.bold,),
            ),
          )
          
        ],
      )
    ),
  );
}