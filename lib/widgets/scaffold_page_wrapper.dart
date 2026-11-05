// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/images.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart'; 

class PageWrapper extends StatelessWidget {
  final Widget? child,bottomNavigationBar;
  final bool? isShowBg; 
  const PageWrapper({super.key,this.child,this.bottomNavigationBar,this.isShowBg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(
                <double>[
                  1.2, 0,   0,   0, -50,
                  0,   1.2, 0,   0, -50,
                  0,   0,   1.2, 0, -50,
                  0,   0,   0,   1,   0,
                ],
              ),
              child: Image.asset(
                AppImage.BG_TWO,
                width: ScreenHelper().get_width(context),
                height: ScreenHelper().get_height(context),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned.fill(
            child: isShowBg == true ? SizedBox() : Container(
              decoration: BoxDecoration(
                color: AppColor.CARD_COLOR
                // color: AppColor.BLACK.withValues(alpha: 0.85)
              ),
            ),
          ),

          Positioned.fill(
            child: child ?? SizedBox()
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}


class PageWrapperForm extends StatelessWidget {
  final String? title;
  final Widget? child,bottomNavigationBar;
  const PageWrapperForm({super.key,this.title,this.child,this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 160.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImage.APP_BAR_BG,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){
                      context.pop();
                    },
                    icon: Icon(Iconsax.arrow_left,color: AppColor.WHITE,),
                  ),
                  Expanded(
                    child: Text(title ?? "",style: GoogleFonts.poppins(fontSize: 15.0,color: AppColor.WHITE,fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            )
          ),
          Positioned(
            top: 110.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)
                ),
                image: DecorationImage(
                  image: AssetImage(AppImage.FORM_BG),
                  fit: BoxFit.cover,
                )
              ),
              child: child ?? SizedBox()
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
 