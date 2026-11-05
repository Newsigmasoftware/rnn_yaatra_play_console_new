import 'package:animate_do/animate_do.dart';
import 'package:rnn_yaatra/helpers/app_storage.dart'; 
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/main.dart';
import 'package:rnn_yaatra/routing/app_router.dart'; 
import 'package:rnn_yaatra/constants/images.dart';  
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart'; 
import 'package:rnn_yaatra/constants/colors.dart';  
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';  

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      var mobileNo = await AppStorage.getUserID();
      if(!StringsHelper.is_empty_or_null("$mobileNo")){
        AppNav.go(context: navigatorKey.currentContext!,path: AppRouteString.Dashboard);
      }else{
        AppNav.go(context: navigatorKey.currentContext!,path: AppRouteString.Login);
      }

      // AppNav.go(context: navigatorKey.currentContext!,path: AppRouteString.Login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.WHITE,
      body: Hero(
        tag: 'splash_background',
        child: Stack(
          children: [
            // Positioned.fill(
            //   child: FadeInDown(
            //     from: 40.0, 
            //     child: Image.asset(AppImage.SPLASH_BG,width: ScreenHelper().get_width(context),fit: BoxFit.fill,)),
            //       // child: Image.asset(AppImage.TOP_DESIGN_BG2,width: ScreenHelper().get_width(context),height: 290.0,fit: BoxFit.fill,))),
            // ),
            
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffFFF8EB).withValues(alpha: 0.4)
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                AppImage.SPLASH_BOTTOM,
                width: ScreenHelper().get_width(context),
                fit: BoxFit.fill,
                height: 250.0
              ),
            ),

            Positioned(
              top: 0,
              left: ScreenHelper().get_width(context)*0.2,
              right: 0,
              child: SafeArea(child: Image.asset(AppImage.TITLE_SEPARATOR,width: ScreenHelper().get_width(context))),
            ),
            Positioned.fill(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ZoomIn(child: Image.asset(AppImage.LOGO,width: ScreenHelper().get_width(context)*0.7)),
                  ],
                )
              ),
            ),

            // Positioned(
            //   bottom: 20,
            //   left: 0,
            //   right: 0,
            //   child: SafeArea(
            //     child: Center(child: Text("Version ${GetPlatform.isAndroid ? AppConstants.ANDROID_APP_VERSION  : AppConstants.IOS_APP_VERSION}",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w600,color: AppColor.WHITE),)),
            //   ),
            // ),
          ],
        ),
      )
    );
  }
}


class HexagonIconContainer extends StatelessWidget {
  final double size;
  final Color color;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  const HexagonIconContainer({
    Key? key,
    this.size = 64,
    this.color = Colors.blue,
    required this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // This container provides a soft outer shadow for the hexagon by offsetting behind
        Positioned(
          top: 4,
          left: 4,
          right: 4,
          bottom: 4,
          child: ClipPath(
            clipper: _HexagonClipper(),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    spreadRadius: 4.0,
                    blurRadius: 20.0,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: _HexagonClipper(),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                  color: AppColor.GREY_MEDIUM,
                  spreadRadius: 2.0,
                  blurRadius: 5.0,
                  offset: Offset(0, 3)
                ),
                // Extra shadow for more pop
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  spreadRadius: 0.0,
                  blurRadius: 8.0,
                  offset: Offset(0, 2)
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
          ),
        ),
      ],
    );
  }
}

class _HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double w = size.width;
    final double h = size.height;

    path.moveTo(w * 0.25, 0);
    path.lineTo(w * 0.75, 0);
    path.lineTo(w, h * 0.5);
    path.lineTo(w * 0.75, h);
    path.lineTo(w * 0.25, h);
    path.lineTo(0, h * 0.5);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_HexagonClipper oldClipper) => false;
}